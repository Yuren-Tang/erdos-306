# Complete-family mass and higher uniformity

**Workstream:** `E306-AFT-01`  
**Status:** `GENERAL ELEMENTARY-SYMMETRIC THEOREM / PROVED`  
**Purpose:** separate reciprocal-mass capacity from all rigidity and Fourier
transference providers

## 1. The mass question

Let `u_1,...,u_n` be nonnegative atom weights.  The total weight of all
`k`-element subsets is the elementary symmetric polynomial

```text
e_k(u_1,...,u_n)
 =sum_(1<=i_1<...<i_k<=n)u_(i_1)...u_(i_k).
```

The heuristic

```text
e_k approximately (sum_i u_i)^k/k!
```

is valid when collisions are negligible.  This note records a precise uniform
error requiring only the first two power sums.

## 2. Collision inequality

Put

```text
U=sum_i u_i,
V=sum_i u_i^2.
```

### Theorem 2.1 — complete-family collision bound

For every integer `k>=2`,

```text
0<=U^k/k!-e_k(u_1,...,u_n)
 <= U^(k-2)V / (2 (k-2)!).
```

Equivalently, if `U>0`,

```text
1-C(k,2)V/U^2
 <= k! e_k/U^k
 <=1.
```

The lower bound is useful when its left side is positive; the additive bound is
valid without that restriction.

#### Proof

Choose independent indices `I_1,...,I_k` with

```text
Pr(I_j=i)=u_i/U.
```

Then

```text
Pr(I_1,...,I_k are all distinct)=k!e_k/U^k.
```

For each pair `a<b`,

```text
Pr(I_a=I_b)=sum_i(u_i/U)^2=V/U^2.
```

The union bound gives

```text
Pr(some collision)<=C(k,2)V/U^2.
```

This proves the multiplicative inequality.  Multiplying by `U^k/k!` and using

```text
C(k,2)/k!=1/(2(k-2)!)
```

proves the additive form.  The upper bound follows because ordered distinct
`k`-tuples are a subset of all ordered tuples.  `square`

### Corollary 2.2 — fixed-uniformity asymptotic

For fixed `k`, if

```text
V/U^2->0,
```

then

```text
e_k=(U^k/k!)(1+O_k(V/U^2)).
```

The statement is uniform over every family with the displayed ratio tending to
zero.

## 3. Exact pair identity

For `k=2`, the formula is exact:

```text
e_2=(U^2-V)/2.
```

Thus the complete pair-family mass is determined by total atom load and the
collision square load.  No greedy selection, forbidden-pool cancellation, or
probabilistic approximation is required.

## 4. Prime reciprocal corollary

Fix `tau>1` and let

```text
P_X={p prime:X<=p<X^tau},
u_p=1/p.
```

The prime number theorem and reciprocal-prime Mertens law give

```text
U_X=sum_(p in P_X)1/p=log tau+o(1).
```

A dyadic estimate gives

```text
V_X=sum_(p in P_X)1/p^2=O(1/(X log X))=o(1).
```

Therefore, for every fixed `k`,

```text
sum_(p_1<...<p_k in P_X)1/(p_1...p_k)
 ->(log tau)^k/k!.
```

In particular,

```text
sum_(p<q in P_X)1/(pq)
 =((sum_p1/p)^2-sum_p1/p^2)/2
 ->(log tau)^2/2.
```

This is the clean complete-pair mass provider used in the E306 application.

## 5. Stability under sparse deletions

Let `D_X subset P_X` be deleted atoms and put

```text
eta_X=sum_(p in D_X)1/p.
```

If `eta_X=o(1)`, then the retained first power sum is

```text
U_X'=U_X-o(1),
```

and its second power sum is at most `V_X`.  Hence, for every fixed `k`, the
retained complete-family mass has the same limit.

More quantitatively, elementary symmetric polynomials are Lipschitz in the
nonnegative `l^1` norm at fixed `k`:

```text
0<=e_k(u)-e_k(u with D deleted)
 <=eta U^(k-1)/(k-1)!.
```

#### Proof

Every removed `k`-subset contains at least one deleted atom.  Mark one deleted
atom and sum the remaining `k-1` positions without imposing distinctness.  This
overcounts and gives the displayed bound.  `square`

This justifies deleting sparse sensor or forbidden families at the mass level
when their reciprocal load is `o(1)`.

## 6. Unequal Bernoulli parameters

The mass theorem concerns atom capacities.  If atoms are selected independently
with parameters `theta_i`, the expected reciprocal load is

```text
sum_i theta_i u_i.
```

A complete `k`-uniform family with edge parameter depending multiplicatively on
vertices has weighted mass governed by the same theorem after replacing
`u_i` by the effective vertex weights.  For arbitrary edge-dependent
parameters there is no vertex elementary-symmetric reduction; the edge weights
must be summed directly.

The anchor–fibre transference theorem itself allows unequal Bernoulli
parameters.  Only the mass provider changes.

## 7. Higher-uniformity conclusion and boundary

Theorem 2.1 honestly extends reciprocal capacity from pairs to every fixed
uniformity `k`:

```text
complete k-family mass
 =(vertex reciprocal load)^k/k!
  +controlled collision error.
```

It does **not** extend any E306 rigidity theorem to `k`-uniform hypergraphs.
Mass and rigidity are separate providers.

For hypergraph denominators one would still need new results for:

- a coordinate system adapted to hyperedges;
- shift-uniform decoding with several free endpoints;
- a retained-skeleton inequality after hypergraph fibre assignment;
- coherent-label rigidity and target observability;
- major/minor Fourier damping.

No such implication follows from elementary-symmetric mass alone.

## 8. A useful threshold criterion

Suppose a target construction needs complete `k`-family reciprocal capacity
strictly larger than a fixed number `c>0`.  If

```text
U_X->U_infinity>0,
V_X->0,
```

then the capacity condition eventually holds whenever

```text
U_infinity^k/k!>c.
```

The strict inequality leaves a fixed margin absorbing collision error and any
`o(1)` sparse deletions.

For pairs this becomes

```text
U_infinity^2/2>c.
```

This is the natural load-selection rule; it is independent of the later
Fourier transference.

## 9. Classification

```text
FIXED-k COMPLETE-FAMILY MASS THEOREM — PROVED
PAIR IDENTITY — EXACT
SPARSE-DELETION STABILITY — PROVED
PRIME POWER-INTERVAL COROLLARY — PROVED FROM PNT/MERTENS
HYPERGRAPH RIGIDITY EXTENSION — NOT CLAIMED.
```
