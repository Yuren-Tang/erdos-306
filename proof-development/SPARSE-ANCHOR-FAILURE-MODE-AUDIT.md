# E306-PD-SAS-01 — sparse-anchor failure-mode audit

**Scope:** adversarial self-audit of the proof-development packet.  
**Authority:** none beyond the ordinary arguments restated in this packet.  
**Disposition:** no counterexample or missing implication remains at proof-development level; independent audit is still required.

## 1. Population-floor failures

### 1.1 Treating all rows as `r<Z/2`

This would fail for top rows because the inverse-residue multiplicity estimate no longer gives the required saving. The proof has a separate `Z/2<=r<Z` congruence-counting argument.

### 1.2 Omitting the row prime itself

When `r in B`, the phase at `s=r` is undefined. The population sum and the sampling test explicitly omit `s=r`; removing one prime does not change the scale.

### 1.3 Applying cyclic packing outside its range

The packing lemma requires `M>=8mu`. Here

```text
M/mu >> r/logZ >= X/logZ -> infinity,
```

so the condition is verified uniformly before application.

## 2. Sparse-core failures

### 2.1 Choosing a different core for each row

That would not synchronize the quotient. The proof uses one Bernoulli sample and a union bound over fewer than `Z^2` simultaneous tests.

### 2.2 Keeping only an upper bound on `|S|`

An `O(log^3Z)` upper bound alone does not force strong fixed-`r|b` tails. The packet proves

```text
|S|asymp_A log^3Z
```

by two-sided concentration.

### 2.3 Hiding the core-assignment count

The count is written explicitly:

```text
Y_S<=exp(O(log^4Z)).
```

It is dominated by `exp(-cZ/log^3Z)` and is not called negligible without this comparison.

## 3. Row-kernel failures

### 3.1 Using an abstract Gaussian instead of the actual kernel

The proof derives

```text
|(1-theta)+theta e(t)|<=exp(-kappa_b||t||^2)
```

from the exact Bernoulli factor and keeps `kappa_b` throughout.

### 3.2 Assuming the minimizer has small energy

The row-tail proof does not assume this. If the minimum is already at least `D/4`, every nonchosen value is. If it is below `D/4`, torus separation shows it is the unique value below that threshold.

### 3.3 Using PNT in progressions for `r|b`

No progression theorem is used. Every nonzero row difference has circle distance at least `1/r` at every sensor.

## 4. Decoder-defect expansion failures

### 4.1 Illegal independence of internal edges

The proof never factorizes the original internal Gibbs weight. For a fixed `U`, every internal factor incident to `U` is discarded as at most one. Only then do the defective star-row sums separate.

### 4.2 Losing the retained synchronization energy

All `G-G` internal factors and all decoder star factors on `G` remain in `T_U`. Synchronization is lost only after explicitly paying `delta` for the removed vertex.

### 4.3 Omitting binomial entropy

Both `(1+delta)^N` and the large-defect `2^N` factor are retained.

## 5. Robust exact-cold failures

### 5.1 Importing the dense theorem without proof

The positive-density subset theorem is reproved. Its hypotheses use only interval location, positive cardinality density, reciprocal dispersion, and complete internal energy.

### 5.2 Repeating the prior `sqrt R` division error

The case `Q_G=0` is separated before `B_0` is defined.

### 5.3 Applying reciprocal dispersion to a class smaller than sixteen

The substantial threshold is at least sixteen in every application.

### 5.4 Dropping `(t-1)` or double-counting ordered class pairs

The exact inner sum is

```text
(S_0-n_i)-(t-1),
```

and the ordered-pair factor `1/2` is absorbed once into the constant.

### 5.5 Missing the endpoint factor from `[Z/2,Z)`

The threshold `s_0=1024(B_0/Z+1)` and the final label smallness `|m|<=|C|Z/1024` absorb the factor four coming from `pq>=Z^2/4`.

## 6. Core-amplification failures

### 6.1 Replacing actual star phases by formal reciprocal phases

The proof writes

```text
H_(rs)/(rs)=j_r/s+m/(rs)
```

and controls the second term in `l^2`; it is not omitted.

### 6.2 Using a label bound too weak for perturbation control

At the synchronization floor,

```text
|m|<<Z^(3/2)/(logZ)^(1/2).
```

The perturbation norm is `O(1/logZ)`, while the reciprocal-dispersion norm is `>>sqrt(Z)/log^(3/2)Z`.

### 6.3 Allowing `s` inside the witness set

`S` and `R`, hence `S` and `G`, are disjoint. The reciprocal-dispersion lemma therefore has no singular sensor.

## 7. Diagonal-partition failures

### 7.1 Calling every labelled high-energy assignment diagonal

This is false. A label alone does not imply the centred lifts equal that integer. The packet first separates `T_U>=F_sync` and bounds it energetically. The Gaussian identity is used only below the cold floor, where `|m|=o(Z^2)`.

