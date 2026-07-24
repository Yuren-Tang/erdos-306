# E306-SAS-AUDIT-01 — claim matrix

**Frozen candidate:** `4061883d8ee0487ec154f365ce0e1fe915ee3f1c`  
**Correctness class:** `[PASS-WITH-BOUNDED-REPAIRS E306-SAS-AUDIT-01]`  
**Route position:** `VALID ALTERNATIVE / CLEANER HIERARCHY BUT COMPARABLE BURDEN`

Verdict key:

- `PASS`: independently recomputed and closed as written;
- `PASS AFTER SAS-BR-1`: valid after the bounded exact-cold range repair recorded in the report;
- `PRESERVE`: not a defect, but the stated detail is mandatory downstream.

## A. Arithmetic family and population floor

| ID | Claim | Verdict | Independent recomputation / condition |
|---|---|---|---|
| A1 | Complete-pair reciprocal load | PASS | `sum_(p<q)1/(pq)=((sum_p1/p)^2-sum_p1/p^2)/2 -> (log 3)^2/2`. |
| A2 | Sparse `b`-family reciprocal load | PASS | `sum_(r|b,s in S)1/(rs)=O_b(|S|/Z)=O_b((log Z)^3/Z)`. |
| A3 | Complete-pair square load and actual variance | PASS | Pairs in `[X,2X)` give the lower bound; `sum_p1/p^2=O(1/(XlogX))` gives the upper bound; sparse auxiliary square load is negligible. |
| A4 | Distinctness, avoidance, period divisibility | PASS | Large `X` separates primes dividing `b` from `P`; unique factorization separates both denominator families; all denominators divide squarefree `L`. |
| A5 | Compact Bernoulli interval | PASS | Total load lies in fixed `(lambda_-,lambda_+)` with `1/3<lambda_-<lambda_+<1`; hence `theta=1/(bLambda)` is compactly inside `(0,1)`. |
| A6 | No-wrap | PASS | Selected reciprocal sum lies in `[0,Lambda)` with `Lambda<1`; congruence to `1/b` modulo one is equality. |
| A7 | Population floor, `r<Z/2` | PASS | Residue multiplicity `mu_r<=Z/(2r)+1`; `M/mu_r>>r/logZ`; cyclic packing yields `M^3/(mu_r^2r^2)>>Z/log^3Z`. |
| A8 | Population floor, `Z/2<=r<Z` | PASS | Omit `s=r`; a close phase gives short nonzero `v`; each `v` has at most two interval representatives; at least half the terms have size `>=M'/(64Z)`. |
| A9 | Uniformity in every nonzero residue | PASS | Inversion and multiplication by `d!=0` are permutations of nonzero residues; near-top argument fixes arbitrary nonzero `d`. |
| A10 | One deterministic common actual-prime core | PASS | One Bernoulli sample is union-bounded over fewer than `Z^2` tests; no row-dependent core is selected. |
| A11 | Core lower and upper size bounds | PASS | `E|S|asymp K(logZ)^3`; two-sided Chernoff intersects the simultaneous row-distance event with positive probability. |
| A12 | Simultaneous fixed rows `r|b` | PASS | The same lower size event gives `D_r^b(S)>=|S|/r^2`; no progression theorem is needed. |

## B. Row compression and defect expansion

| ID | Claim | Verdict | Independent recomputation / condition |
|---|---|---|---|
| B1 | Actual Bernoulli modulus bound | PASS | Compactness of `theta` gives `|(1-theta)+theta e(t)|<=exp(-kappa_b||t||^2)`. |
| B2 | Exact `D/4` row threshold | PASS | Two energies below `D/4` would give torus distance below `sqrt D`; hence every nonchosen row has energy at least `D/4`. |
| B3 | Uniform prime-row sibling factor | PASS | `sum_(x!=x*)<=r exp(-kappa_bD/4)<=Z exp(-kappa_bAlogZ/4)=delta<=Z^-K_0`. |
| B4 | Fixed `b`-row sibling factor | PASS | Each nonzero difference has phase norm at least `1/r` at every sensor; the sibling sum is `exp(-Omega_b(log^3Z))`. |
| B5 | Defect-set expansion by `U` | PASS | Internal factors incident to `U` are first bounded by one; retained `G-G` and decoder stars remain; only then do defective row sums factor. |
| B6 | Exact origin of `delta^|U|` | PASS | One actual sibling sum is paid for each defective row; no independence of discarded factors is asserted. |
| B7 | Exact denominator-factor partition | PASS | `S-S,S-R,R-R,S-P_low,R-P_low,P_low-P_low` partition `E_pair`; `S_b-S` is the entire auxiliary family. |
| B8 | Weighted retained-skeleton inequality | PASS | The all-decoder term retains the skeleton; every other term is bounded after replacing its retained modulus by one. |
| B9 | Factor `P_top(exp(Delta)-1)` | PASS | The fibre error is first bounded for fixed top data, then summed against the complete top partition `P_top=O_b(ZlogZ)`. |
| B10 | Empty/singleton row sets | PASS | The product inequality remains valid with zero or one compressed row; no exceptional convention is needed. |

