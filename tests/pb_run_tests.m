function all_passed = pb_run_tests(verbose)

% PB_RUN_TESTS Smoke tests for parameter balancing: run all example models and the main code paths
%
% all_passed = pb_run_tests(verbose)
%
% Runs parameter balancing for all example models in the directory "resources/models", and
% tests some options (posterior sampling, log file, posterior matrices) and the
% wrapper functions parameter_balancing_kinetic and parameter_balancing_thermodynamic.
% Finally, the large model iCH360 is tested (see pb_test_ecoli_iCH360; this takes very long).
% Output files are written to a temporary directory, which is deleted afterwards.
%
% verbose (optional, default 0): show the output of parameter balancing
%
% Returns true if all tests passed

addpath(genpath(fullfile(fileparts(mfilename('fullpath')), '..', 'parameter-balancing')));

eval(default('verbose','0'));

examples = {'pfk', 'teusink', 'hynne', 'hynne_inh', 'jiang', 'ecoli_noor_2016', 'ecoli_noor_2016_glycolysis', 'ecoli_wortel_2018'};

outdir = tempname;
mkdir(outdir);
cleanup = onCleanup(@() rmdir(outdir,'s'));

fig_visible = get(0,'DefaultFigureVisible');
set(0,'DefaultFigureVisible','off');
restore_figures = onCleanup(@() set(0,'DefaultFigureVisible',fig_visible));

options = struct('flag_check', 0, 'verbose', verbose, 'preferred_data_element_ids', 'sbml');

tests = {};

% --- all example models
for it = 1:length(examples),
  tests(end+1,:) = {examples{it}, @() test_example(examples{it}, outdir, options)};
end

% --- options: posterior samples, log file, posterior matrices
tests(end+1,:) = {'option n_samples',                 @() test_example('pfk', outdir, join_struct(options, struct('n_samples', 3)))};
tests(end+1,:) = {'option write_log_file',            @() test_example('pfk', outdir, join_struct(options, struct('write_log_file', 1)))};
tests(end+1,:) = {'option export_posterior_matrices', @() test_example('pfk', outdir, join_struct(options, struct('export_posterior_matrices', 1)))};
tests(end+1,:) = {'option run_variability_analysis=0',@() test_example('pfk', outdir, join_struct(options, struct('run_variability_analysis', 0)))};
tests(end+1,:) = {'option ignore_all_constraints',    @() test_example('pfk', outdir, join_struct(options, struct('ignore_all_constraints', 1)))};
tests(end+1,:) = {'no output file',                   @() test_example('pfk', [], options)};

% --- wrapper functions
tests(end+1,:) = {'parameter_balancing_kinetic',       @() test_kinetic(options)};
tests(end+1,:) = {'parameter_balancing_thermodynamic', @() test_thermodynamic(options)};

% --- large model (takes very long)
tests(end+1,:) = {'ecoli_iCH360 (large model)',        @() pb_test_ecoli_iCH360(options)};

n_failed = 0;
for it = 1:size(tests,1),
  try
    if strcmp(tests{it,1}, 'ecoli_iCH360 (large model)'),
      fprintf('  Running test "%s" - this takes very long ...\n', tests{it,1});
    end
    if verbose,
      tests{it,2}();
    else
      evalc('tests{it,2}()');
    end
    fprintf('  PASS  %s\n', tests{it,1});
  catch err
    n_failed = n_failed + 1;
    fprintf('  FAIL  %s\n        %s\n', tests{it,1}, err.message);
    for k = 1:min(3,length(err.stack)),
      fprintf('        at %s (line %d)\n', err.stack(k).name, err.stack(k).line);
    end
  end
end

fprintf('\n%d of %d tests passed\n', size(tests,1) - n_failed, size(tests,1));

all_passed = n_failed == 0;


% -------------------------------------------------------------------

function test_example(example, outdir, options)

[model_name, model_file, data_file, prior_file, options_file] = pb_example_files(example);

if isempty(outdir),
  output_file = [];
else
  output_file = fullfile(outdir, [example '.tsv']);
end

[balanced_parameters_SBtab, ~, network, r_mode] = parameter_balancing(model_file, output_file, data_file, prior_file, options_file, model_name, options);

assert(isstruct(balanced_parameters_SBtab), 'No SBtab output table');
assert(all(isfinite(r_mode.Keq)) && all(r_mode.Keq > 0), 'Invalid equilibrium constants');
assert(length(r_mode.Keq) == size(network.N,2), 'Wrong number of equilibrium constants');

if length(output_file),
  assert(exist(fullfile(outdir, [example '_balanced_parameters.tsv']), 'file') == 2, 'Output file missing');
end


% -------------------------------------------------------------------

function test_kinetic(options)

[~, model_file, data_file] = pb_example_files('ecoli_noor_2016');
network = network_import_model(model_file, struct('load_quantity_table',0));
r = parameter_balancing_kinetic(network, data_file, options);
assert(all(isfinite(r.Keq)) && all(r.Keq > 0), 'Invalid equilibrium constants');


% -------------------------------------------------------------------

function test_thermodynamic(options)

[~, model_file, data_file] = pb_example_files('ecoli_noor_2016');
network = network_import_model(model_file, struct('load_quantity_table',0));
[nm,nr] = size(network.N);
v = ones(nr,1);
[c, mu0, Keq, A] = parameter_balancing_thermodynamic(network, v, data_file, options);
assert(all(c > 0), 'Invalid concentrations');
assert(all(sign(A(v~=0)) == sign(v(v~=0))), 'Reaction affinities do not match flux directions');
