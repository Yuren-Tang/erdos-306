# E306-PD-A6.1 — control geometry and reciprocal-load bounds

**Ledger correspondence:** manuscript P16; backlog `E306-PD-A6` foundational subunit  
**State:** `COMPLETE-DRAFT`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**External analytic inputs:** none  
**Downstream use:** global control, scale/window geometry, base-load budget, mass-batch construction, main/minor comparison

## 1. Statement

Let `BS` be a block system with indices `k0 <= k <= K`. Thus each finite prime set `P_k` lies in

```text
[2^k, 2^(k+1))
```

and satisfies the lower density condition

```text
|P_k| >= 2^k / (2 log(2^k)).
```

The control-pair family consists of

1. every unordered pair `{p,q}` with `p<q` inside one block `P_k`;
2. every ordered pair `(p,q)` in `P_k × P_(k+1)` for consecutive blocks.

For an assignment of residues to the block primes, the control energy is a sum over these pairs. Its scale parameter is

```text
sigmaCtrl(BS)^2 = Σ_(p,q in control pairs) 1/(pq)^2.
```

The reciprocal load of the corresponding control denominators is

```text
controlLoad(BS) = Σ_(e in control edges) 1/e.
```

We prove the following.

### Theorem A — control deviation from the bottom block

If `k0 >= 14`, then

```text
1 / (100 k0 2^k0) <= sigmaCtrl(BS).
```

### Theorem B — control reciprocal load

If `k0 >= 2`, then the stronger human bound

```text
controlLoad(BS) <= 32/(k0-1)
```

holds. In particular,

```text
controlLoad(BS) <= 512/(k0-1),
```

which is the released declaration's stated bound.

### Corollary C — construction-facing base budget

For every positive integer `b`, there is an explicit threshold `k_ctrl(b)` such that

```text
k0 >= k_ctrl(b)  =>  controlLoad(BS) < 3/(4b).
```

For example, `k_ctrl(b)=2048b+2` is more than sufficient.

## 2. An elementary primorial bound

We first isolate the only ingredient needed for an upper bound on the number of primes in one dyadic block.

### Lemma 2.1

Let

```text
P(n) = product of all primes p <= n.
```

Then `P(n) <= 4^n` for every natural number `n`.

### Proof

Use strong induction on `n`. The claim is immediate for `n=0,1`. Put `m=floor(n/2)`. Every prime `p` with `m<p<=n` divides the central binomial coefficient

```text
C(n,m)=n!/(m!(n-m)!).
```

Indeed, `p>m` and also `p>n-m`, while `p<=n`; hence the numerator contains one factor `p` and neither denominator factorial contains one. Distinct such primes are coprime, so their product divides `C(n,m)`. Therefore

```text
product_(m<p<=n) p <= C(n,m) <= Σ_j C(n,j)=2^n.
```

By induction, `P(m)<=4^m=2^(2m)<=2^n`. Multiplying the primes at most `m` and those above `m` gives

```text
P(n) <= 2^n 2^n = 4^n.
```

This proves the lemma. ∎

### Lemma 2.2 — dyadic cardinality upper bound

For `k>=1`, the number `M_k` of primes in `[2^k,2^(k+1))` satisfies

```text
k M_k <= 2^(k+2).
```

### Proof

Every such prime is at least `2^k`, whereas their product is at most the product of all primes at most `2^(k+1)`. Lemma 2.1 gives

```text
(2^k)^M_k
 <= P(2^(k+1))
 <= 4^(2^(k+1))
 = 2^(2^(k+2)).
```

Monotonicity of powers of `2` yields `k M_k <= 2^(k+2)`. ∎

### Lemma 2.3 — reciprocal mass of one dyadic block

For every subset `P_k` of the primes in `[2^k,2^(k+1))`,

```text
S_k := Σ_(p in P_k) 1/p <= 4/k.
```

### Proof

Each term is at most `2^(-k)`, and Lemma 2.2 gives

```text
S_k <= |P_k|/2^k <= M_k/2^k <= 4/k.
```

∎

The released Lean proof packages Lemmas 2.2–2.3 through Mathlib's proved `primorial_le_4_pow`; no Rosser–Schoenfeld or PNT input occurs here.

## 3. Proof of Theorem B

For one block, nonnegativity and expansion of the square give

```text
Σ_(p<q in P_k) 1/(pq)
 <= (Σ_(p in P_k) 1/p)^2
 = S_k^2
 <= 16/k^2.
```

For two consecutive blocks, exact factorization gives

```text
Σ_(p in P_k, q in P_(k+1)) 1/(pq)
 = S_k S_(k+1)
 <= 16/(k(k+1))
 <= 16/k^2.
```

Passing from control pairs to their product denominators cannot increase the sum: if two pairs happened to yield the same product, taking the image would only remove a repeated nonnegative term. Hence

```text
controlLoad(BS)
 <= 16 Σ_(k=k0)^K 1/k^2
    + 16 Σ_(k=k0)^(K-1) 1/k^2
 <= 32 Σ_(k=k0)^∞ 1/k^2.
```

