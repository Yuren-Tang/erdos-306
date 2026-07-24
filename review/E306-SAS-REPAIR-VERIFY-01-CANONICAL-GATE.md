# E306-SAS-REPAIR-VERIFY-01 — canonical gate

**Exact repaired candidate:** `proof-development/e306-sparse-anchor-v1@3074ca46452a6f3528be588033fe414d5a0c0ef9`  
**Exact pre-repair candidate:** `proof-development/e306-sparse-anchor-v1@4061883d8ee0487ec154f365ce0e1fe915ee3f1c`  
**Controlling audit:** `review/e306-sparse-anchor-proof-audit-v1@e9547c15b5858f5c456a9b3ffb9d30d1a0d15233`  
**Verification class:** `[PASS E306-SAS-REPAIR-VERIFY-01]`  
**Authority boundary:** independent bounded ordinary-mathematics repair verification only.

## 1. Gate decision

`SAS-BR-1` is independently verified and closed. The repaired sparse-anchor packet is now:

```text
INDEPENDENTLY ASSURED ALTERNATIVE /
CLEANER HIERARCHY BUT COMPARABLE BURDEN.
```

The prior bounded block on ordinary-mathematics correctness is removed. This gate does not itself direct canonical replacement of dense one-anchor and does not authorize manuscript, Curator, Lean, release, or publication movement.

## 2. Verified repair kernel

The following implication is independently checked:

```text
R_0<c_wZ/(log Z)^3,
Masymp Z/log Z,
B_0=A_0sqrt(R_0)Z^2/M

=> B_0/Z^2=O((Zlog Z)^(-1/2))=o(1)

=> after the structural constants are fixed and X is chosen last,
   B_0<Z^2/16 uniformly throughout the cold range.
```

Every operative base-prime or dominant label is restricted to `|m|<=B_0`. The former operative allowance `|m|<Z^2/4` is absent.

The three legality consequences are verified before their first substantial uses:

1. **Same-class centred lift.** For distinct `p,q in [Z/2,Z)` in `C(m)`,

   ```text
   |m|<=B_0<Z^2/16<pq/2,
   ```

   hence `H_(pq)=m`.

2. **Distinct-label target nonvanishing.** For distinct base-prime labels `m_i,m_j` and a target `q!=p_0`, hypothetical vanishing modulo `q` would give

   ```text
   p_0q|(m_i-m_j),
   0<|m_i-m_j|<=2B_0<Z^2/8<p_0q,
   ```

   a contradiction.

3. **Dominant-label uniqueness.** Two dominant classes overlap in at least `(1-2rho_0)M` coordinates and therefore share two distinct witness primes for large `Z`. Their product divides the label difference, whose absolute value is strictly smaller than the product; hence the labels coincide.

These facts reclose nondominant forcing, dominant-class energy, the quantitative label estimate, and zero-exception exact-cold rigidity.

## 3. Verified downstream cone

The repair has been checked through all load-bearing downstream uses:

- core-defect amplification uses the actual phase

  ```text
  H_(rs)/(rs)=j_r/s+m/(rs) modulo integers
  ```

  and retains the `ell^2` perturbation estimate;
- low retained energy becomes an exact integer diagonal only after the repaired label bound makes every retained centred lift equal to `m`;
- `U=emptyset`, cold `U!=emptyset`, and energetic top assignments remain separate;
- top error sums retain `Y_S`, `(1+delta)^N`, `2^N`, and the weighted cold-defect term;
- lower compression retains the exact factor partition and `P_top(exp(Delta)-1)`;
- fixed-`b` decoding through `X^2/4`, prime decoding through `M_dec=XZ/(log Z)^2`, and the coherent cold tail all lie inside the repaired range for large `X`;
- the adaptive complete-pair interval, actual-family major arc, Taylor remainder, Gaussian tail, Sector V, and five-sector exhaustion are unchanged;
- no-wrap remains a consequence only of `Lambda<1`.

## 4. Details that must survive Curator or manuscript transformation

Any downstream transformation that consumes this assured packet must preserve all of the following.

### 4.1 Arithmetic family and endpoint

```text
Z=X^3,
P={p prime:X<=p<Z},
B={q prime:Z/2<=q<Z},
S subset B,
E_pair={pq:p,q in P,p<q},
E_b^S={rs:r|b prime,s in S},
L=b product_(p in P)p.
```

Preserve disjointness, squarefree period, avoidance, complete-pair load, sparse auxiliary load, actual variance, total load below one, numerator induction, and the explicit `b=1,2` reductions.

### 4.2 Full-range population floor

Do not merge the two row ranges. Preserve:

- for `r<Z/2`, inverse-residue multiplicity, `M>=8mu_r`, and cyclic packing;
- for `Z/2<=r<Z`, exclusion of `s=r`, the short nonzero congruence variable, at most two interval representatives, and at least half the phases separated.

### 4.3 One common actual-prime core

Preserve one Bernoulli sample for all rows,

```text
rho=K(log Z)^4/Z,
|S|asymp_A(log Z)^3,
```

