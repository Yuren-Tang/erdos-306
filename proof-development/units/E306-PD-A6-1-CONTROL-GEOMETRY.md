# E306-PD-A6.1 — control geometry and reciprocal-load bounds

**Ledger correspondence:** manuscript P16; backlog `E306-PD-A6` foundational subunit  
**State:** `COMPLETE-DRAFT`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**External analytic inputs:** none  
**Downstream use:** global control, scale/window geometry, base-load budget, mass-batch construction, main/minor comparison

## 1. Statement

Let `BS` be a block system with indices `k0 <= k <= K`. Each finite prime set `P_k` lies in

```text
[2^k, 2^(k+1))
```

and satisfies

```text
|P_k| >= 2^k / (2 log(2^k)).
```

The control-pair family consists of every unordered pair `p<q` inside one block and every pair in `P_k × P_(k+1)` for consecutive blocks. Write

```text
sigmaCtrl(BS)^2 = Σ_(p,q in control pairs) 1/(pq)^2
```

and let

```text
controlLoad(BS) = Σ_(e in control edges) 1/e.
```

We prove:

1. if `k0>=14`, then
   ```text
   1/(100 k0 2^k0) <= sigmaCtrl(BS);
   ```
2. if `k0>=2`, then the stronger human bound
   ```text
   controlLoad(BS) <= 32/(k0-1)
   ```
   holds, and hence so does the released bound `controlLoad(BS)<=512/(k0-1)`;
3. for every positive integer `b`, all sufficiently large `k0` satisfy
   ```text
   controlLoad(BS) < 3/(4b).
   ```

## 2. A dyadic primorial bound

Only primorials at powers of two are needed. Restricting the statement to that case avoids any odd-endpoint issue in a central-binomial argument.

### Lemma 2.1

Let

```text
P_r = product of all primes p <= 2^r.
```

Then

```text
P_r <= 4^(2^r)
```

for every `r>=0`.

### Proof

Induct on `r`. For `r=0`, the product over primes at most `1` is empty and equals `1`.

Suppose `r>=1`, put `n=2^r` and `m=n/2=2^(r-1)`. Every prime `p` with

```text
m < p <= n
```

divides the central binomial coefficient `C(n,m)`: the numerator `n!` contains exactly one multiple of `p`, while neither copy of `m!` contains `p`. Since these primes are distinct, their product divides `C(n,m)`. Hence

```text
product_(m<p<=n) p <= C(n,m) <= Σ_j C(n,j)=2^n.
```

By induction,

```text
P_(r-1) <= 4^m = 2^n.
```

Multiplying the primes at most `m` and those in `(m,n]` gives

```text
P_r <= 2^n·2^n = 4^n = 4^(2^r).
```

∎

### Lemma 2.2 — dyadic cardinality upper bound

For `k>=1`, let `M_k` be the number of primes in `[2^k,2^(k+1))`. Then

```text
k M_k <= 2^(k+2).
```

### Proof

Every prime in the interval is at least `2^k`, while their product is at most `P_(k+1)`. Lemma 2.1 gives

```text
(2^k)^M_k
 <= P_(k+1)
 <= 4^(2^(k+1))
 = 2^(2^(k+2)).
```

Since powers of `2` are strictly increasing, `k M_k<=2^(k+2)`. ∎

### Lemma 2.3 — reciprocal mass of one dyadic block

For every subset `P_k` of the primes in `[2^k,2^(k+1))`,

```text
S_k := Σ_(p in P_k) 1/p <= 4/k.
```

### Proof

Each term is at most `2^(-k)`. Thus, by Lemma 2.2,

```text
S_k <= |P_k|/2^k <= M_k/2^k <= 4/k.
```

∎

The released Lean proof packages this route through Mathlib's proved `primorial_le_4_pow`; no Rosser–Schoenfeld or PNT input occurs here.

## 3. Control reciprocal load

For one block, nonnegativity and expansion of a square give

```text
Σ_(p<q in P_k) 1/(pq)
 <= (Σ_(p in P_k) 1/p)^2
 = S_k^2
 <= 16/k^2.
```

