function pb_test_escherichia_coli_iCH360(options)

% PB_TEST_ECOLI_ICH360 Test parameter balancing with the large E. coli model iCH360 (349 reactions)
%
% pb_test_escherichia_coli_iCH360(options)
%
% options (optional): options for parameter balancing (see parameter_balancing_options)
%
% The variability analysis is switched off, because for a model of this size
% it would take very long (more than 30 minutes)

eval(default('options','struct'));

warning('pb_test_escherichia_coli_iCH360: The iCH360 model is large (349 reactions). This calculation takes very long (about one minute, without variability analysis).');

options = join_struct(options, struct('run_variability_analysis', 0, 'preferred_data_element_ids', 'sbml'));

[model_name, model_file, data_file, prior_file, options_file] = pb_example_files('escherichia-coli_iCH360');

[balanced_parameters_SBtab, ~, network, r_mode] = parameter_balancing(model_file, [], data_file, prior_file, options_file, model_name, options);

assert(isstruct(balanced_parameters_SBtab), 'No SBtab output table');
assert(length(r_mode.Keq) == size(network.N,2), 'Wrong number of equilibrium constants');
assert(all(isfinite(r_mode.Keq)) && all(r_mode.Keq > 0), 'Invalid equilibrium constants');
