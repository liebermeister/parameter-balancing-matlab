# Changelog

Version numbers have the form MAJOR.MINOR.PATCH. MAJOR changes when existing calls may stop working.

## 1.0.0 (not released yet)

First numbered version.

- Version function `parameter_balancing_version` and dependency check `parameter_balancing_dependencies`
- Example models in one subfolder per model; iCH360 model added
- SBtab 1.1 options and position tables
- `parameter_balancing_prior` and the prior table moved to the Metabolic Network Toolbox (`config/pb_prior.tsv` is now `mnt_prior.tsv`; see `mnt_prior_file`)
- The main functions check the dependencies automatically, once per Matlab session

The state before the cleanup of October 2026 is available under the git tag `v0.9-legacy`.
