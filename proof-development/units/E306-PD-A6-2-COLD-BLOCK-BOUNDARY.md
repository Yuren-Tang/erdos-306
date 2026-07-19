# E306-PD-A6.2 — cold-block dominance and boundary penalty

**Ledger correspondence:** manuscript P17–P18  
**State:** `ARGUMENT`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**External analytic inputs:** none beyond the block-density interface  
**Predecessor:** `E306-PD-A6.1` (`COMPLETE-DRAFT`)

## 1. Exact scope

The manuscript currently gives only a mechanism account:

- low energy in one dyadic block forces one dominant integer label, with an energy-controlled exceptional set;
- distinct dominant labels on consecutive cold blocks force a definite bipartite energy penalty.

The released proof contains a substantially more precise chain. This unit reconstructs that chain in human form and must preserve two corrections already present formally:

1. the boundary theorem needs quantitative label-size hypotheses; the unqualified original statement is false;
2. cold blocks have bounded exceptional sets, so the construction consumes the exception-aware boundary theorem rather than only its no-exception special case.

## 2. Single-block notation

Let `P` be a set of `N` primes in `[X,2X]`, and let

```text
a = (a_p)_(p in P),   a_p in Z/pZ.
```

For `p<q`, let `H_pq` be the centered CRT representative determined by `(a_p,a_q)`, and put

```text
Q_P(a) = Σ_(p<q) (H_pq/(pq))^2.
```

For `0<rho<=1/4`, an integer `m` is dominant when

```text
|m| <= X^2/2
```

and the congruence `a_p ≡ m (mod p)` holds on at least `(1-rho)N` primes. The released global route uses `rho=1/4`.

A block is called hot when its energy exceeds a forcing floor

```text
R_w(c2,k) ≍ c2·2^k/log^3(2^k),
```

and cold otherwise.

## 3. Dominant-label uniqueness — complete sublemma

### Lemma 3.1

Assume `X>=1`, `N>=4`, and `rho<=1/4`. If two integers `m,n` both satisfy

```text
|m|,|n| <= X^2/2
```

and each agrees with `a_p` on at least `(1-rho)N` primes of `P`, then `m=n`.

### Proof

Let `C_m,C_n` be the two agreement classes. Inclusion–exclusion gives

```text
|C_m ∩ C_n|
 >= |C_m|+|C_n|-N
 >= (1-2rho)N
 >= N/2.
```

Since `N>=4`, the intersection contains two distinct primes `p,q`. On both primes,

```text
m ≡ n (mod p),   m ≡ n (mod q).
```

Thus `pq | (m-n)`. On the other hand,

```text
|m-n| <= |m|+|n| <= X^2.
```

Because `p,q` are distinct integers at least `X`, one has `pq>X^2`. Hence the only multiple of `pq` with absolute value at most `X^2` is zero, and therefore `m=n`. ∎

This is the human content of `SBEEForcing.dominant_label_unique` and the global wrapper `GlobalControl.coldLabel_eq`.

## 4. Cold implies dominant

The formal single-block forcing theorem has the following contrapositive content.

### Theorem 4.1 — nondominant forcing

There are absolute constants `c_B>0` and `X_B` such that, whenever `X>=X_B`, a block assignment with no dominant label satisfies

```text
Q_P(a) >= c_B X/log^3 X.
```

Equivalently, if `0<c2<=c_B` and

```text
Q_P(a) < R_w(c2,k),   X=2^k,
```

then the block has a unique dominant label.

The released proof decomposes this theorem into:

- a short-list construction from one base prime;
- a cross-label dispersion estimate;
- a power-mean lower bound for the off-diagonal class mass;
- the final parameter dichotomy.

The exact formal endpoint is `SBEEForcing.theorem_B_nondominant_forcing`; `GlobalControl.cold_isDominant` is its block-system contrapositive.

### Remaining human expansion

The current proof-development obligation is to rewrite the four bullets above as one continuous proof with explicit constants. This is the first unfinished part of this unit. It is not a new-mathematics gap: the chain is Lean-closed.

## 5. Exceptional-prime charging

Suppose a cold block has dominant label `m`, agreement class `C`, and exceptional set

```text
E = P \ C.
```

The single-block dominant theorem gives an explicit bound of the shape

```text
|E| <= 2^15 R X^2 / ((1-rho)N^3),
```

where `R` is an upper bound for `Q_P(a)`. Under the block density

```text
N >= X/(2 log X)
```

and `rho=1/4`, this becomes

```text
|E| <= (2^20/3) · R log^3 X / X.
```

For a cold block, `R<R_w(c2,k)`, so the right-hand side is bounded by an absolute multiple of `c2`. Choose `c2` no larger than both

1. the nondominant-forcing constant from Theorem 4.1, and
2. a sufficiently small constant determined by the desired integer exception budget `e0`.