the simultaneous union bound over fewer than `Z^2` tests, and the lower size bound needed for fixed prime divisors of `b`.

### 4.4 Actual row tails and defect expansion

Preserve the exact Bernoulli kernel, the `D/4` nearest-decoder conversion, and the legal order:

```text
fix U
-> retain G-G factors and decoder stars on G
-> discard only factors incident to U as <=1
-> factor defective star rows
-> obtain delta^|U|.
```

No independence heuristic may replace this argument.

### 4.5 Robust exact-cold theorem

Preserve:

```text
class size >=16,
R_0=0 before sqrt(R_0),
base-prime label count,
small/substantial class split,
(S_0-n_i)-(t-1),
ordered-pair factor 1/2,
[Z/2,Z) endpoint losses,
B_0=A_0sqrt(R_0)Z^2/M,
B_0<Z^2/16,
all operative labels |m|<=B_0,
same-class H_(pq)=m,
cross-label nonvanishing,
dominant-label uniqueness,
quantitative label bound,
zero exceptions.
```

The three legality consequences must appear before class energy, dominant-label conclusion, and zero-exception uses. A bare constant replacement is insufficient.

### 4.6 Core-defect amplification

Preserve actual CRT star phases and the reverse-triangle `ell^2` comparison. The label perturbation may not be dropped pointwise or by an unstated smallness assertion.

### 4.7 Exact top classification and error sums

Distinguish exactly:

```text
U=emptyset and low retained energy:
  genuine global diagonal;

U!=emptyset and low retained energy:
  retained diagonal plus actual top defects;

high retained energy:
  energetic sector.
```

Use the Gaussian identity only after exact centred-lift identification. Preserve

```text
Y_S<=exp(O((log Z)^4)),
(log Z)^4=o(Z/(log Z)^3),
Y_Se^(-kappa F_sync)(1+delta)^N,
Y_S2^Ndelta^(N/2),
O(Zlog Z)((1+delta)^N-1).
```

### 4.8 Denominator partition and lower compression

Preserve all six complete-pair classes and the auxiliary class:

```text
S-S,
S-R,
R-R,
S-P_low,
R-P_low,
P_low-P_low,
S_b-S.
```

Preserve the retained skeleton `S-S`, `R-P_low`, `P_low-P_low` and the weighted error `P_top(exp(Delta)-1)`.

### 4.9 Sparse target-denominator observability

Preserve sparse reciprocal and square loads, fixed-row distance, decoder validity through `X^2/4`, and squarefree CRT identification modulo `b`. Do not introduce a hidden sibling reservoir or progression-equidistribution claim.

### 4.10 Decoder ranges and five sectors

Preserve the distinct ranges

```text
b coordinates:     |m|<=X^2/4,
prime coordinates: |m|<=M_dec=XZ/(log Z)^2,
robust cold labels: |m|<Z^2/16 at the terminal threshold.
```

`X^2/4` is not a remnant of the rejected `Z^2/4` label allowance. Preserve the adaptive interval inside `P\B`, distinct-prime exclusion, actual-family Taylor remainder, coherent top-label tail, and assignment of all top and lower defects to Sector V.

### 4.11 Parameter order and terminal closure

Preserve

```text
structural constants -> C -> X.
```

The final `X` must exceed the uniform `B_0<Z^2/16` threshold as well as the PNT, sampling, rigidity, decoder, Taylor, adaptive-interval, avoidance, and error thresholds. Preserve positive major mass, absolute suppression of Sectors II–V, `Lambda<1`, avoidance, and arithmetic equality after no-wrap.

### 4.12 Route-position boundary

The sparse route has a cleaner theorem hierarchy and genuinely removes load-bearing fingerprint entropy, but retains dense positive-density cold rigidity and adds sampling, defect expansion, amplification, and explicit top-defect bookkeeping. The assured classification remains:

```text
ALTERNATIVE / CLEANER HIERARCHY BUT COMPARABLE BURDEN.
```

Do not convert correctness assurance into an unsupported claim of shorter proof, canonical superiority, formal correspondence, novelty, priority, or publication readiness.

## 5. `Z^2/4` hygiene

Any downstream occurrence of `Z^2/4` is permitted only as:

- the lower bound for a product of two distinct witness primes;
- an explanation of the rejected former robust-label range;
- a logically independent decoder statement only if the variable is actually `X^2/4`, not `Z^2/4`.

No operative robust-cold, base-prime, or dominant label may be allowed merely by `|m|<Z^2/4`.

## 6. Assurance and mutation boundary

The verified candidate remains exactly

```text
3074ca46452a6f3528be588033fe414d5a0c0ef9.
```

This verification writes only the two required files under `review/**`. It does not mutate the candidate, proof-development, research, prior reviews, dense one-anchor, multiblock, AFT, mathematics, manuscript, Lean, workflow, release, tag, DOI, default branch, arXiv, journal, publication, or submission surfaces.

## 7. Gate return

```text
[PASS E306-SAS-REPAIR-VERIFY-01]
```