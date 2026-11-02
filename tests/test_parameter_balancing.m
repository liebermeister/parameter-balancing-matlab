% Run all tests for parameter balancing (see pb_run_tests); called by runtests('tests')

addpath(fileparts(mfilename('fullpath')));

%% All example models and main code paths
assert(pb_run_tests);