Then every cold block is dominant and has `|E|<=e0`. This is the mathematical content routed through

- `SBEEForcing.exception_count_bound`;
- `SBEEForcing.cold_exception_bound`;
- `GlobalControlG5Assembly.cold_master`.

The exact rounding from the real upper bound to the integer statement `|E|<=e0` remains to be written out in the next revision of this unit.

## 6. Why the original boundary statement was false

Distinct labels alone do not force a uniform cross-block penalty. Labels can be so large that their difference has many divisors in the next prime block, defeating the dispersion step. The corrected released theorem adds quantitative size conditions, schematically

```text
32|m|  <= 2^k |P_k|,
32|m'| <= 2^(k+1) |P_(k+1)|.
```

These are stronger, construction-adapted label bounds derived from the cold-block counting regime. They must be stated in any human theorem used downstream.

## 7. Boundary penalty without exceptions

Let consecutive blocks have labels `m≠m'`, put `d=m'-m`, and assume the corrected label-size and density conditions.

At most one prime `q` in the upper block can divide `d`. Indeed, if two distinct upper-block primes divided `d`, their product would divide `d`; the label-size bounds make that product strictly larger than `|d|`.

For every remaining upper prime `q`, the cross-block phase bridge converts the bipartite CRT energy into a reciprocal-residue energy with difference `d`. The deterministic dispersion theorem then gives

```text
Σ_(p in P_k) (H_pq/(pq))^2
 >= |P_k|^3 / (2^13 (2^k)^2).
```

Summing over at least half of the upper-block primes yields the released no-exception estimate

```text
|P_(k+1)| |P_k|^3
-------------------
  2^16 (2^k)^2

 <= Σ_(p,q in adjacent control pairs) (H_pq/(pq))^2.
```

The exact formal chain is

- `GlobalControl.crossblock_dispersion`;
- `GlobalControl.crossblock_phase_bridge`;
- `GlobalControl.mismatch_per_q`;
- corrected `GlobalControl.mismatch_penalty`.

## 8. Boundary penalty with exceptions

Let `E_k⊆P_k` and `E_(k+1)⊆P_(k+1)` be the exceptional sets, and suppose the labels hold on their complements. The same argument is applied to the reduced lower block and to upper primes outside `E_(k+1)`.

Again, at most one surviving upper prime divides `d`. Hence

```text
(|P_(k+1)\E_(k+1)|-1) · |P_k\E_k|^3
------------------------------------------------
               2^13 (2^k)^2

 <= Σ_(p,q in adjacent control pairs) (H_pq/(pq))^2.
```

If both exception sets have size at most `e0`, this implies the global floor

```text
Pi_k = (|P_(k+1)|-e0-1)(|P_k|-e0)^3
       -----------------------------------.
                    2^13 (2^k)^2
```

This is exactly the form needed by the Peierls encoding. Its formal endpoint is `GlobalControl.mismatch_penalty_with_exceptions`; `GlobalControl.Pifloor` records the resulting floor.

## 9. Exact formal correspondence

| Human component | Released declaration / module | Status |
|---|---|---|
| dominance predicate | `SBEEForcing.IsDominant` | Lean-closed |
| dominant-label uniqueness | `SBEEForcing.dominant_label_unique` | Lean-closed; human proof complete above |
| cold label selector/specification | `GlobalControl.coldLabel`, `coldLabel_spec`, `coldLabel_eq` | Lean-closed |
| nondominant energy forcing | `SBEEForcing.theorem_B_nondominant_forcing` | Lean-closed; human expansion active |
| cold implies dominant | `GlobalControl.cold_isDominant` | Lean-closed |
| exception-count estimate | `SBEEForcing.exception_count_bound`, `cold_exception_bound` | Lean-closed; rounding/constants active |
| cross-block deterministic dispersion | `GlobalControl.crossblock_dispersion` | Lean-closed |
| corrected no-exception mismatch theorem | `GlobalControl.mismatch_penalty` | Lean-closed |
| exception-aware mismatch theorem | `GlobalControl.mismatch_penalty_with_exceptions` | Lean-closed |
| combined cold constants | `GlobalControlG5Assembly.cold_master` | Lean-closed |

## 10. Current proof obligations

1. Expand `theorem_B_nondominant_forcing` into a readable continuous proof rather than a list of formal sublemmas.
2. Reproduce the dominant-case exception bound with exact constants and integer rounding.
3. Derive the corrected label-size inequalities from the cold-block regime before invoking the boundary theorem.
4. State and prove the phase bridge in the same normalization as the human `Qctrl` definition.
5. Verify that the lower reduced block has at least `12` primes and all denominator signs/strict inequalities match the formal theorem.

All five are `ARGUMENT` or finite bookkeeping obligations. No implication has yet been identified that requires new mathematics from `E306-RL`.