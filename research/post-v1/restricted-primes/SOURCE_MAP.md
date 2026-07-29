# Source map — fixed-progression restricted semiprimes

## Control records

- Authorised role packet: `Yuren-Tang/research-workbench#116`, ending `[START AUTHORIZED E306-POST-V1-AP-01]`.
- Controlling feasibility return: `Yuren-Tang/research-workbench#110#issuecomment-5110977295`.
- Exact mathematical source: `Yuren-Tang/erdos-306@9790763ab11a4406a7a15f79218e0d96efb81172`.
- Later source-preserving clarification candidate: `Yuren-Tang/erdos-306@f03105e95dc2ec5595a931293f6ca951e4bc424a`.

The later candidate is seven commits ahead of the exact source and zero commits behind.  It changes only presentation and explicit clarification in the article source; the proof dossier treats it as context and preserves the mathematical architecture of `9790763...`.

## File-level article map

| Dossier obligation | Exact source location | Use in this dossier | Restricted adaptation |
|---|---|---|---|
| Main theorem, avoidance reduction, proof architecture | `paper/e306-anchor-fibre-v1/manuscript/main.tex`; `sections/01_introduction.tex` | theorem form and overall route | strengthen denominator condition by allowed-prime support |
| Finite Fourier coefficient and Bernoulli product | `sections/02_fourier_selection.tex`, character orthogonality and independent product formula | existence reduced to positivity | unchanged |
| Exact centring | `sections/02_fourier_selection.tex`, reciprocal subset sums | `theta Lambda=1/b` | unchanged after recalibrating `Lambda` |
| Quotient-to-equality interface | `sections/02_fourier_selection.tex`, exactness interfaces | no-wrap converts congruence to equality | unchanged; enforce `Lambda<1` |
| CRT coordinate decomposition | `sections/02_fourier_selection.tex`, Chinese-remainder coordinates | anchor, rows, residual factors | unchanged |
| Product identities and weighted fibre compression | `sections/03_structural_tools.tex` | complete-pair load and exact row factorisation | unchanged on the complete graph induced by allowed primes |
| Prime blocks and fixed-ratio supply | `sections/04_denominator_system.tex`, prime blocks | define `P`, `B` | replace all primes by `P_C`; invoke fixed-modulus PNT/AP |
| Reciprocal prime estimates | `sections/04_denominator_system.tex`, reciprocal prime estimates | first and second reciprocal moments | `S_1=delta log A+o(1)`; density in all moments |
| Denominator family | `sections/04_denominator_system.tex`, denominator family | complete bulk pairs plus target rows | both factors remain allowed because `supp(b) subset P_C` |
| Arithmetic capacity | `sections/04_denominator_system.tex`, arithmetic capacity | distinctness, avoidance, divisibility, load, square load | replace `Z=X^3` by load-calibrated `Z=X^A` |
| Bernoulli modulus and variance | `sections/04_denominator_system.tex`, Bernoulli centring and variance | uniform Gaussian and tail constants | unchanged once `theta` stays compactly in `(0,1)` |
| Exact factor partition | `sections/04_denominator_system.tex`, exact factor partition | no omitted or duplicated factor | unchanged |
| Reciprocal dispersion | `sections/05_top_anchor.tex`, reciprocal dispersion | anchor and row separation | unchanged for arbitrary selected primes in the interval |
| Cross-label energy | `sections/05_top_anchor.tex` | anchor rigidity | unchanged; complete anchor graph retained |
| Nondominant forcing | `sections/05_top_anchor.tex` | low energy yields a dominant label | cardinality insertion gives `delta^3` loss |
| Exact anchor rigidity | `sections/05_top_anchor.tex` | all anchor coordinates equal one integer label | unchanged integer-exception closure; constants depend on `delta` |
| Fingerprint rigidity and entropy | `sections/05_top_anchor.tex` | control number of energetic anchor assignments | same proof; fewer vertices only changes constants |
| Anchor partition | end of `sections/05_top_anchor.tex` | coherent/noncoherent split | `O_delta(Z log Z)` partition; tail `exp(-c_delta Z/log^3 Z)` |
| Row-coordinate kernels and cyclic energy | `sections/06_fibre_decoding.tex` | row separation and product-fibre compression | ambient multiplicity bound; no distribution modulo moving `r` |
| Lower-row distance | `sections/06_fibre_decoding.tex` | decode all lower prime coordinates | `D_r >= c delta^3 Z/log^3 Z` |
| Target-row distance | `sections/06_fibre_decoding.tex` | observe coordinates indexed by `r|b` | full star gives trivial kernel and `D_r >= M/r^2` |
| Decoder identification | `sections/06_fibre_decoding.tex` | identify common integer label through cutoffs | choose `M_dec=c_0 delta XZ/(log Z)^2`; target ratio uses `A>2` |
| Decoded skeleton | `sections/07_decoded_skeleton.tex` | preserve residual pair factors | complete restricted residual graph remains available |
| Adaptive retained-pair interval | `sections/07_decoded_skeleton.tex` and `sections/08_major_budget.tex` | Sector III damping | fixed-modulus PNT in `[2sqrt|n|,3sqrt|n|]`; energy loses `delta^2` |
| Gaussian major and five-sector budget | `sections/08_major_budget.tex` | positivity | unchanged after substituting displayed density-dependent scales |
| Avoiding representation and numerator induction | `sections/09_exact_completion.tex` | all positive numerators and finite avoidance | unchanged |
| Small denominators | `sections/09_exact_completion.tex` | `b=1,2` closure | direct calibrated proof for supported `b=2`; auxiliary allowed prime for `b=1` |
| Necessity and scope | `sections/09_exact_completion.tex`; `sections/10_scope.tex` | only-if direction and exclusions | LCM support gives exact prime-support obstruction |

## Clarification-candidate map

The source-preserving candidate `f03105e...` modifies:

- `manuscript/main.tex`;
- `sections/01_introduction.tex`;
- `sections/05_top_anchor.tex`;
- `sections/06_fibre_decoding.tex`;
- `sections/07_decoded_skeleton.tex`;
- `sections/08_major_budget.tex`.

The dossier relies particularly on its explicit clarifications of:

1. the integer zero-exception step in exact anchor rigidity;
2. the separation between anchor coherence, row decoding and residual damping;
3. the exact target-row observability mechanism;
4. the use of actual-family variance in the Gaussian sector;
5. the complete five-sector exhaustion and the preservation of residual factors.

No theorem statement or numerical scale in the dossier is obtained by altering the article manuscript.  The dossier is a post-v1 application on the dedicated research branch only.

## External arithmetic input

The sole new external theorem required for the fixed-progression application is the prime number theorem in arithmetic progressions for a **fixed** modulus:

`pi(x;m,c) = Li(x)/phi(m) + o(x/log x)`

for every reduced residue class `c mod m`.  Summing over `c in C` gives density

`delta=|C|/phi(m)`.

Abel/partial summation then supplies the reciprocal estimate; fixed-ratio counting and dyadic decomposition supply all reciprocal-square estimates.  No theorem uniform in `m`, no short-interval distribution beyond fixed ratios, and no distribution modulo moving row primes is used.

## Exclusion map

The following subjects are intentionally not sourced into a theorem here:

- general graph transference;
- Chebotarev prime sets;
- arbitrary positive-density prime sets;
- vertex or edge deletion resilience;
- bipartite factor restrictions;
- growing moduli;
- manuscript, Lean, workflow, release, DOI, or publication changes.

They remain outside the authorised role.