## C. Robust cold rigidity and amplification

| ID | Claim | Verdict | Independent recomputation / condition |
|---|---|---|---|
| C1 | Reciprocal dispersion for arbitrary dense subsets | PASS | Close phases correspond to short nonzero `v`; at most two interval representatives per `v`; class size at least sixteen. |
| C2 | `R_0=0` branch | PASS | Separated before the square-root cutoff; all pair lifts vanish and the assignment is the zero label. |
| C3 | Base-prime label count | PASS | Nonbad labels lie in one residue class modulo `p_0` and in `[-B_0,B_0]`, giving `O(B_0/Z+1)` possibilities. |
| C4 | Dominant-label range and uniqueness | PASS AFTER SAS-BR-1 | Current `|m|<Z^2/4` is too wide for primes only `>=Z/2`. Impose `B_0<Z^2/16` and use labels in that range. |
| C5 | Same-class centred lifts | PASS AFTER SAS-BR-1 | With `|m|<Z^2/16`, one has `|m|<pq/2`, so the centred lift on a same-label edge is exactly `m`. |
| C6 | Cross-class nonzero reciprocal residue | PASS AFTER SAS-BR-1 | Distinct labels share the base-prime residue; if their difference vanished mod target `q`, then `p_0q` would divide a nonzero difference smaller than `p_0q`. |
| C7 | Small-class alternative | PASS | `M_0s_0=O((B_0/Z+1)^2)` contradicts a positive-density small-class mass unless `R_0>>Z/log^3Z`. |
| C8 | Substantial-class sum | PASS | The exact inner count is `(S_0-n_i)-(t-1)`; `s_0` absorbs the loss; ordered class pairs are divided by two in the constant. |
| C9 | Endpoint losses from `[Z/2,Z)` | PASS | Factors from `pq>=Z^2/4` are absorbed by the numerical class-size and label-smallness constants. |
| C10 | Zero-exception conclusion | PASS AFTER SAS-BR-1 | Once centred-lift legality is explicit, each exception costs `c|C|^3/Z^2`; the cold threshold forces fewer than one exception. |
| C11 | Quantitative label bound | PASS AFTER SAS-BR-1 | Same-class energy gives `|m|<=C sqrt(Q_G)/sigma_G`; the initial use of `H_pq=m` requires SAS-BR-1. |
| C12 | Core-defect actual phase formula | PASS | `H_(rs)/(rs)=j_r/s+m/(rs)` modulo integers; the perturbation is retained. |
| C13 | Core-defect `ell^2` perturbation | PASS | At the cold threshold, perturbation norm is `O(1/logZ)` versus dispersion norm `>>sqrt(Z)/log^(3/2)Z`. |
| C14 | Low retained energy gives one exact label | PASS AFTER SAS-BR-1 | Robust cold labels `G`; one core mismatch reaches the synchronization floor; all retained centred lifts then equal the integer label. |
| C15 | `U=emptyset` low energy | PASS | This and only this class is the genuine globally coherent top diagonal. |
| C16 | `U!=emptyset` low energy | PASS | The retained witness is diagonal, but original rows in `U` are actual nondecoder coordinates and remain an error sector. |
| C17 | High retained energy | PASS | It is energetic regardless of whether a formal residue label exists; no Gaussian identity is used. |

## D. Top partition, sparse observability, and Fourier closure