For `k>=2`,

```text
1/k^2 <= 1/(k-1)-1/k,
```

so the tail telescopes:

```text
Σ_(k=k0)^∞ 1/k^2 <= 1/(k0-1).
```

Therefore

```text
controlLoad(BS) <= 32/(k0-1) <= 512/(k0-1).
```

This proves Theorem B. ∎

### Proof of Corollary C

Take `k_ctrl(b)=2048b+2`. If `k0>=k_ctrl(b)`, then

```text
controlLoad(BS)
 <= 512/(k0-1)
 <= 512/(2048b+1)
 < 1/(4b)
 < 3/(4b).
```

Thus the control part fits the required base-load budget. ∎

## 4. Proof of Theorem A

Let `k=k0`, let `m=|P_k|`, and put

```text
X = 2^k/(2k log 2).
```

The block-density hypothesis and `log(2^k)=k log 2` give `m>=X`.

Because `0<log 2<1` and `2^k>=4k` for `k>=4`, we have `X>=2`. Consequently

```text
m(m-1)/2 >= m^2/4 >= X^2/4.
```

The first inequality uses `m>=2`, hence `m-1>=m/2`.

Every bottom-block prime is less than `2^(k+1)`. Thus for every internal pair `p<q`,

```text
1/(pq)^2 > 1/2^(4k+4).
```

The complete control sum contains all bottom-block internal pairs, so

```text
sigmaCtrl(BS)^2
 >= [m(m-1)/2] / 2^(4k+4)
 >= X^2 / [4·2^(4k+4)]
 = 1 / [256 (log 2)^2 k^2 2^(2k)].
```

All quantities are nonnegative. Taking square roots gives

```text
sigmaCtrl(BS)
 >= 1/[16 (log 2) k 2^k]
 >= 1/[100 k 2^k],
```

because `16 log 2 < 16 < 100`. This proves Theorem A. ∎

The bound is deliberately coarse. Its role is not asymptotic optimization but ensuring that the main label window `N≈C/sigmaCtrl` remains much smaller than the bottom semiprime scale.

## 5. Exact formal correspondence

| Human step | Released declaration / module | Status |
|---|---|---|
| dyadic prime-cardinality upper bound | `GlobalControl.dyadic_block_card_upper`, `DyadicBlockUpper.lean` | Lean-closed |
| dyadic reciprocal sum `<=4/k` | `GlobalControl.dyadicBlock_recip_sum_le_four_div`, `DyadicBlockUpper.lean` | Lean-closed |
| one-block reciprocal bound for `BS.P k` | `CircleMethod.block_recip_sum_le_four_div`, `R2BaseLoadUpper.lean` | Lean-closed |
| internal-pair load bound | `CircleMethod.internalPairs_recip_sum_le_sq`, `R2BaseLoadUpper.lean` | Lean-closed |
| adjacent-block factorization | `CircleMethod.bipartitePairs_recip_sum_eq_mul`, `R2BaseLoadUpper.lean` | Lean-closed |
| inverse-square tail | `CircleMethod.inv_sq_sum_Icc_le`, `R2BaseLoadUpper.lean` | Lean-closed |
| released coarse control load `<=512/(k0-1)` | `CircleMethod.ctrl_recipLoad_le_tail`, `R2BaseLoadUpper.lean` | Lean-closed |
| eventual control-load socket | `CircleMethod.dyadic_control_recipLoad_eventually_small` and `exists_k0_controlLoad_lt`, `R2BaseLoadUpper.lean` | Lean-closed |
| bottom-block deviation lower bound | `CircleMethod.sigmaCtrl_ge_strong`, `R2TopAssembly.lean` | Lean-closed |
| construction instantiation at `3/(4b)` | use of `exists_k0_controlLoad_lt` in `exists_arcConstruction_final`, `R2TopAssembly.lean` | Lean-closed |

## 6. Formal/informal correction to the manuscript handoff

The manuscript currently says only that the deviation lower bound comes from “numerous bottom-block pairs” and the load upper bound from “quadratic growth of semiprime denominators.” The first phrase is directionally correct but suppresses the pair count and constant. The second is incomplete as a proof: large denominators alone do not control the number of control pairs. The actual released route also uses the elementary dyadic prime-cardinality upper bound of Lemma 2.2.

A consumer revision should therefore replace the handoff by the explicit chain above, or cite this unit as its proof source.

## 7. Dependency and status conclusion

This unit uses only:

- the block-system definitions and density hypothesis;
- elementary finite combinatorics;
- the elementary primorial inequality proved above;
- geometric/telescoping series estimates.

It uses neither released Rosser–Schoenfeld axiom directly nor the paper's PNT backend. There is no `BLOCKED-FRONTIER` obligation. The unit is `COMPLETE-DRAFT`; independent review may still test constants, endpoint conventions and exact declaration correspondence before consumer integration.