# E306-SAS-AUDIT-01 — independent sparse-anchor proof audit report

**Role:** `Erdős 306 — Independent Sparse-Anchor Proof Auditor` (`E306-SAS-AUDIT-01`)  
**Controlling issue:** `Yuren-Tang/research-workbench#66`  
**Frozen candidate:** `proof-development/e306-sparse-anchor-v1@4061883d8ee0487ec154f365ce0e1fe915ee3f1c`  
**Owned review branch:** `review/e306-sparse-anchor-proof-audit-v1`  
**Branch base:** `4061883d8ee0487ec154f365ce0e1fe915ee3f1c`  
**Write boundary:** `review/**` only.

## 1. Final audit disposition

**Correctness class:** `[PASS-WITH-BOUNDED-REPAIRS E306-SAS-AUDIT-01]`

**Route-position classification:** `VALID ALTERNATIVE / CLEANER HIERARCHY BUT COMPARABLE BURDEN`

The sparse-anchor proof has a correct global architecture and closes every load-bearing module except for one bounded constant/range defect inside the robust exact-cold proof. The defect is local, does not require a new theorem, does not alter the denominator family, synchronization mechanism, Fourier partition, or terminal parameter order, and can be repaired by tightening the label range and recording the resulting centred-lift consequences explicitly.

No correctness was inferred from Lean, `v0.0.3`, Research Lead or PDL assurances, the previously audited dense one-anchor or repaired multiblock routes, AFT, a manuscript, or a Curator corpus. The six frozen `SPARSE-ANCHOR-*` files were treated as the sole mathematical candidate. The dense one-anchor packet was consulted only for architectural comparison.

## 2. Mandatory bounded repair

### SAS-BR-1 — exact-cold label range and centred-lift legality

In Section 8 of `SPARSE-ANCHOR-HUMAN-PROOF.md`, a dominant label is allowed to satisfy

```text
|m| < Z^2/4,
```

while the witness primes lie only in `[Z/2,Z)`. This range is too wide for three assertions used later:

1. two dominant labels sharing two primes need not be forced equal merely from the displayed range, because the product of two witness primes is only guaranteed to be at least `Z^2/4`, whereas two labels in `(-Z^2/4,Z^2/4)` may differ by almost `Z^2/2`;
2. for a same-label pair `p,q`, the centred CRT lift is not automatically the integer label unless `|m|<pq/2`, whose uniform lower bound is only `Z^2/8`;
3. for distinct base-prime label classes `m_i,m_j`, the reciprocal-dispersion difference must be nonzero modulo each target prime `q`; if it vanished, both `p_0` and `q` would divide `m_i-m_j`, and exclusion requires `|m_i-m_j|<p_0q`.

The existing cutoff already gives the needed repair. Under

```text
R_0 < c_w Z/(log Z)^3,
B_0 = A_0 sqrt(R_0) Z^2/M,
M asymp Z/log Z,
```

one has

```text
B_0/Z^2 = O(1/sqrt(Z log Z)) -> 0.
```

Thus, after fixing the structural constants and taking `Z` sufficiently large, impose explicitly

```text
B_0 < Z^2/16.
```

Then define the relevant dominant labels in a range no larger than `|m|<Z^2/16` (or define them directly among the labels produced by the base-prime construction, all of which satisfy `|m|<=B_0`). Record the following consequences before the class-energy argument:

```text
same class:       |m| < pq/2, hence H_pq=m;
distinct classes: 0<|m_i-m_j|<p_0q, hence m_i-m_j is nonzero mod q;
two dominant labels sharing p,q: pq divides their difference and the difference has size <pq, hence they coincide.
```

The later label estimate and zero-exception argument are unchanged. This is a bounded proof repair, not a change of route.

## 3. Arithmetic family and population floor

### 3.1 Denominator family, load, variance, period, and no-wrap

The family

```text
E_pair={pq:p,q in P,p<q},
E_b^S={rs:r|b prime,s in S},
L=b product_(p in P)p
```

is valid for large `X`: all factors are distinct primes, the two families are disjoint by unique factorization, all denominators divide the squarefree period, and avoidance follows by increasing `X`.

The complete-pair reciprocal load tends to `(log 3)^2/2`; the sparse auxiliary load is `O_b((log Z)^3/Z)`. Hence the Bernoulli parameter lies in a fixed compact subinterval of `(0,1)` and the total load is below one. The inverse-square mass remains

```text
sigma_E^2 asymp_b 1/(X^2 log^2 X).
```

The no-wrap conclusion is valid because every selected reciprocal sum lies in `[0,Lambda)` with `Lambda<1`.

### 3.2 Full-range population energy floor

The two row ranges were recomputed separately.

For `r<Z/2`, a residue modulo `r` occurs among integers of `[Z/2,Z)` with multiplicity at most

```text
mu_r <= Z/(2r)+1 <= 2Z/r.
```

Inversion and multiplication by a nonzero `d` preserve multiplicities. Since

```text
M/mu_r >> r/log Z >= Z^(1/3)/log Z -> infinity,
```

