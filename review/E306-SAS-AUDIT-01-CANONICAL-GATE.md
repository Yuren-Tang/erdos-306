# E306-SAS-AUDIT-01 — canonical gate

**Frozen candidate:** `proof-development/e306-sparse-anchor-v1@4061883d8ee0487ec154f365ce0e1fe915ee3f1c`  
**Audit class:** `[PASS-WITH-BOUNDED-REPAIRS E306-SAS-AUDIT-01]`  
**Route advice:** `VALID ALTERNATIVE / CLEANER HIERARCHY BUT COMPARABLE BURDEN`  
**Authority boundary:** ordinary-mathematics audit only; no Curator, manuscript, formal, release, or publication authority.

## 1. Gate decision

The sparse-anchor route is mathematically viable, but the current frozen candidate is **not yet eligible for unconditional canonical adoption**. Canonical or manuscript promotion is blocked until the bounded repair `SAS-BR-1` is incorporated into a new fixed candidate and independently checked.

The blocked item is local:

```text
robust exact-cold label range and centred-lift legality.
```

No other proof module requires structural revision.

After this repair, the route may be admitted as a correct ordinary-proof alternative. Whether it should replace dense one-anchor as the canonical human proof is a separate preference decision; correctness does not by itself establish preference.

## 2. Mandatory pre-promotion repair

A repaired candidate must change the robust exact-cold argument so that the base-prime labels are uniformly much smaller than products of witness primes.

From

```text
B_0=A_0 sqrt(R_0) Z^2/M,
R_0<c_w Z/(log Z)^3,
M asymp Z/log Z,
```

record explicitly that

```text
B_0=o(Z^2),
```

and, after increasing the arithmetic threshold,

```text
B_0<Z^2/16.
```

The dominant-label definition and every class argument must be restricted accordingly. The repaired proof must explicitly state:

1. if `p,q in [Z/2,Z)` belong to one label class, then `|m|<pq/2`, so the centred pair lift is exactly `m`;
2. if two different base-prime labels `m_i,m_j` are compared at target prime `q`, then `m_i-m_j` is nonzero modulo `q`; otherwise `p_0q` divides a nonzero difference of size below `p_0q`;
3. two dominant labels sharing two primes are equal because the product of those primes divides a difference of smaller absolute value;
4. the dominant-class energy and zero-exception arguments use these facts before invoking the label bound.

A mere change of the displayed constant without these logical consequences is not sufficient.

## 3. Mathematical details that must be preserved

### 3.1 Arithmetic family

Preserve exactly:

```text
Z=X^3,
P={p prime:X<=p<Z},
B={q prime:Z/2<=q<Z},
S subset B,
E_pair={pq:p,q in P,p<q},
E_b^S={rs:r|b prime,s in S},
L=b product_(p in P)p.
```

Preserve the disjointness proof, squarefree period, avoidance threshold, complete-pair load, sparse auxiliary load, actual variance, and total load below one.

### 3.2 Full-range population floor

Do not merge the two row ranges.

For `r<Z/2`, preserve:

```text
mu_r<=Z/(2r)+1,
M/mu_r>>r/logZ,
M>=8mu_r,
M^3/(mu_r^2r^2)>>Z/log^3Z.
```

For `Z/2<=r<Z`, preserve:

```text
exclusion of s=r,
short nonzero v,
at most two interval representatives per v,
at least half the phases separated by M'/(64Z).
```

### 3.3 Common actual-prime core

Preserve one Bernoulli sample for all rows. A later text must retain:

```text
rho=K(logZ)^4/Z,
expected energy >=cKlogZ,
fewer than Z^2 simultaneous tests,
two-sided size concentration,
|S|asymp(logZ)^3.
```

The lower size bound is mandatory for fixed prime divisors of `b`.

### 3.4 Actual row tails

Preserve the actual Bernoulli kernel and the exact geometric conversion:

```text
pairwise squared row distance >=D
 -> at most one row value has energy <D/4
 -> sibling sum <=r exp(-kappa_bD/4).
```

Do not replace the exact `D/4` step by an unspecified Gaussian heuristic.

### 3.5 Decoder-defect expansion

Preserve the legal order:

1. fix `U`;
2. retain every `G-G` factor and every decoder star on `G`;
3. discard only factors incident to `U`, using modulus at most one;
4. then factor the defective row sums;
5. obtain one actual `delta` factor per defective row.

No independence statement may replace this factor-discarding argument.

