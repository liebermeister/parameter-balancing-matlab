function d = pb_basedir()

% PB_BASEDIR - Return the main directory of the parameter balancing repository
%
% d = pb_basedir()

d = fileparts(fileparts(fileparts(which(mfilename))));
