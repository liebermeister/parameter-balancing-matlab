# Changelog

Version numbers have the form MAJOR.MINOR.PATCH. MAJOR changes when existing calls may stop working.

## 1.0.0 (not released yet)

First numbered version.

- Version function `parameter_balancing_version` and dependency check `parameter_balancing_dependencies`
- Example files with `e_coli` or `ecoli` in their names renamed to `escherichia-coli` (`escherichia_coli` in Matlab function and script names)
- Example models in one subfolder per model; iCH360 model added
- `pb_DIR` and `get_pb_directory` replaced by `pb_basedir`, which returns the main directory of the repository
- Tests can be run with `runtests('tests')`
- Installation notes moved from `INSTALLATION` and the inner `README.md` to the main `README.md`
- `CITATION.cff` added
- Old prior tables in `config/OLD` removed
- Example models moved to `resources/models` (new function `pb_resourcedir`), and tests moved to `tests`, both at the top of the repository
- SBtab 1.1 options and position tables
- `parameter_balancing_prior` and the prior table moved to the Metabolic Network Toolbox (`config/pb_prior.tsv` is now `mnt_prior.tsv`; see `mnt_prior_file`)
- The main functions check the dependencies automatically, once per Matlab session
- The functions in the folder `parameter_balancing` now start with `pb_` instead of `parameter_balancing_`; the main functions keep their names
- `load_model_and_data_sbtab` and `save_model_and_data_sbtab` moved to Enzyme Cost Minimization, which is the package that uses them

The state before the cleanup of October 2026 is available under the git tag `v0.9-legacy`.
