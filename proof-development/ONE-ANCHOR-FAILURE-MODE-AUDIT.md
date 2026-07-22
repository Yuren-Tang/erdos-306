# E306-PD-OA1-01 — failure-mode audit

**Purpose:** adversarially test the one-anchor route at every place where a hidden multiblock, sibling, fibre, endpoint, or asymptotic assumption could survive.

## 1. Verdict

No counterexample or missing implication remains after the repairs recorded below.  The route classification is

```text
GENUINE STRICT SIMPLIFICATION /
COMPLETE AT PROOF-DEVELOPMENT LEVEL /
READY FOR INDEPENDENT ROUTE AUDIT.
```

This file records what was tested and why each possible failure is closed.

## 2. One-block base

### F1. Cross-label lemma applied below sixteen sensors

**Threat.** The dispersion lemma requires at least sixteen sensors.  A cross-label statement with only `|C_m|>=128B/Y` can enter a false small-class range.

**Disposition.** The human proof states

```text
|C_m|>=max(16,128B/Y).
```

Every substantial class in nondominant forcing has size at least

```text
s_0=256(B/Y+1)>=16.
```

**Status:** closed.

### F2. Division by the bad-pair cutoff at zero energy

**Threat.** The cutoff `B_0=A sqrt(R)Y^2/N` vanishes when `R=0`.

**Disposition.** The zero-energy case is separated first.  Every centred lift is zero, so every coordinate has label `0`.  Only `R>0` enters the cutoff argument.

**Status:** closed.

### F3. Incorrect cross-class summation

**Threat.** Summing over other substantial classes gives

```text
(S-n_i)-(t-1),
```

not `S-n_i-O(1)`, and ordered class pairs count each edge twice.

**Disposition.** The proof includes the factor `1/2` and uses

```text
S-n_i>=(t-1)s_0
```

to derive

```text
(S-n_i)-(t-1)>=(255/256)(S-n_i).
```

**Status:** closed.

### F4. Dominant label but nonzero exceptional set

**Threat.** A cold block might retain finitely many exceptional coordinates.

**Disposition.** Each exception pays `>>N^3/Y^2` on a disjoint star into the dominant class.  Therefore

```text
#exceptions <= C mathcal Q(a)Y^2/N^3 < Cc_w.
```

The fixed `c_w` makes this strictly below `1`, so the integer cardinality is zero.

**Status:** closed.

### F5. Fingerprint estimate not uniform in `R`

**Threat.** A fingerprint size chosen from `R` may leave a gap between low and high energy.

**Disposition.** The proof splits at `R=c_*N^4/Y^2`.  Below it, `s=ceil(A(RY^2)^(1/4))` lies in `[16,N/2]`; above it, the trivial entropy `O(Y)` is `o(R)`.  The ratio in the lower range is uniformly

```text
O(Y^(-1/4)log^(13/4)Y).
```

**Status:** closed.

## 3. Full-top auxiliary family

### F6. Collision between `E_pair` and `E_b`

**Threat.** A denominator `rq` might also equal a pair `pp'` from `P`.

**Disposition.** Every `r|b` is below `X`, while both `p,p'` are at least `X`.  Unique factorization makes collision impossible.  The same argument proves distinctness within both families.

**Status:** closed.

### F7. Full top block destroys the load window

**Threat.** Replacing a fixed reservoir by all top primes could add constant reciprocal load.

**Disposition.** The top reciprocal sum is

```text
sum_(q in B)1/q=O(1/logZ),
```

so

```text
Lambda_b=O_b(1/logZ)=o(1).
```

The complete-pair limit and compact Bernoulli interval are preserved.

**Status:** closed.

### F8. Full top block destroys variance comparison

**Threat.** The auxiliary inverse-square load could dominate the complete-pair variance.

**Disposition.** It is

```text
O_b(1/(ZlogZ))=o(1/(X^2log^2X))
```

because `Z=X^3`.

**Status:** closed.

### F9. No-wrap fails after adding all auxiliary denominators

**Threat.** The total reciprocal load might exceed one.

**Disposition.** Fix `lambda_+<1` above `(log3)^2/2`.  The auxiliary load tends to zero, so `Lambda<lambda_+<1` for large `X`.

**Status:** closed.

## 4. Row code

### F10. Residue multiplicity bound loses uniformity near `r=Z/2`

