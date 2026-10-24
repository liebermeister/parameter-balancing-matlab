Parameter balancing for kinetic metabolic models
================================================

Matlab functions for parameter balancing

### Convenience functions

  * `parameter_balancing`               - Simple wrapper function, takes file names as input arguments
  * `parameter_balancing_sbtab`         - Parameter balancing (model is read from an SBtab or SBML file)
  * `parameter_balancing_thermodynamic` - Parameter balancing for computing thermodynamically feasible concentrations
  * `parameter_balancing_kinetic`       - Parameter balancing for kinetic constants (and possibly metabolic state)

The calculation procedure can be customised. For a list of options, see `parameter_balancing_options.m`.

### Demo scripts (directory `demo`)

  * `demo_parameter_balancing`        - Model E. coli central carbon metabolism from Noor et al. (2016)
  * `demo_pb_ecoli_noor_2016`         - Model E. coli central carbon metabolism from Noor et al. (2016)
  * `demo_pb_ecoli_wortel_2018`       - Model E. coli central carbon metabolism from Wortel et al. (2018)
  * `demo_pb_sbtab`                   - Example models from the website www.parameterbalancing.net

### Tests (directory `tests`)

  * `pb_run_tests`                    - Runs all example models and the main code paths; use it to check your installation
  * `pb_test_ecoli_iCH360`            - Test with the large model iCH360 (called by `pb_run_tests`; takes very long)

### Configuration files

Default configuration files with standard parameters for parameter balancing (`pb_prior.tsv` and `pb_options.tsv`) can be found in the `config` directory.

### Example models

Example models and corresponding data files can be found in the `models` directory (one subdirectory per model).
The function `pb_example_files` returns the file names for a given example model.

(C) 2018-2026 Wolfram Liebermeister  <wolfram.liebermeister@gmail.com>
