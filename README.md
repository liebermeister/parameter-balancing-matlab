Parameter balancing
===================

[Parameter balancing](https://www.parameterbalancing.net) is a computational method to
determine plausible kinetic constants and metabolic states in kinetic metabolic models. It integrates thermodynamic, kinetic, and possibly metabolite data, using prior distributions for all these variables, and computes the joint posterior mode.
Parameter balancing can be run in matlab or python. Data tables can be provided in [SBtab](https://www.sbtab.net)
format, models can be provided in [SBML](https://sbml.org) or [SBtab](https://www.sbtab.net) format.

### Matlab
This repository contains the Matlab version. To run parameter balancing, adjust the demo scripts in `matlab/demo` to your model and data.
For help, type `help Contents` in the `matlab` directory, or `help parameter_balancing` in matlab.

A minimal example:

```matlab
[model_name, model_file, data_file, prior_file, options_file] = pb_example_files('ecoli_noor_2016');
balanced_parameters_SBtab = parameter_balancing(model_file, 'my_results.tsv', data_file, prior_file, options_file, model_name);
```

### Python
For using parameter balancing in python, please refer to the [www.parameterbalancing.net](https://www.parameterbalancing.net) page. More recent code is found on our GitLab repository [gitlab.com/elad.noor/parameter-balancing](https://gitlab.com/elad.noor/parameter-balancing)

## Installation
The following installation instructions are only for the Matlab version.

- Clone the following [GitHub](https://github.com/liebermeister) repositories
    - [`matlab-utils`](https://github.com/liebermeister/matlab-utils) - utility functions
    - [`metabolic-network-toolbox`](https://github.com/liebermeister/metabolic-network-toolbox) - metabolic network toolbox
    - [`sbtab-matlab`](https://github.com/liebermeister/sbtab-matlab) - SBtab toolbox
- Install the Matlab interface of [libSBML](https://sbml.org/software/libsbml/) (optional - needed only if SBML model files are used)
- Make sure that all these directories and their subdirectories, as well as the `matlab` directory of this repository (with subdirectories), are included in your Matlab path.
- The Matlab Optimization Toolbox is required (functions `quadprog` and `linprog`).
- To check your installation, run `pb_run_tests` in Matlab.

The code was tested with Matlab R2025b on Linux.

## License
This package is released under the [GNU General Public License](LICENSE).

## Contact
Please contact [Wolfram Liebermeister](mailto:wolfram.liebermeister@gmail.com) with any questions or comments.

## References

*Parameter balancing: consistent parameter sets for kinetic metabolic models*
Lubitz T. and Liebermeister W. (2019),
Bioinformatics 35 (19) 3857.
[https://doi.org/10.1093/bioinformatics/btz129](https://doi.org/10.1093/bioinformatics/btz129)

*Parameter balancing in kinetic models of cell metabolism*
Lubitz T., Schulz M., Klipp E., Liebermeister W. (2010)
Journal of Physical Chemistry B 114(49):16298-16303.
[https://pubs.acs.org/doi/full/10.1021/jp108764b](https://pubs.acs.org/doi/full/10.1021/jp108764b)
