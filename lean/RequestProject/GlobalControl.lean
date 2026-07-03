import RequestProject.GlobalControl.BlockVarianceComparison
import RequestProject.GlobalControl.Partition

/-!
# Global control of block assignments

The global theory organizes residue assignments on consecutive dyadic prime
blocks around a quadratic CRT energy.

Its mathematical layers are:

* `ControlEnergy`: control pairs, global energy, and deviation;
* `BlockRestriction` and `EnergyDecomposition`: localization to individual
  prime blocks and decomposition into internal and adjacent-block energies;
* `BlockVarianceComparison` and `ControlVarianceBounds`: comparison and
  dyadic bounds for deviation scales;
* cold dominant-label propagation and boundary energy penalties;
* finite level-set encoding, admissibility, entropy, and charge aggregation;
* localization into energetic and diagonal sectors;
* Laplace estimates for both sectors and their final partition.

This module is the public entry point for the complete global-control theory.
-/
