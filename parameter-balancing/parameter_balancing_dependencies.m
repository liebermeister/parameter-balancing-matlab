function parameter_balancing_dependencies()

% parameter_balancing_dependencies()
%
% Check whether the packages used by Parameter balancing for Matlab are installed in the required versions
% (see README.md for details)

if ~exist('matlab_utils_installed','file')
  warning('Please install the Matlab utility functions (https://github.com/liebermeister/matlab-utils) - They are required.');
end

if exist('package_version_check','file')
  package_version_check('The Matlab utility functions', 'matlab_utils_version', '1.0.0');
end

if ~exist('mnt_version','file')
  warning('Please install the Metabolic Network Toolbox (https://github.com/liebermeister/metabolic-network-toolbox) - It is required.');
end

if exist('package_version_check','file')
  package_version_check('The Metabolic Network Toolbox', 'mnt_version', '1.3.0');
end

if ~exist('sbtab_version','file')
  warning('Please install SBtab for Matlab (https://github.com/liebermeister/sbtab-matlab) - It is required.');
end

if exist('package_version_check','file')
  package_version_check('SBtab for Matlab', 'sbtab_toolbox_version', '1.0.0');
end