### 7.2 Calling cold `U!=emptyset` globally coherent

This is also false: the original rows in `U` are nondecoders. They form a separate top-defect error of size

```text
O(ZlogZ)((1+delta)^N-1).
```

Only cold `U=emptyset` is the genuine global diagonal.

### 7.3 Assuming uniqueness of the integer label from one sensor

Uniqueness is supplied by the full retained witness block and, equivalently, by products of multiple primes. The label range is much smaller than the relevant prime products.

### 7.4 Forgetting `S-S` factors

They are not used in the synchronization upper bound, but are listed in the retained skeleton and appear in the actual Fourier product.

## 8. Lower-fibre failures

### 8.1 Summing row errors without the top partition

The correct error is

```text
P_top(exp(Delta)-1),
```

not merely `Delta`. The polynomial factor `P_top=O(ZlogZ)` is retained.

### 8.2 Dropping lower-lower complete-pair factors

They remain in the decoded skeleton. They are precisely what supplies adaptive damping in Sector III.

### 8.3 Double-using an edge

The six complete-pair edge classes are partitioned explicitly. No edge belongs to both a row kernel and the retained skeleton.

## 9. Decoder-identification failures

### 9.1 Ignoring centred-lift wrap

For `|m|<=M_dec`,

```text
M_dec<XZ/4<=rs/2
```

for every lower prime `r` and large `X`; the candidate lift is actually `m`.

### 9.2 Comparing candidate energy only pointwise

The proof compares the full star energy

```text
m^2W_S/r^2
```

with the full code distance `D_r(S)`, uniformly down to `r=X`.

### 9.3 Using squarefreeness at the wrong place

Squarefreeness of `b` is used only after every prime divisor coordinate has decoded, to identify one residue modulo `b`. It is not used to strengthen a row estimate.

## 10. Analytic-sector failures

### 10.1 Major arc for the wrong denominator family

The Taylor expansion uses `E_pair disjoint-union E_b^S`, not the old full-top `E_b`.

### 10.2 Omitting the cubic remainder

The packet checks

```text
(C/sigma_E)^3 sum_(e in E)e^(-3)=o(1).
```

The complete-pair part is `O(logX/X)` and the sparse auxiliary part is smaller.

### 10.3 Adaptive interval leaving `P\B`

For `X^2/4<|m|<=M_dec`,

```text
[2sqrt(|m|),3sqrt(|m|)] subset [X,Z/2)
```

for large `X`.

### 10.4 Missing diagonal exclusion

Distinct primes in the adaptive interval are used, and their products lie in `[4|m|,9|m|]`; every pair phase is between `1/9` and `1/4`.

### 10.5 Ignoring undecoded `b` coordinates in Sector III

Their row factors are at most one. Adaptive damping uses only decoded prime-prime factors and remains valid.

## 11. Exhaustion failures

### 11.1 Suppressed CRT multiplicity

The period is squarefree and the coordinate map is a bijection.

### 11.2 A sixth uncharged top class

Every top assignment has a unique defect set `U`. It is exactly one of:

```text
large U,
small U with T_U>=F_sync,
small nonempty U with T_U<F_sync,
U=emptyset with T_emptyset<F_sync.
```

The last class is the coherent main class; the first three are Sector V.

### 11.3 A lower-row class outside main or sibling

Each lower row is either its chosen decoder or a sibling. The retained-skeleton inequality exhausts their product expansion.

## 12. Arithmetic-closure failures

### 12.1 Congruence without equality

The reciprocal load is strictly below one. The selected sum lies in `[0,1)`, while `1/b in (0,1)`, so congruence modulo one forces equality.

### 12.2 Empty forbidden set

Avoidance is stated conditionally: the lower bound on products is imposed only when `T` is nonempty.

### 12.3 Repeated denominators during numerator induction

Each new unit representation is constructed with the union of `T` and all previously used denominators as forbidden set.

## 13. Fingerprint-entropy verdict

No fingerprint map, energy-dependent fingerprint count, or global level-set theorem appears in the proof. Two superficially similar quantities remain:

```text
Y_S=prod_(s in S)s,
robust exact-cold class counting.
```

The first is raw finite enumeration with no energy dependence. The second proves only low-energy rigidity. Neither performs the energetic entropy suppression formerly supplied by fingerprint entropy.

## 14. Concision verdict

The route is cleaner in logical hierarchy and eliminates one difficult theorem family. It is not honestly shorter in a standalone packet because it introduces sampling, defect expansion, robust-subset restatement, amplification, and the explicit top-defect correction.

## 15. Final self-audit disposition

No false step or unclosed implication has been found after the corrections above. The proper next gate is an independent sparse-route ordinary-proof audit, not manuscript adoption or Curator integration.
