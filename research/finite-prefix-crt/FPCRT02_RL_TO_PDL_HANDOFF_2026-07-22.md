# FPCRT-02 Research Lead to Proof Development handoff

**From:** `Erdős 306 — Research Lead` (`E306-RL`)  
**To:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Date:** 2026-07-22  
**Status:** `EXACT RESEARCH HANDOFF / NO PROJECT ACCEPTANCE`  
**Research branch:** `research/e306-frontier-v1`  
**Controlling pre-handoff checkpoint:** `eb362eedae4adbe825a4e9c8bba0aa3793988c2d`

## 1. Role disposition

The adversarial work splits into two different activities.

### Research Lead work

The following are exploratory because a failure would change the mechanism or expose a new mathematical obstruction:

1. search for a low/high mass-edge coupling that destroys product-fibre factorisation;
2. search for an unused-prefix-prime obstruction;
3. search for wrapping or multiple-label frequencies missed by the proposed partition;
4. search for a coherent frequency lane not controlled by either the full-variance Gaussian estimate or the high-energy floor;
5. test whether the dyadic-to-all-prefix recurrence points in the required direction and preserves a vanishing rate.

This structural stress test has been performed at the argument level.  No new obstruction was found.  In particular:

- there are no low--low mass edges because every mass edge satisfies `pq>=Z` while both low primes are `<sqrt(Z/2)`;
- conditional on the high assignment, every low--high factor belongs to one unique low coordinate, and high--high factors are independent of all low coordinates;
- dropping extra mass factors in modulus preserves the sensor-based local code-distance bound;
- every low prime is incident to the complete bipartite sensor reservoir and every high prime is incident to the internal/adjacent control graph;
- total reciprocal load `<1` gives deterministic no-wrap exactness;
- coherent labels in the growing high main arc reconstruct the unique global frequency `h=m`, while labels outside it are covered by the accepted exact-quadratic Gaussian sector;
- Li's recurrence is forward in `N`, has the required side condition under his uniform `gamma_N<=0.181...` bound, and its cost has a summable tail.

### Proof Development work

The remaining obligations are no longer frontier exploration.  They are theorem expansion, exact constants, endpoint conventions, external-source discharge, and formal/informal correspondence.  They belong to E306-PDL.

MATH-CUR integration is premature until the proof-development packet and an independent assurance pass exist.

## 2. Exact research sources to consume

1. `research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`
2. `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`
3. `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md`
4. `research/finite-prefix-crt/HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`
5. `research/finite-prefix-crt/HC_RATE_DYADIC_GFF_AUDIT_ADDENDUM_01.md`
6. `research/PROGRAMME_STATE.md`

The errata file controls the earlier alias and Linnik claims.  The audit addendum controls the coherent-label terminal partition.

## 3. Candidate theorem chain

At the argument level the chain is:

1. complete top-block sensors give arbitrary-shift low-coordinate compression with code distance `Omega(Z/log Z)`;
2. accepted global-control level sets and localization give

   ```text
   floor-sector <= epsilon_k/sigma_ctrl,
   epsilon_k <= C exp(A(2k+1)-c 2^k/(k+1)^3);
   ```

3. complete dyadic prefixes admit exact edge incidence and reciprocal mass tuning for every target

   ```text
   C log(k)/k <= q <= 1/5;
   ```

4. reciprocal load `<1` converts modular Fourier positivity directly to an exact subset sum;
5. the coherent sector is reduced to one integer-frequency skeleton, with a positive full-variance Gaussian main window and controlled intermediate/outer tails;
6. hence

   ```text
   gamma_(N_k)=O(log k/k);
   ```

7. Li's recurrence and summable tail then give

   ```text
   gamma_N=O(log log p_N/log p_N)->0.
   ```

This is a `FULL THEOREM CANDIDATE`, not a proved or project-accepted theorem.

## 4. Exact PDL obligations

### PDL-1 — local fibre theorem

State and prove the arbitrary-shift product-code lemma with all constants, including the distinguished-point/sibling form used on coherent high assignments.  Verify the sequential product over all low primes and the uniformity in arbitrary high shifts.

### PDL-2 — prime-block energy

Give a source-complete proof of the top-block energy bound from PNT plus Montgomery--Vaughan Brun--Titchmarsh, including the interval-to-full-progression reduction, `r=2`, and uniformity for every low prime.

### PDL-3 — edge architecture

Define the sensor, control, and mass edge sets as disjoint sets of unordered pairs.  Prove:

- no low--low mass edge occurs;
- every prefix prime is incident;
- conditional low-coordinate factorisation;
- reciprocal and inverse-square load estimates;
- deletion of sensor/control edges leaves enough hyperbolic mass;
- greedy tuning keeps one common `theta` in `[1/3,1/2]`.

### PDL-4 — quantitative Peierls extraction

Derive the moving rate directly from the accepted level-set/localization statements with the exact quantifier order.  Record explicitly which theorem is consumed from

`proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`.

### PDL-5 — coherent skeleton and terminal positivity

Use one non-circular constant hierarchy for:

- `C_k=D sqrt(log k)`;
- decoded low residues throughout the growing high main arc;
- uniqueness of the reconstructed global character;
- uniform Taylor radius and cubic remainder;
- positive main window, intermediate full-variance tail, outer exact-quadratic tail, floor sector, and sibling sector.

### PDL-6 — floor endpoint transfer

Check ceilings/floors in the definition of `gamma_N`, overlap with Li's central band, complement symmetry in the full atom set, Lemma 7.3's exact side condition, and the prime-tail estimate.  Separate the qualitative consequence `gamma_N->0` from the proposed quantitative rate.

### PDL-7 — trust and source ledger

Mark all PNT, Mertens, Brun--Titchmarsh, and Li-paper inputs as external research premises; do not import them into the released Rosser--Schoenfeld theorem authority.  Produce a proposition-level correspondence ledger and identify any remaining genuinely new implication for return to E306-RL.

## 5. Return rule

Return to E306-RL only if proof expansion exposes one exact new-mathematics obligation, counterexample, incompatible quantifier order, or structural obstruction.  Ordinary endpoint repair, constant selection, source localization, Lean correspondence, and exposition remain in PDL.

No Lean, manuscript, review, release, DOI, or corpus status changes are authorized by this handoff.
