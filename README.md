Parameter balancing
===============

[Parameter balancing](https://www.parameterbalancing.net) is a computational method to
determine plausible kinetic constants and metabolic states in kinetic metabolic models. It integrates thermodynamic, kinetic, and possibly metabolite data, using prior distributions for all these variables, and computes the joint posterior mode.
Parameter balancing can be run in matlab or python. Data tables can be provided in [SBtab](https://www.sbtab.net)
format, models can be provided in  [SBML](http://sbml.org) or  [SBtab](https://www.sbtab.net) format.

### Matlab
To run parameter balancing in matlab, please adjust  the demo scripts in `matlab/demo`  to your model and data.
For help, please type `help parameter-balancing`  in matlab, or see  the documentation at
www.metabolic-economics.de/parameter-balancing/matlab-doc/. 

### Python
For using model balancing in python, please refer to the [www.parameterbalancing.net](https://www.parameterbalancing.net) page. More recent code is found on [our GitLab repository](https://gitlab.com/elad.noor/parameter-balancing)

## Installation
The following installation instructions are only for the Matlab version (also see the file `INSTALLATION` in this directory).

- [SBML toolbox](http://sbml.org/Software/SBMLToolbox) (optional - needed only if SBML files are used;
  version needs to match your matlab version and  requires a matching version of libSBML)
- Clone the following [GitHub](https://github.com/liebermeister) repositories
    - [`matlab-utils`](https://github.com/liebermeister/matlab-utils) - utility functions
    - [`metabolic-network-toolbox`](https://github.com/liebermeister/metabolic-network-toolbox) - metabolic network toolbox
    - [`sbtab-matlab`](https://github.com/liebermeister/sbtab-matlab) - SBtab toolbox
    - [`enzyme-cost-minimization`](https://github.com/liebermeister/enzyme-cost-minimization) - enzyme cost minimization toolbox
- Make sure all the directories and subdirectories are included in your Matlab path.

The code was tested with Matlab R2019b on Linux. 

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
