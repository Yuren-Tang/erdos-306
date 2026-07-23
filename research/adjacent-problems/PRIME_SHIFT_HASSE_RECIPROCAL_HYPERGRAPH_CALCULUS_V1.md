# Prime-shift Hasse calculus for reciprocal hypergraphs

**Programme:** `E306-RL-ADJ-02`  
**Status:** `GENERAL ALGEBRAIC MECHANISM / CORRECTED AFTER WOLFRAM COUNTERCHECK`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose and correction

Reciprocal sums over complete prime families admit a natural higher-differential
interpretation.  A tempting but false statement is

```text
D^k(n)/(k! n)=sum_(|S|=k)1/product_(p in S)p
```

for the iterated arithmetic derivative `D^k` of a squarefree integer `n`.

This is false because the arithmetic derivative is not additive.  Wolfram computation gives
for

```text
n=210=2*3*5*7:
D(n)=247,
D^2(n)=32,
```

whereas

```text
2! n sum_(p<q|n)1/(pq)=202.
```

The correct structure is a Hasse--Schmidt-type prime-shift generating series, not iteration
of the ordinary arithmetic derivative.

## 2. Prime-shift transform

For a positive integer

```text
n=product_p p^(a_p),
```

define

```text
T_t(n)=product_p (p+t)^(a_p).
```

This is a polynomial in `t` with integer coefficients.  Define its coefficients

```text
partial^[k](n)=[t^k]T_t(n).
```

Thus

```text
T_t(n)=sum_(k>=0) partial^[k](n)t^k.
```

### Proposition 2.1 — Hasse product rule

For all positive integers `m,n`,

```text
T_t(mn)=T_t(m)T_t(n),
```

and hence

```text
partial^[k](mn)=sum_(i+j=k) partial^[i](m) partial^[j](n).
```

This is the Hasse--Schmidt product rule.

### Proposition 2.2 — first coefficient

```text
partial^[0](n)=n,
partial^[1](n)=D(n),
```

where `D` is the ordinary arithmetic derivative.

Indeed, the coefficient of `t` in `product_p(p+t)^(a_p)` is

```text
n sum_p a_p/p.
```

Thus the ordinary arithmetic derivative is the first jet of the prime-shift transform.
The higher coefficients are canonical divided-power extensions, but they are not iterated
arithmetic derivatives.

## 3. Squarefree reciprocal-family formula

Suppose

```text
n=product_(p in V)p
```

is squarefree.  Then

```text
T_t(n)=n product_(p in V)(1+t/p).
```

Therefore

### Theorem 3.1

For `0<=k<=|V|`,

```text
partial^[k](n)
 =sum_(S subset V, |S|=k) n/product_(p in S)p,
```

and

```text
partial^[k](n)/n
 =e_k((1/p)_(p in V)).
```

Equivalently,

```text
(d^k/dt^k)T_t(n)|_(t=0)
 =k! partial^[k](n).
```

Thus complete reciprocal `k`-uniform prime families are precisely the normalized
`k`-th prime-shift Hasse coefficients.

## 4. Complete pairs and complete higher families

For squarefree `n`,

```text
partial^[2](n)/n=sum_(p<q|n)1/(pq).
```

This is the complete semiprime reciprocal load.  More generally,

```text
partial^[k](n)/n
 =sum_(p_1<...<p_k|n)1/(p_1...p_k).
```

The complete-family mass theorem previously proved in the anchor--fibre transference unit,

```text
0<=U^k/k!-e_k<=U^(k-2)V/(2(k-2)!),
U=sum_p1/p,
V=sum_p1/p^2,
```

is therefore an asymptotic statement about the normalized Hasse coefficients of
`T_t(n)`.

This is a genuine algebraic explanation for why complete pair and higher-uniformity masses
look Poissonian when collisions are small.

## 5. Graph-restricted second coefficient

Let `G=(V,E)` be a graph on the prime divisors of squarefree `n`.  Define

```text
partial_G^[2](n)
 =sum_({p,q} in E) n/(pq).
```

Then

```text
partial_G^[2](n)/n
 =sum_({p,q} in E)1/(pq).
```

This is not a coefficient of the one-variable complete prime shift unless `G` is complete.
It is a restricted Hessian or graph-supported second Hasse coefficient.

### E306 interpretation

Any finite set of distinct semiprime denominators `pq` determines a simple graph `G` on
the primes appearing in those denominators.  If `n` is the product of all vertices, then

```text
sum_({p,q} in E(G))1/(pq)=partial_G^[2](n)/n.
```

Hence the E306 representation problem can be written as:

```text
Find a squarefree prime product n and a simple graph G on its prime factors such that
partial_G^[2](n)/n=a/b.
```