the cyclic-packing hypothesis `M>=8mu_r` holds uniformly, and

```text
M^3/(mu_r^2 r^2) >> Z/(log Z)^3.
```

For `Z/2<=r<Z`, after omitting `s=r`, a phase smaller than `M'/(64Z)` yields a nonzero integer `v` of size at most `M'/64` with `vs=d mod r`. Each fixed `v` permits at most two interval representatives, so fewer than half of the `M'` primes can be close. The remaining terms give

```text
(M'/2)(M'/(64Z))^2 >> Z/(log Z)^3.
```

The exclusion of `s=r`, the multiplicity hypotheses, and uniformity in every nonzero residue are all legitimate.

### 3.3 One deterministic actual-prime core

With sampling probability

```text
rho=K(log Z)^4/Z,
```

every test has expected energy at least `c_0K log Z`. Scaling by four places the independent summands in `[0,1]`, and the standard half-mean lower-tail estimate gives

```text
Pr(Y_(r,d)<(1/2)EY_(r,d)) <= exp(-(1/2)EY_(r,d)).
```

There are fewer than `Z^2` prime-row/residue tests. Taking `K` so that `c_0K/2>4` and `c_0K/2>=A` makes the simultaneous failure probability tend to zero. Two-sided concentration simultaneously yields

```text
c_A(log Z)^3 <= |S| <= C_A(log Z)^3.
```

The same sample therefore supplies the lower bound needed by every fixed row `r|b`; no separate random core or progression theorem is used.

## 4. Row compression and defect expansion

### 4.1 Actual Bernoulli row tail

The exact Bernoulli factor gives

```text
|(1-theta)+theta e(t)| <= exp(-kappa_b ||t||^2).
```

If two row values both had energy below `D_r(S)/4`, their torus `ell^2` norms would each be below `sqrt(D_r)/2`, so their mutual distance would be below `sqrt(D_r)`, contradicting the code distance. Therefore every nonchosen row value has energy at least `D_r/4`, including the case in which the chosen minimum itself is already at least that threshold. Hence

```text
sum_(x!=x_r^*) exp(-kappa_b E_r(x))
 <= r exp(-kappa_b D_r/4)
 <= Z exp(-kappa_b A log Z/4)=delta.
```

The factor `D/4` and the prefactor `Z` are correct. For `r|b`, the termwise distance `>=1/r` and the lower bound on `|S|` give a superpolynomially small sibling sum.

### 4.2 Decoder-defect expansion

For a fixed defect set `U`, all internal factors incident to `U` are discarded only after bounding their moduli by one. Every `G-G` factor and every decoder star factor on `G=R\U` remains. The sums over defective rows then separate, and each contributes its actual sibling sum at most `delta`; this is the exact source of `delta^{|U|}`. No probabilistic or Gibbs-factor independence is assumed.

### 4.3 Weighted retained-skeleton inequality

The factor partition

```text
S-R,R-R        -> top synchronization,
S-P_low        -> lower prime row kernels,
S_b-S          -> target-denominator row kernels,
S-S,R-P_low,
P_low-P_low    -> retained skeleton
```

is disjoint and exhaustive. The all-decoder term retains the whole skeleton. Every other fibre is bounded only after the retained factor is replaced by one, giving

```text
P_top(exp(Delta)-1),
P_top=O_b(Z log Z),
Delta<=Zdelta+exp(-Omega_b((log Z)^3)).
```

The empty and singleton-row cases are covered by the same product inequality.

## 5. Robust cold rigidity and amplification

Subject to SAS-BR-1, the repaired positive-density exact-cold theorem is valid.

The reciprocal-dispersion lemma is applied only to classes of size at least sixteen. The `R_0=0` case is separated before the square-root cutoff. The label count is `O(B_0/Z+1)`. Small-class and substantial-class alternatives both force energy `>>Z/(log Z)^3` in the absence of a dominant class. The substantial-class calculation correctly retains

```text
(S_0-n_i)-(t-1)
```

and absorbs the factor `1/2` from ordered class-pair double counting into the absolute constant. The endpoint losses from primes in `[Z/2,Z)` are absorbed by the chosen class-size constants.

After SAS-BR-1 makes every same-class centred lift and every cross-class nonzero residue legal, the dominant-class energy gives the label bound. Reciprocal dispersion from the dominant class to an exceptional coordinate, with the actual label perturbation retained in `ell^2`, forces the number of exceptions below one.

Core-defect amplification is also valid. For a mismatching `s in S`, the actual phase satisfies, modulo integers,

```text
H_(rs)/(rs)=j_r/s+m/(rs).
```

The reciprocal-dispersion vector has squared norm `>>Z/(log Z)^3`, while the label perturbation has norm `O(1/log Z)` at the cold threshold. The reverse triangle inequality therefore gives a fixed positive fraction of the synchronization floor.

## 6. Exact top partition and entropy verdict

The proof correctly distinguishes:

