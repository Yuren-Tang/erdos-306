# E306 Owner review packet

**Current manuscript source:** `Yuren-Tang/erdos-306:paper/e306-anchor-fibre-v1@8024ff325f454e1fc52c280ac65bab0c48315e96`  
**Title:** *Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem*  
**Current assurance:** two independent reviews of earlier fixed objects found no fatal objection; the second review triggered a sparse-target `gamma>1` strengthening which is author/Director-complete and clean-built but still awaits focused independent recheck.  
**Clean-build run:** GitHub Actions `31320182037` / run 204, PASS, 35-page A4 PDF.  
**Publication action:** none authorized by this packet.

## 1. Current theorem package

1. Squarefree-denominator characterization with arbitrary finite avoidance.
2. Direct proper-target theorem for reduced `t=a/b in (0,1)`, squarefree `b`, and fixed
   ```text
   gamma>1,  t < (log gamma)^2/2 < 1.
   ```
3. Compact-uniform Gaussian profile for exact Bernoulli-weighted coefficients on every fixed standardized target window.
4. Entropy-rate multiplicity in a mesoscopic typical-cardinality window, for the whole exact fibre as a lower bound, and at one exact cardinality.
5. For `0<t<1/2`, the choice `gamma=exp(2 sqrt(t))` gives the full binary entropy rate `log 2` per denominator.
6. Prime-dilution closure from proper targets to arbitrary positive rationals with squarefree reduced denominator.

The article still excludes growing standardized windows, bivariate/prescribed-cardinality local limits, a matching total-fibre upper bound, full abstract AFT, alternative multiblock/sparse proof routes, restricted-prime programmes, and deletion resilience.

## 2. Review history

The first independent reader reviewed source `654189fe...`, found no fatal mathematical defect, stress-tested the Sections 4--6 core, and advised bounded revision.

A later blind reader reviewed fixed source

```text
20fd8c774397faf14208fcdce550b344a6e9b77b
```

without project background. That reader again reported no fatal objection, read the main Sections 4--8 dependency cone, and recommended substantive but non-foundational revision. The most important research suggestion was to sparsify only the finitely many target rows `r|b`, with the conjectural consequence that the clean theorem might hold already for `gamma>1`.

The Director independently checked that suggestion against the manuscript and the existing sparse-sensor mathematics in `research-workbench`. The exact hybrid was not already a canonical theorem, but all its structural ingredients existed. The new transport was then checked range by range before being admitted to the manuscript.

Neither earlier review is an automatic PASS on the current source.

## 3. Main mathematical revision

The complete prime-pair family and full top anchor remain unchanged. Only the fixed target coordinates are sparsified.

Let

```text
K_* = ceil((log Z)^2),
B_* subset B, |B_*|=K_*.
```

For each prime `r|b`, use only denominators `rq` with `q in B_*`.

Then

```text
target reciprocal load = O_b(K_*/Z),
target square load     = O_b(K_*/Z^2),
D_r                    >= K_*/r^2.
```

Thus target rows remain negligible in the leading variance for every fixed `gamma>1`, while their row-tail loss is `exp(-c_b(log Z)^2)`.

For a coherent label `m`, target candidate energy divided by target-row distance is `O_b(m^2/Z^2)`. The fixed `b`-coordinates therefore need to decode only on the Gaussian major range `|m|=O(X log X)=o(Z)`. The first coherent tail is controlled by the complete pair factors alone; the intermediate tail retains the old lower-prime decoder and adaptive complete-pair damping. The major Taylor remainder is split between pair and sparse target factors. The large-anchor range is treated without assuming a fixed ordering between `M_dec` and the maximal low-energy anchor-label scale.

This removes the Article-1 restriction `gamma>2` without reintroducing the historical multi-regime target-row transition architecture.

## 4. Bounded clarity repairs

The same revision also:

- expands the fingerprint-rigidity contradiction to the explicit inequality ending in `4g<c_D`;
- defines label classes at first use;
- states the unique-CRT-frequency bookkeeping in weighted row compression;
- corrects “maximum atom” to “uniform upper bound for an atom in the window”;
- renames the temporary lcm variable in Section 9;
- condenses common proper refinement from a full proposition/proof to a short remark while retaining the result and proof idea;
- adds the short entropy-saturation corollary for `0<t<1/2`.

## 5. Dedication typography

The Greek wording remains

```text
ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ
ΚΑΙ ΟΙΣ ΦΙΛΩ
```

and `ΟΙΣ` remains deliberate by classical relative attraction.

The Owner was dissatisfied with both GFS Artemisia and EB Garamond in the actual title-page setting. A new comparison tested available TeX Live Greek serif faces and, crucially, the effect of tracking and true intermediate weight rather than simply changing regular fonts or applying fake bold.

The current choice is:

```text
STIX Two Text Medium
10.5 pt / 16 pt
LetterSpace = 9
upright, dedication only
8 pt above / 12 pt below
```

Body text remains ETbb; mathematics remains NewTX. This is a true medium face, not synthetic bold. The open tracking is intentional: it gives the uppercase Greek a restrained inscriptional presence while preserving ordinary font kerning and avoiding manual pair adjustments.

## 6. Equation-reference surface

The semantic-reference migration remains intact:

- 190 visible tagged displays;
- 190 unique equation labels;
- 94 equation references;
- ordinary LaTeX/hyperref navigation;
- no global `\eqref` override;
- no legacy bare numeric `\eqref{n.m}`.

Visible equation numbers remain stable.

## 7. Exact build object

Exact source:

```text
8024ff325f454e1fc52c280ac65bab0c48315e96
```

Clean build:

```text
GitHub Actions run 31320182037
run number 204
execution head f0fc3c441b6d614f26270e4fedcc2ae2b10cbd19
PDF artifact 9039950866
artifact sha256 a4bef64c3d9a8ace29a11191f9d843308ab55cce165713f0fee4f92489936b15
```

Result: **35 A4 pages**. All configured source, theorem-surface, equation-reference, XeLaTeX/Biber, missing-glyph, no-overfull, font-embedding/no-Type-3, Unicode dedication, ORCID, `Erdős`, and internal-label-leak gates passed.

## 8. Exact next review request

The current object should receive a **focused independent dependency-cone review**, not be treated as already passed merely because the earlier manuscript was read twice.

The focused reviewer should check:

1. sparse target-row reciprocal and square loads;
2. target row-code distance and weighted off-minimizer total;
3. target decoder range and the exact use of `gamma>1`;
4. separate sparse-target major-arc Taylor remainder;
5. pair-only first coherent tail;
6. lower-prime decoder and retained damping in the new range;
7. the ordering-free large coherent-label argument;
8. moving-target and no-wrap transport;
9. the entropy-saturation corollary;
10. absence of any hidden surviving `gamma>2` dependency.

The fingerprint/label/CRT edits should be checked as local exposition repairs. If this focused cone passes, the remaining mathematical review gate can be presented to the Owner for publication disposition.

A PASS still does not itself authorize merge, release, arXiv upload, journal submission, endorsement requests, or external contact.