The CRT/Fourier proof is therefore a theorem about selecting a graph-supported second
prime-shift coefficient with prescribed normalized value.

## 6. Bipartite mixed coefficient and E307

Let `x,y` be coprime squarefree integers with prime sets `P,Q`.  Introduce two independent
shift variables:

```text
T_(s,t)(x,y)=T_s(x)T_t(y).
```

The mixed coefficient is

```text
[s t]T_s(x)T_t(y)=D(x)D(y).
```

After normalization,

```text
D(x)D(y)/(xy)
 =(sum_(p in P)1/p)(sum_(q in Q)1/q)
 =sum_(p in P,q in Q)1/(pq).
```

Thus E307 is the equation that the normalized complete-bipartite mixed Hasse coefficient
is exactly `1`.  The two-cycle theorem sharpens this to

```text
D(x)=y,
D(y)=x.
```

E307 is therefore simultaneously:

1. a complete-bipartite restricted second coefficient problem;
2. a rank-one reciprocal graph problem;
3. a period-two arithmetic-derivative problem.

## 7. Hypergraph-restricted coefficients

For a `k`-uniform hypergraph `H` on `V`, define

```text
partial_H^[k](n)
 =sum_(S in E(H)) n/product_(p in S)p.
```

Then

```text
partial_H^[k](n)/n
 =sum_(S in E(H))1/product_(p in S)p.
```

The complete hypergraph recovers `partial^[k](n)`.  Arbitrary denominator restrictions
become support restrictions on a Hasse coefficient.

This gives a clean hierarchy:

```text
complete family       -> canonical Hasse coefficient;
graph/hypergraph      -> support-restricted coefficient;
complete multipartite -> mixed coefficient of several prime products;
random subset         -> Bernoulli random restricted coefficient.
```

## 8. Local-limit interpretation

For a fixed graph `G`, selecting edges independently turns

```text
partial_G^[2](n)/n
```

into a Bernoulli random graph-supported Hasse coefficient.  The E306 Fourier argument is a
local limit theorem for this random restricted coefficient.

The hot--cold decomposition then has an algebraic meaning:

```text
hot sparse subgraph  = smoothing/observability jet;
cold dense subgraph  = mass and variance jet.
```

The arithmetic heat energy measures how noncoherent CRT characters see the selected
restricted coefficient.

## 9. Why the ordinary derivative still matters

The Hasse transform organizes complete and restricted reciprocal families, but ordinary
arithmetic-derivative dynamics remains special.

- `partial^[1]=D` exactly.
- E313 is `D(n)=n-1` for squarefree `n`.
- E307 is a two-cycle `D(x)=y,D(y)=x`.
- Iterates `D^k` do not enumerate complete reciprocal `k`-sets and should never be used as
  substitutes for Hasse coefficients.

The ordinary derivative controls dynamics; the Hasse coefficients control reciprocal
hypergraph geometry.

## 10. Research opportunities

### A. Arithmetic jet algebra

Develop the semiring/ring in which `n -> T_t(n)` is a genuine Hasse--Schmidt morphism.
The usual arithmetic derivative is not additive on integers, so the natural domain is the
free commutative monoid of prime symbols or its monoid algebra before numerical evaluation.

### B. Restricted-Hessian inverse problems

Classify which rational values occur as

```text
partial_G^[2](n)/n
```

under graph constraints: arbitrary, bipartite, regular, expander, bounded degree, or
complete multipartite.

### C. Higher-uniformity analogues

Study representations by products of `k` distinct primes as random restricted Hasse
coefficients.  The mass provider is automatic; the difficult issue is hypergraph CRT
observability and joint local mixing.

### D. Dynamics versus jets

Relate arithmetic-derivative periodic or near-periodic points to factorization properties of
the higher Hasse coefficients.  E307 and E313 are the first natural test cases.

## 11. Literature boundary

The ordinary arithmetic derivative and higher iterates are classical objects.  General
Hasse--Schmidt derivations are standard algebra.  A web search did not locate the exact
prime-shift reciprocal-hypergraph framing used here, but no novelty claim is made without a
dedicated literature audit.

## 12. Classification

```text
ITERATED-DERIVATIVE IDENTIFICATION — FALSE; WOLFRAM COUNTEREXAMPLE RECORDED
PRIME-SHIFT HASSE PRODUCT RULE — PROVED
SQUAREFREE COMPLETE-FAMILY FORMULA — PROVED
E306 AS GRAPH-RESTRICTED SECOND HASSE COEFFICIENT — PROVED
E307 AS BIPARTITE MIXED COEFFICIENT PLUS D-TWO-CYCLE — PROVED
HIGHER HYPERGRAPH CALCULUS — DEFINED / ALGEBRAICALLY CLOSED
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this algebraic mechanism note.