**Threat.** A top interval of length `Z/2` may wrap many times modulo a small row and too few times modulo a large row.

**Disposition.** One residue class contains at most

```text
mu_r<=Z/(2r)+1.
```

The cyclic lemma uses this exact multiplicity.  The product `mu_r^2r^2` is `O(Z^2)` uniformly for every `X<=r<Z/2`, giving

```text
D_r>>Z/log^3Z.
```

**Status:** closed.

### F11. The fixed rows `r|b` require PNT in arithmetic progressions

**Threat.** The candidate addendum estimated residue multiplicity as though top primes were equidistributed modulo `r`.

**Disposition.** That estimate is not used.  For fixed prime `r`, every nonzero `dq^{-1} mod r` has circle distance at least `1/r`; hence

```text
D_r>=|B|/r^2>>_bZ/logZ.
```

Only the ordinary PNT count of all top primes is needed.

**Status:** closed by replacement proof.

### F12. Nearest energy decoder need not maximize the Bernoulli product

**Threat.** The Bernoulli modulus is nonlinear in phase energy.

**Disposition.** The proof does not require product maximization.  It chooses an energy minimizer `x_r^*`.  Every other row satisfies `E_r(x)>=D_r/4`, and hence its product is individually at most `exp(-cD_r)`.  Summing gives the row tail.

**Status:** closed.

### F13. The arbitrary top shift changes row distance

**Threat.** Row kernels are shifted by the fixed top assignment.

**Disposition.** Pairwise differences of two row codewords are

```text
dq^{-1}/r mod 1,
```

independent of the shift.  The distance theorem is therefore shift-uniform.

**Status:** closed.

### F14. Summing row errors introduces an exponential number of coordinate tuples

**Threat.** Independent row bounds might be multiplied by the full product of row sizes.

**Disposition.** The exact product expansion gives

```text
product_r(A_r(x_r^*)+delta_r)-product_rA_r(x_r^*)
 <=exp(sum_rdelta_r)-1.
```

Only `Delta=sum delta_r` appears; no coordinate-product factor survives.

**Status:** closed.

## 5. Retained skeleton

### F15. A denominator factor is assigned twice

**Threat.** A complete pair with one top endpoint could be retained for damping and also used in a row kernel.

**Disposition.** The partition is exact:

```text
B-B pairs        -> top factor;
(P\B)-B pairs    -> lower row kernels;
S_b-B pairs      -> b-row kernels;
(P\B)-(P\B) pairs -> residual G.
```

The adaptive interval lies entirely in `P\B`, so its pair factors are genuinely retained.

**Status:** closed.

### F16. Complex phases invalidate the skeleton inequality

**Threat.** The Fourier factors are complex and the target phase depends on all `b` coordinates.

**Disposition.** The minor estimate first takes absolute values.  Each Bernoulli factor contributes its actual modulus; the target phase has modulus one.  The retained-skeleton inequality is applied to nonnegative products only.  Complex phases remain essential in the major Taylor sum, where no skeleton inequality is used.

**Status:** closed.

### F17. Top summation multiplies the fibre error by the number of all top assignments

**Threat.** There are exponentially many top assignments.

**Disposition.** The error is multiplied by the weighted top partition

```text
P_top=sum_(a_B)T_B(a_B)=O(ZlogZ),
```

not by the raw number of assignments.  Hence the global error is

```text
O(ZlogZ(e^Delta-1)).
```

**Status:** closed by explicit repair.

## 6. Decoder identification

### F18. Candidate phase `m/(rq)` is not centred

**Threat.** The representative of the CRT residue may differ from `m` by a multiple of `rq`.

**Disposition.** Circle distance satisfies

```text
||h/(rq)||=||m/(rq)||<=|m|/(rq)
```

whenever the row and top coordinates agree with `m`.  The candidate-energy upper bound needs no centred representative.

**Status:** closed.

### F19. The worst lower row is not controlled

**Threat.** Small `r` gives large candidate energy.

**Disposition.** The worst case is `r=X`.  At `|m|=M_dec`,

```text
E_r(m)<<Z/log^5Z,
D_r>>Z/log^3Z.
```

The ratio is `O(1/log^2Z)` uniformly.

**Status:** closed.

### F20. Agreement modulo the prime support of `b` need not imply agreement modulo `b`

**Threat.** This is false when `b` has repeated prime factors.

