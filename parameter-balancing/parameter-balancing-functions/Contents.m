% Parameter balancing: internal functions
%
%   pb_basedir                 - Return the main directory of the parameter balancing repository
%   pb_calculation             - Parameter balancing based on vectors and matrices in data structure 'task'
%   pb_check                   - Check balanced parameters
%   pb_compare_python_matlab   - Compare the output files of the Matlab and Python versions of parameter balancing
%   pb_constrained_sampling
%   pb_construct_Q_matrix
%   pb_enforce_flux_directions
%   pb_example_files           - File names of the example models
%   pb_graphics1               - Plot prior, data and posterior values of basic, data and model quantities
%   pb_kinetic_data_adjust     - Adjust kinetic data according to the options
%   pb_kinetic_data_show       - Display kinetic data
%   pb_model_matrices          - Compute the matrices that are used to express dependencies between model quantities
%   pb_output                  - Convert parameter sets, previously obtained by parameter balancing, into the format
%   pb_parameter_prior_adjust  - Adjust the prior table according to the options
%   pb_process_matrix
%   pb_quantities
%   pb_quantity_numbers        - Count how many quantities of a certain type appear in a model
%   pb_resourcedir             - Return the directory 'resources' (example models and data) of the parameter balancing repository
%   pb_sample_models           - Build kinetic models from sampled kinetic constants and compute their fluxes
%   pb_task                    - Prepare a parameter balancing task
%   pb_update_options          - Complete the options for parameter balancing and make them consistent