| ID | Claim | Verdict | Independent recomputation / condition |
|---|---|---|---|
| D1 | Core assignment count | PASS | `Y_S=prod_(s in S)s<=Z^|S|=exp(O((logZ)^4))`. |
| D2 | Synchronization floor dominates core entropy | PASS | `(logZ)^4=o(Z/log^3Z)`; `(1+delta)^N=exp(o(1))`. |
| D3 | Energetic small-defect sum | PASS | `Y_Se^{-kappa F_sync}(1+delta)^N=exp(-Omega(Z/log^3Z))`. |
| D4 | Large-defect binomial sum | PASS | `Y_S2^Ndelta^(N/2)=exp(-Omega(Z))` for fixed `K_0>=20`. |
| D5 | Cold nonempty-defect sum | PASS | Uniform Gaussian label sum `O(ZlogZ)` times `((1+delta)^N-1)` gives `O(Z^2delta)`. |
| D6 | Genuine diagonal/top partition | PASS AFTER SAS-BR-1 | Cold `U=emptyset` has `T=m^2sigma_(R,S)^2`; summation is `O(ZlogZ)`. Exact-cold legality depends on SAS-BR-1. |
| D7 | Sparse `b`-family reciprocal/square load | PASS | `O_b((logZ)^3/Z)` and `O_b((logZ)^3/Z^2)`. |
| D8 | Sparse `b`-row distance and decoder | PASS | `D_r^b>=|S|/r^2`; candidate `m mod r` is uniquely minimal through `|m|<=X^2/4`. |
| D9 | Squarefree target CRT identification | PASS | Agreement at every prime divisor of squarefree `b` is exactly agreement modulo `b`. |
| D10 | No hidden sibling reservoir | PASS | All target-denominator observability is carried by the actual sparse family `S_b-S`; no finite auxiliary reservoir remains. |
| D11 | Prime-coordinate decoder range | PASS | Candidate energy `m^2W_S/r^2<=O(1/logZ)` at `|m|<=M_dec`; this is below the row distance. |
| D12 | Major-arc Taylor expansion | PASS | Uniform small phases; exact linear cancellation; complete-pair cubic remainder `O(logX/X)`; sparse auxiliary smaller. |
| D13 | Positive major sum | PASS | Uniform Gaussian approximation over `|m|<=C/sigma_E` gives positive real mass `asymp1/sigma_E`. |
| D14 | Full-variance Gaussian tail | PASS | Through `X^2/4`, every coordinate decodes and every denominator phase is in the small disk. |
| D15 | Adaptive complete-pair interval | PASS | `[2sqrt|m|,3sqrt|m|]` lies in `P\B`, contains `>>sqrt|m|/log|m|` primes, and distinct pairs have phase in `[1/9,1/4]`. |
| D16 | Coherent top-label tail | PASS | Top retained variance gives exponent `>>X^2/log^6Z` at `M_dec`. |
| D17 | Five-sector exhaustion | PASS AFTER SAS-BR-1 | CRT is bijective; top assignments split uniquely by `U` and energy; lower rows split into decoder/sibling; coherent labels split into four magnitude ranges. |
| D18 | Strict terminal order | PASS | Structural constants first, then `C`, then `X`; no hidden reservoir or localization parameter. |
| D19 | Positivity and no-wrap closure | PASS | Sectors II–V are below the positive major contribution; congruence becomes equality because total load is below one. |
| D20 | Avoidance, numerator induction, `b=1,2` | PASS | Repeated avoiding unit representations remain disjoint; `1/2=1/3+1/6`; three avoiding copies of `1/3` give `1`. |

## E. Structural and route claims

| ID | Claim | Verdict | Independent conclusion |
|---|---|---|---|
| E1 | Fingerprint entropy is no longer load-bearing | PASS | No energy-dependent fingerprint count or level-set theorem appears; `Y_S` is a raw energy-independent count. |
| E2 | Core enumeration recreates equivalent entropy | REJECTED | Its logarithm is only `O((logZ)^4)` and is paid directly by the synchronization floor. |
| E3 | Robust cold rigidity recreates fingerprint entropy | REJECTED | It is solely a low-energy exact-label theorem and does not count energetic assignments. |
| E4 | Defect bookkeeping recreates fingerprint entropy | REJECTED | Its combinatorial costs are explicit binomial factors suppressed by actual row-tail weights. |
| E5 | “Sparse sensor interface with dense natural cold witness” is exact | PASS | Sensors and `b` rows are sparse; the retained witness still uses the complete graph on positive-density `G`. |
| E6 | Sparse rows reduce auxiliary load | PASS | Full-top `b` load is replaced by polylogarithmically many actual sensors, with no equivalent reservoir. |
| E7 | Theorem hierarchy is strictly cleaner | PASS | The fingerprint rigidity/entropy layer disappears; low/high energy split directly into exact label/exponential suppression. |
| E8 | Standalone proof burden is strictly shorter | NOT ESTABLISHED | The written packet is shorter, but sampling, robust-subset rigidity, defect expansion, amplification, and top-defect bookkeeping are substantial replacements. |
| E9 | Standalone proof burden relative to dense one-anchor | COMPARABLE | Cleaner hierarchy, comparable total ordinary-proof burden. |
| E10 | Route position | CLASSIFIED | `VALID ALTERNATIVE / CLEANER HIERARCHY BUT COMPARABLE BURDEN`, conditional on SAS-BR-1. |

## Final gate

The theorem route is mathematically viable and boundedly repairable. No canonical, manuscript, formal, release, or publication use should treat the current candidate as fully passed until SAS-BR-1 is incorporated and independently checked. No candidate file was modified by this audit.