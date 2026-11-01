% ------------------------------------------------
% Parameter balancing for kinetic metabolic models
% ------------------------------------------------
%
% Convenience functions
%
%   parameter_balancing               - Simple wrapper function, takes file names as input arguments
%   parameter_balancing_sbtab         - Parameter balancing (model is read from SBtab or SBML file)
%   parameter_balancing_thermodynamic - Parameter balancing for thermodynamically feasible concentrations
%   parameter_balancing_kinetic       - Parameter balancing for kinetic constants (and possibly metabolic state)
%
% The calculation procedure can be customised. For a list of options, see "parameter_balancing_options.m"
%
% Demo scripts (directory "demo")
%
%   demo_pb                         - Model E. coli central carbon metabolism from Noor et al. (2016) [SBML input file]
%   demo_pb_escherichia_coli_noor_2016         - Model E. coli central carbon metabolism from Noor et al. (2016)
%   demo_pb_escherichia_coli_wortel_2018       - Model E. coli central carbon metabolism from Wortel et al. (2018)
%   demo_pb_sbtab                   - Example models from the website www.parameterbalancing.net
%
% Tests (directory "tests" at the top of the repository)
%
%   pb_run_tests                    - Run all example models and the main code paths
%   pb_test_escherichia_coli_iCH360            - Test with the large model iCH360 (takes very long)
%
% Configuration files
%
%   The default options file (pb_options.tsv) can be found in the "config" directory.
%   The default prior table is part of the Metabolic Network Toolbox (see mnt_prior_file).
%
% Example models
%
%   Example models and corresponding data files can be found in the directory "resources/models"
%   (one subdirectory per model; see pb_example_files.m).
%
% (C) 2018-2026 Wolfram Liebermeister  <wolfram.liebermeister@gmail.com>