For consecutive blocks,

```text
Σ_(p in P_k, q in P_(k+1)) 1/(pq)
 = S_k S_(k+1)
 <= 16/(k(k+1))
 <= 16/k^2.
```

Passing from pairs to their product denominators cannot increase a sum of nonnegative terms: any collision in the product map only removes repetition. Therefore

```text
controlLoad(BS)
 <= 16 Σ_(k=k0)^K 1/k^2
    + 16 Σ_(k=k0)^(K-1) 1/k^2
 <= 32 Σ_(k=k0)^∞ 1/k^2.
```

For `k>=2`,

```text
1/k^2 <= 1/(k-1)-1/k.
```

The tail telescopes, so

```text
Σ_(k=k0)^∞ 1/k^2 <= 1/(k0-1).
```

Hence

```text
controlLoad(BS) <= 32/(k0-1) <= 512/(k0-1).
```

For the construction-facing budget, take for example

```text
k_ctrl(b)=2048b+2.
```

Then `k0>=k_ctrl(b)` implies

```text
controlLoad(BS)
 <= 512/(k0-1)
 <= 512/(2048b+1)
 < 1/(4b)
 < 3/(4b).
```

This proves both the load theorem and its eventual form. ∎

## 4. Bottom-block lower bound for `sigmaCtrl`

Put `k=k0`, `m=|P_k|`, and

```text
X = 2^k/(2k log 2).
```

The block-density condition and `log(2^k)=k log 2` give `m>=X`.

Because `0<log 2<1` and `2^k>=4k` for `k>=4`, one has `X>=2`. Thus

```text
m(m-1)/2 >= m^2/4 >= X^2/4.
```

Every bottom-block prime is less than `2^(k+1)`. Consequently every internal pair contributes

```text
1/(pq)^2 > 1/2^(4k+4).
```

All bottom-block internal pairs occur in the full control sum. Therefore

```text
sigmaCtrl(BS)^2
 >= [m(m-1)/2]/2^(4k+4)
 >= X^2/[4·2^(4k+4)]
 = 1/[256 (log 2)^2 k^2 2^(2k)].
```

Taking nonnegative square roots gives

```text
sigmaCtrl(BS)
 >= 1/[16 (log 2) k 2^k]
 >= 1/[100 k 2^k],
```

because `16 log 2<16<100`. This proves the required lower bound. ∎

The constant is deliberately coarse. Its role is to keep the main-label window `N≈C/sigmaCtrl` much smaller than the bottom semiprime scale, not to optimize the asymptotic constant.

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
| eventual control-load socket | `CircleMethod.dyadic_control_recipLoad_eventually_small`, `CircleMethod.exists_k0_controlLoad_lt`, `R2BaseLoadUpper.lean` | Lean-closed |
| bottom-block deviation lower bound | `CircleMethod.sigmaCtrl_ge_strong`, `R2TopAssembly.lean` | Lean-closed |
| construction instantiation at `3/(4b)` | use of `exists_k0_controlLoad_lt` in `exists_arcConstruction_final`, `R2TopAssembly.lean` | Lean-closed |

## 6. Formal/informal correction to the manuscript handoff

The manuscript says only that the deviation lower bound comes from “numerous bottom-block pairs” and the load upper bound from “quadratic growth of semiprime denominators.” The first phrase suppresses the pair count and constant. The second is insufficient by itself: large denominators do not control how many control pairs occur. The released route also uses the elementary dyadic prime-cardinality upper bound above.

A consumer revision should replace that handoff with this explicit chain, or cite this unit as its proof source.

## 7. Dependency and status conclusion

This unit uses only the block-system definitions and density hypothesis, finite combinatorics, a dyadic primorial estimate, and a telescoping inverse-square tail. It uses neither released Rosser–Schoenfeld assumption directly nor the paper's PNT backend.

There is no `BLOCKED-FRONTIER` obligation. The unit is `COMPLETE-DRAFT`; independent review may still test constants, endpoints and declaration correspondence before consumer integration.