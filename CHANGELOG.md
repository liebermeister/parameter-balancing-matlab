# Changelog

Version numbers have the form MAJOR.MINOR.PATCH. MAJOR changes when existing calls may stop working.

## 1.0.0 (not released yet)

- The file of preprocessed data (`_preprocessed_data.tsv`) is written in the convention of the option `standard_concentration`
- Standard concentration of thermodynamic quantities: new option `standard_concentration` (Config file; default `1 mM`, as before) for the equilibrium constants, standard chemical potentials and standard reaction Gibbs free energies in the table of balanced parameters (and sampled parameter sets), declared by the table attribute `StandardConcentration`. Prior tables are read in the convention they declare: `pb_task` converts prior means, bounds and pseudo values of Keq, dmu0 and mu0 to 1 mM, used internally (the options `Keq_lower`, `Keq_upper` refer to the convention of the prior table). Data files are converted by mnt `kinetic_data_load`. Needs mnt with `prior_standard_concentration_shift`. All prior tables of these packages declare `1mM`, so results do not change
- `parameter_balancing` and `parameter_balancing_sbtab` accept SBtab objects instead of files: model (SBtab document object or network struct), data (SBtab table or document object), prior table, and options table (Config table object). Needs mnt with the SBtab object support of `network_import_model` and `kinetic_data_load`
- Default options in the SBtab Config file `parameter-balancing/parameter-balancing_Config.tsv` (TableID `ConfigurePB`): `parameter_balancing_options` reads the default values from this file and only describes the options. Needs matlab-utils with `load_config_table` (later than 1.0.0); the dependency check warns if it is missing.
- New file `parameter-balancing/parameter-balancing_ToolInputOutput.tsv` (SBtab 1.2 table type ToolInputOutput) describing the input and output tables of parameter balancing (for information only; not used by the code)
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