```text
U=emptyset, T_U<F_sync:
  genuine global integer diagonal;

U!=emptyset, T_U<F_sync:
  retained witness diagonal, but original top coordinates remain defective;

T_U>=F_sync:
  energetic, whether or not a formal residue label exists.
```

For energetic small defects,

```text
Y_S exp(-kappa_b F_sync)(1+delta)^N
```

is exponentially small because

```text
log Y_S=O((log Z)^4)=o(Z/(log Z)^3).
```

For large defects,

```text
log(Y_S 2^N delta^(N/2))
 =O((log Z)^4)+O(Z/log Z)-Omega(N log Z)
 =-Omega(Z).
```

Cold nonempty defects contribute

```text
O(Z log Z)((1+delta)^N-1)=O(Z^2delta).
```

The remaining diagonal sum is `O(Z log Z)`. Thus the complete top partition and the noncoherent error bound are correct.

Fingerprint entropy is genuinely not load-bearing. The core count `Y_S` is an energy-independent enumeration of all core assignments, and robust cold rigidity is a low-energy structural theorem. Neither is a fingerprint level-set estimate. Defect bookkeeping does not reconstruct an equivalent entropy theorem: its combinatorial cost is paid directly by `(1+delta)^N` or `2^Ndelta^(N/2)`.

## 7. Sparse target-denominator observability

The sparse family `E_b^S` has reciprocal load `O_b((log Z)^3/Z)` and square load `O_b((log Z)^3/Z^2)`, while every nonzero fixed-row difference has energy at least `|S|/r^2`. The decoder is unique through `|m|<=X^2/4`, and squarefree CRT identification then gives the single residue `m mod b`. There is no hidden sibling reservoir.

The phrase

```text
sparse sensor interface with dense natural cold witness
```

is mathematically exact: only the sensor interface and the `b`-sensitive rows are sparse; the proof still uses the complete internal graph on the positive-density witness set `G`, already present in the complete-pair denominator family.

## 8. Complete Fourier closure

The actual-family Taylor expansion is valid uniformly on `|m|<=C/sigma_E`; the complete-pair cubic remainder is `O(log X/X)`, and the sparse auxiliary remainder is smaller. The linear phase cancels exactly because `theta sum_e1/e=1/b`.

The five sectors are disjoint and exhaustive after the main/error decomposition:

1. direct positive major arc;
2. full-variance Gaussian tail through `X^2/4`;
3. adaptive complete-pair damping through `M_dec`;
4. coherent top-label tail above `M_dec` within the cold-label range;
5. energetic top assignments, large defect sets, cold nonempty defects, and lower or `b`-row siblings.

The adaptive interval lies in `P\B`, contains the required prime count, uses distinct primes, and gives a fixed phase separation. Sector IV is suppressed by the top retained variance. Sector V is `o(1/sigma_E)`. The terminal order `C -> X`, positivity, no-wrap, avoidance, numerator induction, and the reductions for `b=1,2` are all valid.

## 9. Route assessment

The sparse route genuinely removes the dense one-anchor fingerprint-rigidity/entropy layer and the full-top `b` family. It does not recreate either through a hidden reservoir or energy-dependent core count. Its theorem hierarchy is strictly cleaner:

```text
low retained energy -> exact label;
high retained energy -> direct exponential suppression.
```

However, the standalone burden remains comparable rather than decisively shorter. Population sampling, simultaneous concentration, defect expansion, robust-subset cold rigidity, core-defect amplification, and the explicit cold-nonempty-defect sector replace the removed fingerprint layer. The currently written sparse proof is shorter in raw file length, but the mathematical burden is not reduced enough to justify `PREFERRED OVER DENSE ONE-ANCHOR` on architecture alone.

Accordingly the route is a valid cleaner alternative, conditional on SAS-BR-1, but final canonical adoption remains a Director/Curator decision.

## 10. Defect ledger and mutation confirmation

### Mandatory bounded repair

- `SAS-BR-1`: tighten the robust exact-cold label range and explicitly justify same-label centred lifts, cross-label nonzero residues, and dominant-label uniqueness.

### Mandatory downstream preservation conditions

- preserve both population-floor row ranges;
- preserve one common actual-prime core and its two-sided size bound;
- preserve the exact `D/4` row-tail conversion and actual Bernoulli kernel;
- preserve the legal factor-discarding order in the defect expansion;
- preserve all repaired exact-cold constants, including SAS-BR-1;
- preserve actual-phase `ell^2` perturbation in core amplification;
- preserve the three-way energetic/cold/global-defect distinction;
- preserve `Y_S`, `(1+delta)^N`, and the large-defect binomial cost;
- preserve the exact denominator partition and `P_top(exp(Delta)-1)`;
- preserve sparse `b`-row observability without a reservoir;
- preserve the five-sector exhaustion and strict `C -> X` order;
- preserve no-wrap, avoidance, numerator induction, and `b=1,2` closure.

**No-candidate-mutation confirmation:** no file under `proof-development/**`, `research/**`, any other `review/**` branch, AFT, mathematics corpus, manuscript, Lean, workflow, release, tag, DOI, default branch, arXiv, journal, or submission surface was modified by this audit.