### 3.6 Robust exact-cold theorem

Preserve all existing repairs and `SAS-BR-1`:

```text
class size at least sixteen,
R_0=0 handled before sqrt(R_0),
base-prime label count,
small/substantial class split,
(S_0-n_i)-(t-1),
ordered-pair factor 1/2,
endpoint losses from [Z/2,Z),
tight label range,
same-label centred lifts,
cross-label nonzero residues,
quantitative label bound,
zero exceptions.
```

### 3.7 Core-defect amplification

Preserve actual star phases, not formal reciprocal phases:

```text
H_(rs)/(rs)=j_r/s+m/(rs) modulo integers.
```

Preserve the `ell^2` comparison between dispersion and the label perturbation. The perturbation may not be dropped pointwise or by an unstated “smallness” assertion.

### 3.8 Three-way top classification

A canonical proof must distinguish exactly:

```text
U=emptyset and low retained energy:
  genuine global diagonal;

U!=emptyset and low retained energy:
  retained diagonal plus actual top defects;

high retained energy:
  energetic sector, irrespective of formal label existence.
```

The Gaussian identity may be used only after the exact-cold theorem has made every retained centred lift equal to the integer label.

### 3.9 Top error sums

Preserve all entropy and binomial factors:

```text
Y_S<=exp(O((logZ)^4)),
Y_Se^{-kappa F_sync}(1+delta)^N,
Y_S2^Ndelta^(N/2),
O(ZlogZ)((1+delta)^N-1).
```

The statement that the synchronization floor dominates core enumeration must be written as the explicit comparison

```text
(logZ)^4=o(Z/log^3Z).
```

### 3.10 Exact denominator partition and lower compression

Preserve the six complete-pair classes and the auxiliary class:

```text
S-S,
S-R,
R-R,
S-P_low,
R-P_low,
P_low-P_low,
S_b-S.
```

Preserve the retained skeleton `S-S`, `R-P_low`, and `P_low-P_low`. The accumulated lower-fibre error must remain

```text
P_top(exp(Delta)-1),
```

not an unweighted row-error sum.

### 3.11 Sparse target-denominator observability

Preserve:

```text
reciprocal load O_b((logZ)^3/Z),
square load O_b((logZ)^3/Z^2),
row distance >=|S|/r^2,
decoder validity through |m|<=X^2/4,
squarefree CRT identification modulo b.
```

Do not introduce a hidden sibling reservoir or claim progression equidistribution.

### 3.12 Decoder ranges and five sectors

Preserve the two decoder ranges:

```text
prime coordinates: |m|<=M_dec=XZ/(logZ)^2,
b coordinates:     |m|<=X^2/4.
```

Preserve all five sectors, the adaptive interval inside `P\B`, distinct-prime exclusion, actual-family Taylor remainder, coherent top-label tail, and assignment of all top and lower defects to Sector V.

### 3.13 Terminal closure

Preserve the strict order

```text
structural constants -> C -> X.
```

Preserve positive major mass, absolute suppression of Sectors II–V, total reciprocal load below one, avoidance, numerator induction, and the explicit `b=1,2` reductions.

## 4. Correctness versus proof preference

### Correctness conclusion

After `SAS-BR-1`, the sparse route supports the headline theorem as a standalone ordinary proof.

### Preference conclusion

The route has a strictly cleaner theorem hierarchy and removes fingerprint entropy and the full-top target-denominator family. It still depends on dense positive-density exact-cold rigidity and adds sampling, defect expansion, amplification, and explicit defect bookkeeping.

Therefore this audit does **not** direct canonical replacement of dense one-anchor. The mathematically justified route advice is:

```text
VALID ALTERNATIVE / CLEANER HIERARCHY BUT COMPARABLE BURDEN.
```

A later canonical decision may prefer it for exposition, modularity, or future formalization, but that choice requires a direct editorial and maintenance comparison beyond theorem correctness.

## 5. Forbidden downstream inferences

This audit does not establish:

```text
Lean correspondence,
release compatibility,
manuscript readiness,
novelty or priority,
Curator integration,
formal theorem-name correspondence,
arXiv or journal fitness,
publication or submission readiness.
```

No downstream surface may cite the audit as authority for those matters.

## 6. No-mutation record

This audit added only the four required files under `review/**` on `review/e306-sparse-anchor-proof-audit-v1`. The frozen candidate and every excluded surface remained unchanged.