**Disposition.** The theorem assumes `b` squarefree.  Therefore `b` is exactly the product of its prime divisors, and CRT converts prime-coordinate agreement to agreement modulo `b`.

**Status:** closed; this is an exact use of squarefreeness.

### F21. `b` coordinates fail to decode in the adaptive range

**Threat.** The fixed-row candidate energy grows too large above `X^2/4`.

**Disposition.** The route does not claim or need `b`-decoder identification there.  Complete-pair factors depend only on the coordinates in `P`, all of which decode through `M_dec`.

**Status:** harmless by sector design.

## 7. Top partition

### F22. Low top energy admits several integer labels

**Threat.** The same top assignment could be represented by different labels.

**Disposition.** The one-block label bound gives `|m|=o(Z^2)`.  If two labels represented the same assignment, their difference would be divisible by two distinct top primes, whose product is `>>Z^2`, impossible unless the difference is zero.

**Status:** closed.

### F23. The high top shell entropy beats Fourier damping

**Threat.** The number of assignments could grow as fast as the damping exponent.

**Disposition.** Fingerprint entropy allows any fixed `epsilon>0` for sufficiently large `Z`.  Choose `epsilon<kappa_b/2`; unit-shell summation gives `O(exp(-cF_B))`.

**Status:** closed.

### F24. The low top partition is larger than polynomial

**Threat.** The number of labels below the floor may be enormous.

**Disposition.** Weighted summation gives a full Gaussian sum

```text
sum_mexp(-cm^2sigma_B0^2)=O(1/sigma_B0)=O(ZlogZ).
```

The raw range need not be counted.

**Status:** closed.

## 8. Adaptive interval

### F25. Lower endpoint falls below `P`

**Threat.** At `|m|=X^2/4`, the interval begins at `X`.

**Disposition.** Sector III uses the strict inequality `|m|>X^2/4`, so `2sqrt|m|>X`.  The boundary label belongs to Sector II.

**Status:** closed.

### F26. Upper endpoint enters the top block or leaves `P`

**Threat.** At `M_dec`, the interval could reach `Z`.

**Disposition.** For large `X`,

```text
3sqrt(M_dec)=3X^2/logZ<Z/2.
```

Thus the entire interval lies in `P\B`, exactly where its pair factors are retained.

**Status:** closed.

### F27. Integer rounding removes the prime supply

**Threat.** Real endpoints must be converted to integer prime-count intervals.

**Disposition.** Rounding changes the interval by at most two integers.  The PNT lower bound is `>>sqrt|m|/log|m|`, which tends uniformly to infinity.

**Status:** closed.

### F28. Diagonal exclusion destroys the quadratic pair count

**Threat.** `E_pair` uses distinct primes only.

**Disposition.** If `K_m` primes lie in the interval, there are `K_m(K_m-1)/2`; since `K_m` tends uniformly to infinity, this is `>>K_m^2`.

**Status:** closed.

### F29. Negative labels change the phase estimate

**Threat.** The interval is defined from `|m|`, while Fourier phases use `m`.

**Disposition.** Circle distance is even.  The bound

```text
1/9<=|m|/(pq)<=1/4
```

applies to both signs.

**Status:** closed.

### F30. Reusing the same prime pair for different labels causes overcounting

**Threat.** Adaptive intervals overlap as `m` varies.

**Disposition.** The energy lower bound is pointwise for each frequency.  No summation of edge-disjoint energy over different labels is made.

**Status:** closed.

## 9. Fourier exhaustion

### F31. A residual sibling sector survives

**Threat.** A frequency could agree with `m` on all block primes while differing modulo `b`.

**Disposition.** In Sectors I and II, every `b` prime coordinate also decodes to `m`, so no sibling exists.  In Sector III, `b` disagreement is allowed but irrelevant to complete-pair damping.  Sectors IV and V are controlled before any sibling classification.  Thus no unbounded or unaccounted sibling remains.

**Status:** closed.

### F32. The old factor `b` is silently omitted

**Threat.** Fixing `P` coordinates formerly left exactly `b` lifts modulo `L`.

**Disposition.** The new fibre analysis includes the prime coordinates of `b` as rows.  Fixing all coordinates fixes one frequency, and the row product sums those coordinates explicitly.  The old factor `b` has not been dropped; it has been resolved coordinate by coordinate.

**Status:** closed.

### F33. A coherent label lies in no numerical sector

