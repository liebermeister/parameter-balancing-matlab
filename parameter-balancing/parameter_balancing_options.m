function options = parameter_balancing_options()

% PARAMETER_BALANCING_OPTIONS Options for parameter balancing - Data structure with default values
%
% options = parameter_balancing_options()
%
% The default values are read from the SBtab Config file 'parameter-balancing_Config.tsv'
% (in the same folder as this function; TableID 'ConfigurePB'). To change the defaults, edit this file.
% The fields of the options struct are:
%
% General options
%
%   options.verbose                      flag: verbose output
%   options.parameter_prior_file         default prior file (see parameter_balancing_prior.m)
%   options.kinetics                     kinetics for SBML output model (e.g. 'cs': common modular rate law)
%   options.parametrisation              type of model parameterisation
%   options.reaction_units               physical unit of reaction rates: 'concentration per time' or 'amount per time'
%   options.GFE_fixed                    fixed GFE values
%   options.insert_pseudo_values         flag: replace missing data values by pseudo values
%   options.use_deltaG0_data             flag: use DeltaG0 data even if they are marked as UseAsPriorInformation=0 in the prior file
%   options.include_metabolic            flag: consider concentrations in parameter balancing
%   options.include_enzyme_conc          flag: consider enzyme concentrations in parameter balancing
%   options.enzymes_explicit             flag: disregard maximal velocities in parameter balancing
%   options.enforce_flux_directions      flag: set constraints to realise predefined flux directions
%   options.adjust_to_fluxes             flag: apply postprocessing to yield predefined fluxes (see pb_output)
%   options.v                            flux vector used by options "enforce_flux_directions" and "adjust_to_fluxes"
%   options.ignore_all_constraints       flag: run parameter balancing without constraints
%   options.n_samples                    0: no sampling; n>1: generate n sampled parameter sets
%   options.preferred_data_element_ids   data columns to be used for mapping ('id': columns "Reaction" or "Compound"; alternatives 'sbml_id', 'kegg_id')
%   options.use_sbml_ids                 (redundant with preferred_data_element_ids; field used internally)
%   options.use_kegg_ids                 (redundant with preferred_data_element_ids; field used internally)
%   options.complete_std_by_DataGeomStd  flag: when completing missing data standard deviations, use DataGeomStd instead of DataStd
%   options.dg_precision_file            filename for .mat file containing a precision matrix (inverse covariance matrix) 'dg_precision' for (some of the) delta G of reactions,
%                                        and a char array or string array of the reaction names corresponding to the rows and columns of this matrix
%   options.use_python_version_defaults  flag: change default settings to obtain the same results as in the Parameter Balancing python version
%   options.run_variability_analysis     flag: run variability analysis based on PB constraints (not on distributions)
%   options.write_log_file               flag: write log file
%   options.enforce_ranges               flag: enforce feasible ranges when loading orginal kinetic data
%   options.data_table_id                TableID of the data table (needed only if the data file contains several tables)
%
% Options to override bounds (given in prior or data file)
%
%   options.conc_min              concentration default lower bound (mM)
%   options.conc_max              concentration default upper bound (mM)
%   options.kcat_prior_median     predefined kcat prior median value
%   options.kcat_prior_log10_std  predefined kcat prior log 10 std dev
%   options.kcat_usage            flag: use given kcat values ('use')
%   options.KM_lower              KM value default lower bound (mM)
%   options.KM_upper              KM value default upper bound (mM)
%   options.Keq_upper             Keq value default upper bound
%   options.Keq_lower             Keq value default lower bound
%   options.Keq_given             Keq values (given vector)
%   options.kcat_lower            kcat value default lower bound (1/s)
%   options.kcatr_lower           reverse kcat value default lower bound (1/s)
%   options.kcat_upper            kcat value default upper bound (1/s)
%
%   options.epsilon               epsilon value for slightly stricter constraints (see pb_calculation.m)
%
% Options for wrapper functions
%
%   options.use_pseudo_values     flag: use pseudo values
%   options.use_data              flag: use data table
%   options.flag_check            flag: check results and show diagnostic plots
%
% Extra options used in 'parameter_balancing_kinetic'
%
%   options.fix_irreversible_reactions  flag: after PB, determine supposedly irreversible reactions and set their
%                                       backward (or forward, if irreversible reverse reaction) kcat values to 0
%
% Extra options used in 'parameter_balancing_thermodynamic'
%
%   options.ind_water                   indices of metabolites representing water
%   options.set_water_conc_to_one       flag: preprocessing: set water concentration to 1 and remove it
%                                       from the stoichiometric matrix
%   options.data_refer_to_molar         flag: concentrations in molar (default: millimolar)
%   options.A_max                       A upper bound (kJ/mol)
%   options.A_min                       A lower bound (kJ/mol)
%   options.A_fix                       fixed A values (vector)
%   options.A_lower                     A lower bounds (vector)
%   options.A_upper                     A upper bounds (vector)
%   options.c_min                       concentration lower bounds (vector)
%   options.c_max                       concentration upper bounds (vector)
%   options.c_fix                       fixed concentrations (vector)
%   options.c_fix_strict                flag: strictly fix concentrations (otherwise, allow for a range)
%   options.u_max                       enzyme concentration upper bound (mM)
%   options.u_min                       enzyme concentration lower bound (mM)
%   options.variability                 variability of known concentrations
%   options.sigma_mu0                   error of mu0 values (kJ/mol); 3 for alberty data
%   options.virtual_reactions           virtual reactions (cell array)
%   options.parameter_prior_filename    file containing the prior table to be used (default: options.parameter_prior_file)
%   options.test_v_for_being_feasible   flag: run previous test for feasible v
%   options.fix_Keq_in_sampling         flag: keep Keq values fixed in sampling
%   options.write_all_quantities        which quantities to list in output table: 'no', 'many', 'all', 'only_kinetic'
%   options.export_posterior_matrices   flag: export posterior (described by matrices) to files
%
% CURRENTLY NOT USED (used in python code only; see config/pb_options.tsv):
%   options.ph
%   options.temperature
%   options.overwrite_kinetics
%   options.cell_volume
%   options.enzyme_prefactor
%   options.default_inhibition
%   options.default_activation
%   options.model_name
%   options.boundary_value

options = load_config_table(fullfile(fileparts(mfilename('fullpath')), 'parameter-balancing_Config.tsv'));
