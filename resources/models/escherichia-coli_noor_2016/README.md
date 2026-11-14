# E. coli central carbon metabolism, Noor et al. (2016)

## Provenance (reconstructed 2026-11-14)

* `escherichia-coli_noor_2016.tsv`: network (30 reactions, 13 external metabolites) with the unbalanced kinetic data
  of Noor et al. (2016); same values as `original_version` of the model in the enzyme-cost-minimization package.
  `escherichia-coli_noor_2016_data.tsv`: the kinetic data as a separate file. Equilibrium constants refer to 1 mM (declared).
* Corrected in `_data.tsv`: 11 values had lost their decimal point (spreadsheet saved with German locale): Keq of PYK,
  FBP, KGD (2026-11-13), KM of ZWF (NADP+, NADPH, G6P, 6PGL), GAP (NADH), CSN (citrate), PGM (2PG) and product kcat
  of PDH (2026-11-14); now equal to the values in the model file.
* Derived: `../escherichia-coli_noor_2016_glycolysis`; the model balancing version (model-balancing package).
* Full history of all versions: the README of the model collection folder `escherichia-coli-noor-2016` (local model collection of the author).
