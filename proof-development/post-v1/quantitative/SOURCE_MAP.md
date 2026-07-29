# Source map

## Controlling records

- Role packet: `Yuren-Tang/research-workbench#115`, complete issue body ending `[START AUTHORIZED E306-POST-V1-QUANT-01]`.
- Controlling feasibility return: `Yuren-Tang/research-workbench#109`, comment `#issuecomment-5111000940`.

## Exact mathematical source

- Repository and commit: `Yuren-Tang/erdos-306@9790763ab11a4406a7a15f79218e0d96efb81172`.
- Article root: `paper/e306-anchor-fibre-v1/manuscript/main.tex`.
- Arithmetic family, load, Bernoulli centring, variance, and Fourier product: `sections/04_denominator_system.tex`.
- Five-sector decomposition and positivity interface: `sections/07_decoded_skeleton.tex`.
- Uniform local expansion, Gaussian major, Sector II tail, and strict terminal budget: `sections/08_major_budget.tex`.
- Orthogonality, no-wrap exactness, numerator induction, and the separate `b=1,2` closure: `sections/09_exact_completion.tex`.

## Later clarification candidate

- Context-only head: `Yuren-Tang/erdos-306@f03105e95dc2ec5595a931293f6ca951e4bc424a`.
- Relation to the exact source: seven commits ahead and zero behind.
- Changed article files between the two heads: `main.tex` and Sections `01`, `05`, `06`, `07`, `08` only.
- Use in this dossier: source-preserving clarification and quantifier checking only; no mathematical conclusion is imported merely because it appears at the later head.

## Claim-to-source correspondence

1. **Quantitative coefficient lower bound.** The exact orthogonality identity and no-wrap interpretation come from Sections `02` and `09`; the constants `1`, `1/8`, and `3/8` come from the strict assembly in Section `08`.
2. **Weighted-to-unweighted multiplicity.** New elementary consequence of the exact weighted target mass: each Bernoulli atom is bounded by `max(theta_X,1-theta_X)^{M_X}`.
3. **Two-stage local limit.** Reassembly of the uniform complex expansion and aggregate cubic remainder in Sector I, the two-parameter Gaussian tail in Sector II, and the fixed-`C` little-oh estimates in Sectors III--V.
4. **Mesoscopic cardinality entropy.** New bounded lemma combining the coefficient lower bound with Hoeffding concentration and the exact logarithm of a Bernoulli atom.
5. **One exact cardinality.** Pigeonhole consequence of the mesoscopic theorem because the window contains `exp(o(M_X))` integers.
6. **`b=1,2`.** Section `09`; these are closure constructions from separate `b=3` and `b=6` families, not direct instances of the one-family asymptotics.
7. **Deletion counterexample.** Uses the target-row family `{rq:q in B}` from Section `04` and reduction modulo the fixed prime `r|b`.

## Derived asymptotic inputs

The dossier also records routine consequences of the same prime-number-theorem input used by the article:

- `|P|=(1+o(1))X^3/(3 log X)`;
- `|B|=(1+o(1))X^3/(6 log X)`;
- `M_X=(1+o(1))X^6/(18 log^2 X)`;
- `log L_X=(1+o(1))X^3=o(M_X)`;
- `sum_{e in E_X}e^{-2}~1/(2X^2 log^2 X)`.

These require only fixed-interval PNT estimates and partial summation; they introduce no new distributional or sieve hypothesis.
