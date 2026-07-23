# E306-OA-AUDIT-01 — Claim Matrix

**Frozen candidate:** `07ed8dcaff334ba9da4b9c87337455c2eca25002`  
**Verdict standard:** ordinary mathematical correctness, independently recomputed  
**Legend:** `PASS` means the stated implication closes without importing forbidden authority.

| ID | Claim or obligation | Independent check | Result |
|---|---|---|---|
| A1 | Complete-pair reciprocal load | `sum_(p in P)1/p=log 3+o(1)` and `sum1/p^2=o(1)` imply `sum_(p<q)1/(pq)->(log3)^2/2`. | PASS |
| A2 | Full-top auxiliary load | `sum_(q in B)1/q=O(1/log Z)`; multiplying by fixed `sum_(r|b)1/r` is `o_b(1)`. | PASS |
| A3 | Distinctness and avoidance | Fixed primes dividing `b` lie below `X`; unique factorization separates all denominator families; all products tend to infinity. | PASS |
| A4 | Period and compact Bernoulli interval | Every denominator divides squarefree `L`; `1/3<Lambda<1` eventually, so `theta=1/(bLambda)` lies compactly in `(0,1)`. | PASS |
| A5 | Actual variance | Lower pairs from `[X,2X)` give `>>1/(X^2log^2X)`; upper square sum and auxiliary family give the matching upper bound. | PASS |
| A6 | No-wrap capacity | `Lambda<1` bounds every subset reciprocal sum below one. | PASS |
| B1 | One-block reciprocal dispersion | Close residues are parametrized by `|v|<=s/16`; each `v` yields at most two sensors, leaving at least `s/2` dispersed sensors. | PASS |
| B2 | Cross-label energy | The substantial class hypothesis includes `s>=16`; at most one opposite-class prime divides the label difference. | PASS |
| B3 | Nondominant forcing | Zero energy is separated; bad-degree averaging, small-class counting, and corrected cross-class summation all force `R>>Y/log^3Y`. | PASS |
| B4 | Zero-exception theorem | Every exception pays a disjoint star `>>N^3/Y^2`; the resulting integer cardinality is strictly `<1`. | PASS |
| B5 | Uniform fingerprint entropy | Fingerprint size lies in `[16,N/2]`; low- and high-energy regimes overlap exactly at the split and both give `log count=o(R)`. | PASS |
| C1 | Multiplicity-sensitive cyclic energy | `M<=mu(r-1)` makes `t=floor(M/(4mu))<r/4`; at least `M/2` residues have distance `>=M/(8mu r)`. | PASS |
| C2 | Lower-prime row distance | `mu_r<=Z/(2r)+1=O(Z/r)` and `M/mu_r>>r/logZ` uniformly yield `D_r>>Z/log^3Z`. | PASS |
| C3 | Fixed `r|b` row distance | Every nonzero `dq^{-1} mod r` has distance at least `1/r`; no PNT in progressions is used. | PASS |
| C4 | Row-tail bound | Shift-uniform distance and energy minimality give `E_r(x)>=D_r/4` off the chosen decoder; summing at most `r` residues gives the tail. | PASS |
| C5 | Uniform row summability | Fewer than `Z` lower rows, each of size below `Z`, give `Delta<=Z^2e^{-cZ/log^3Z}`; fixed `b` rows are stronger. | PASS |
| D1 | Exact denominator-factor partition | `B-B`, `(P\B)-B`, `S_b-B`, and `(P\B)-(P\B)` are disjoint and exhaust `E`. | PASS |
| D2 | Retained-skeleton inequality | Separating the decoder tuple and factoring pure row sums gives the exact inequality; monotonicity bounds the difference by `e^Delta-1`. | PASS |
| D3 | Empty and singleton row cases | Empty-product conventions make the same formula valid without an exceptional case. | PASS |
| D4 | Weighted top multiplication | The global fibre error is multiplied by `P_top=O(ZlogZ)`, not by the raw number of top assignments. | PASS |
| E1 | Low top labels | Zero-exception gives an exact label; its magnitude is `o(Z^2)`, making the label unique from any two top primes. | PASS |
| E2 | High top entropy | Choosing entropy exponent below the Fourier damping exponent gives `O(e^{-cF_B})` by shell summation. | PASS |
| E3 | Full weighted top partition | Low labels form a Gaussian sum `O(1/sigma_B0)=O(ZlogZ)`; adding the high part preserves this bound. | PASS |
| F1 | Prime-coordinate decoder range | At `|m|=M_dec` and `r=X`, candidate energy is `O(Z/log^5Z)=o(D_r)`; all larger rows are easier. | PASS |
| F2 | `b`-coordinate decoder range | For `|m|<=X^2/4`, candidate energy is `O_b(X/logX)` against `D_r>>_bX^3/logX`. | PASS |
| F3 | Squarefree target observability | Prime-coordinate agreement modulo each `r|b` is agreement modulo `b` precisely because `b` is squarefree. | PASS |
| G1 | Adaptive interval containment | Strict lower sector boundary gives `2sqrt|m|>X`; `M_dec` gives `3sqrt|m|<Z/2`. | PASS |
| G2 | Uniform prime supply | Tail-uniform PNT on `[2y,3y]`, with `y>=X/2`, gives `>>y/logy`; endpoint rounding is negligible. | PASS |
| G3 | Diagonal exclusion and pair energy | Distinct pairs remain `>>K_m^2`; for each pair `1/9<=|m|/(pq)<=1/4`, giving constant circle energy. | PASS |
| H1 | CRT coordinate bijection | Squarefree `L` is the product of exactly the displayed prime coordinates, so each coordinate tuple gives one frequency. | PASS |
| H2 | Five-sector disjointness | Four numerical coherent-label ranges are disjoint; decoder versus nondecoder splitting is disjoint for every top assignment. | PASS |
| H3 | Five-sector exhaustion | Every top assignment is coherent or noncoherent, and every lower tuple is decoder or nondecoder; no sixth lane remains. | PASS |
| H4 | Energetic top assignments separately bounded | Their decoder tuples are bounded by the high top shell sum. | PASS |
| H5 | Nondecoder fibres separately bounded | All such fibres, coherent or not, are bounded by `P_top(e^Delta-1)`. | PASS |
| I1 | Actual-family Taylor disk | `min e>=X^2` and `|m|<=C/sigma_E` give `max|m/e|=O_C(logX/X)`. | PASS |
| I2 | Aggregate cubic remainder | `sum|m/e|^3<=|m|^3X^{-2}sum1/e^2=O_b(C^3logX/X)=o(1)`. | PASS |
| I3 | Exact linear cancellation | `theta` is defined from the full load, including `E_b`, so `theta sum1/e=1/b` exactly. | PASS |
| I4 | Positive major coefficient | Uniformly small complex remainder leaves each major term with positive real part comparable to its Gaussian magnitude. | PASS |
| I5 | Gaussian tail | Choosing fixed `C` first gives the required fixed fraction of the major scale. | PASS |
| I6 | Sector III budget | At most `O(X^4)` labels, each `<=e^{-cX^2/log^2X}`, give `o(1/sigma_E)`. | PASS |
| I7 | Sector IV budget | Top Gaussian tail starts at exponent `M_dec^2sigma_B0^2>>X^2/log^6Z`; polynomial prefactor is harmless. | PASS |
| I8 | Sector V budget | Both `e^{-cF_B}` and `ZlogZ·Z^2e^{-cZ/log^3Z}` are `o(1/sigma_E)`. | PASS |
| I9 | Terminal order | All structural constants precede `C`; every remaining threshold is met by a single later choice of `X`. | PASS |
| J1 | Fourier positivity gives a subset | The Bernoulli weight is a finite sum of nonnegative subset weights. | PASS |
| J2 | Congruence becomes equality | The reciprocal difference is integral and lies in `(-1,1)`. | PASS |
| J3 | Numerator induction | Each new unit representation forbids all earlier denominators, preserving distinctness. | PASS |
| J4 | `b=1,2` closure | Repeated avoiding representations for squarefree denominators `3` and `6` give the required units. | PASS |
| K1 | Hidden multiblock complexity | Top entropy is one-block only; row decoding is factorwise and shift-uniform; the skeleton is a direct product inequality, not a global code. | PASS |
| K2 | Route classification | Same headline theorem, strictly smaller proof DAG, no reconstructed global localization or sibling reservoir. | GENUINE STRICT SIMPLIFICATION |

## Audit conclusion

All correctness obligations pass. No bounded mathematical repair is required. Minor expositional expansions—such as stating `M<=mu(r-1)` inside the cyclic-energy proof—are immediate consequences of the written hypotheses and do not alter the proof or verdict.