**Threat.** Endpoint conventions could leave gaps.

**Disposition.** The ranges are

```text
|m|<=N;
N<|m|<=X^2/4;
X^2/4<|m|<=M_dec;
|m|>M_dec.
```

They are disjoint and cover all integers.

**Status:** closed.

### F34. Nondecoder errors are counted again inside labelled sectors

**Threat.** The skeleton split could overlap.

**Disposition.** For every top assignment, one coordinate tuple is designated the decoded point; all other tuples enter the error term.  The split is disjoint before top assignments are partitioned.

**Status:** closed.

## 10. Major arc and terminal budget

### F35. The Taylor linear term does not cancel

**Threat.** The auxiliary family changes the expected reciprocal mass.

**Disposition.** `theta` is defined from the full load `Lambda`, including `E_b`; hence

```text
theta sum_(e in E)1/e=1/b
```

exactly.  The target phase cancels the full linear term.

**Status:** closed.

### F36. Aggregate cubic remainder is only pointwise small

**Threat.** There are many denominators.

**Disposition.** Uniformly for `|m|<=C/sigma_E`,

```text
sum_e|m/e|^3
 <= |m|^3X^-2sum_e e^-2
 << C^3/(sigma_EX^2)
 << C^3logX/X ->0.
```

**Status:** closed.

### F37. The major sum has uncontrolled complex argument

**Threat.** Pointwise magnitude does not imply positive real part.

**Disposition.** The aggregate logarithmic remainder is uniformly made smaller than a fixed angle.  After exact linear cancellation, each major term has positive real part comparable to its Gaussian magnitude.  Conjugate terms also pair.

**Status:** closed.

### F38. `C` depends on `X`

**Threat.** A circular choice could hide in the Gaussian estimate.

**Disposition.** The Gaussian constants and major coefficient depend only on `b` and fixed compact data.  `C` is chosen once from a fixed inequality; only then is `X` chosen.

**Status:** closed.

### F39. A phrase such as “exponentially negligible” hides a missing scale comparison

**Threat.** Absolute smallness may not imply smallness relative to `1/sigma_E`.

**Disposition.** The proof displays:

```text
1/sigma_Easymp XlogX;
Sector III = O(X^4e^{-cX^2/log^2X});
Sector IV = O(ZlogZe^{-cX^2/log^6Z});
Sector V-a = O(e^{-cZ/log^3Z});
Sector V-b = O(Z^3logZe^{-cZ/log^3Z}).
```

Each is explicitly `o(1/sigma_E)`.

**Status:** closed.

## 11. Arithmetic closure

### F40. Fourier positivity yields only a weighted formal object

**Threat.** Positive total weight might not imply an actual subset.

**Disposition.** The weight is a finite sum of nonnegative Bernoulli weights.  If it is positive, at least one subset satisfies the congruence.

**Status:** closed.

### F41. Congruence does not imply equality

**Threat.** The reciprocal difference is only integral.

**Disposition.** The subset sum lies in `[0,Lambda]` with `Lambda<1`, while `1/b` lies in `(0,1)`.  Their integral difference lies in `(-1,1)` and is zero.

**Status:** closed.

### F42. Avoidance fails for the auxiliary denominators

**Threat.** They may be smaller than pair denominators.

**Disposition.** Every auxiliary denominator is at least `2*(Z/2)=Z`, which tends to infinity.  Choose `X` so that all pair and auxiliary denominators exceed every element of nonempty `T`.

**Status:** closed.

### F43. Numerator induction creates collisions

**Threat.** Repeated unit representations could reuse denominators.

**Disposition.** At each induction step, enlarge the forbidden set by all denominators already used.

**Status:** closed.

### F44. The cases `b=1,2` use non-squarefree intermediate denominators

**Threat.** The reductions might leave the theorem class.

**Disposition.** The intermediate denominators `2,3,6` are squarefree; the required unit representations are invoked only for denominators at least `3`, and avoidance preserves disjointness.

**Status:** closed.

## 12. Final classification

The audit found no false implication after incorporating:

- the three independent-audit repairs in the one-block base;
- the direct fixed-row proof for `r|b`;
- the weighted top-partition factor in the global fibre error.

No multiblock theorem is silently reused.  The route is neither an equivalent repackaging nor an incomplete candidate.  It is a genuine strict simplification ready for independent route audit.