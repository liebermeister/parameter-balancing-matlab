function d = pb_resourcedir()

% PB_RESOURCEDIR - Return the directory 'resources' (example models and data) of the repository
%
% d = pb_resourcedir()

d = [pb_basedir filesep 'resources'];
