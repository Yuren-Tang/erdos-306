import RequestProject.GlobalControl.Partition

/-!
# Global control of block assignments

The global theory organizes residue assignments on consecutive dyadic prime
blocks around a quadratic CRT energy.

Its mathematical layers are:

* `ControlEnergy`: control pairs, global energy, and deviation;
* `BlockRestriction` and `EnergyDecomposition`: localization to individual
  prime blocks and decomposition into internal and adjacent-block energies;
* `ControlVarianceBounds`: dyadic bounds for deviation scales;
* cold dominant-label propagation and boundary energy penalties;
* finite level-set encoding, admissibility, entropy, and charge aggregation;
* localization into energetic and diagonal sectors;
* Laplace estimates for both sectors and their final partition.

This module is a documentation entry point only — nothing in `RequestProject`
imports it, since every consumer imports the specific submodule it needs
directly. Not built as part of `RequestProject.Audit`; check it explicitly
(`lake build RequestProject.GlobalControl`) after editing, since the normal
audit build will not catch errors here.

`BlockVarianceComparison` (`sigmaP_block_le`, `sigmaP_sq_eq_internal`) was
removed as dead code: a second, unused route to the deviation-scale
comparison that `ControlVarianceBounds` actually provides, reachable only
through this file (which nothing else imports either).
-/
