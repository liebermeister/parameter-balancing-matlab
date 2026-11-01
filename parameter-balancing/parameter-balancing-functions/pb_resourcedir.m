function d = pb_resourcedir()

% d = pb_resourcedir()
%
% Return the directory 'resources' (example models and data) of the parameter balancing repository

d = fileparts(fileparts(fileparts(which(mfilename))));
d = [d filesep 'resources'];
