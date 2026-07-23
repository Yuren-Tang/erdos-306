# Erdős 307 as an arithmetic-derivative two-cycle

**Programme:** `E306-RL-ADJ-01`  
**Status:** `GENERAL EQUIVALENCE THEOREM / NEW ADJACENT-PROBLEM FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Problem and purpose

Erdős Problem 307 asks whether there exist finite sets of primes `P,Q` such that

```text
1=(sum_(p in P) 1/p)(sum_(q in Q) 1/q).
```

The problem is adjacent to E306 because the product expands as a sum of semiprime
reciprocals over the complete bipartite graph `P x Q`.  It is nevertheless much more
rigid than E306: the semiprime edge set is not arbitrary but must be a rank-one complete
cut.

This note gives an exact arithmetic-dynamical reformulation.

## 2. Arithmetic derivative

Let `D` be the arithmetic derivative:

```text
D(p)=1 for every prime p,
D(ab)=a D(b)+b D(a).
```

For

```text
n=product_p p^(v_p(n)),
```

one has

```text
D(n)=n sum_(p|n) v_p(n)/p.
```

In particular, if `n` is squarefree with prime set `P`, then

```text
D(n)=n sum_(p in P)1/p
    =sum_(p in P)n/p.
```

Also

```text
gcd(n,D(n))=1
```

for every squarefree `n>1`, because modulo each `p|n` the unique surviving term in
`D(n)=sum_(q|n)n/q` is `n/p`, which is nonzero modulo `p`.

## 3. Exact two-cycle theorem

Let

```text
x=product_(p in P)p,
y=product_(q in Q)q.
```

### Theorem 3.1

The following are equivalent.

1. `P,Q` solve Erdős 307.
2. `P,Q` are disjoint and
   ```text
   D(x)=y,
   D(y)=x.
   ```
3. `x,y` are coprime squarefree positive integers forming a nontrivial period-two orbit
   of the arithmetic derivative.

### Proof

Assume first that `P,Q` solve E307.  The reduced forms are

```text
sum_(p in P)1/p=D(x)/x,
sum_(q in Q)1/q=D(y)/y,
```

because `gcd(x,D(x))=gcd(y,D(y))=1`.  Hence

```text
D(x)D(y)=xy.                                      (3.1)
```

If a prime `r` belonged to both `P` and `Q`, then `r` would divide `xy` twice while it
divides neither `D(x)` nor `D(y)`, contradicting (3.1).  Thus `gcd(x,y)=1`.

Since `gcd(x,D(x))=1`, equation (3.1) implies `x|D(y)`.  Similarly `y|D(x)`.  Write

```text
D(y)=a x,
D(x)=b y
```

with positive integers `a,b`.  Substitution in (3.1) gives `ab=1`, hence `a=b=1`.
Therefore

```text
D(x)=y,
D(y)=x.
```

Conversely, if these two identities hold, then

```text
(sum_(p in P)1/p)(sum_(q in Q)1/q)
 =(D(x)/x)(D(y)/y)=1.
```

This proves the equivalence. `square`

## 4. Reciprocal-numerator map

For a finite prime set `P`, define

```text
N(P)=sum_(p in P) product_(r in P\{p}) r.
```

Then

```text
N(P)=D(product_(p in P)p).
```

E307 is therefore the existence of a two-cycle

```text
P -> prime-factor set of N(P) -> P
```

such that both numerators are squarefree and no prime is shared between the two sets.
Equivalently,

```text
N(P)=product_(q in Q)q,
N(Q)=product_(p in P)p.
```

This is a smooth-factorization/self-consistency problem, not merely an exact subset-sum
problem.

## 5. Immediate necessary conditions

Put

```text
A=sum_(p in P)1/p=y/x,
B=sum_(q in Q)1/q=x/y.
```

Then `AB=1`.  Since a squarefree integer cannot satisfy `D(n)=n`, one has `A!=1` and
`B!=1`.  After interchanging the two sets if necessary,

```text
A>1,
B<1,
x<y.
```

Thus one side of the derivative orbit expands and the other contracts.

### Parity

- If `2 in P`, then `D(x)` is odd, so `2 notin Q`; moreover `D(y)=x` forces `|Q|`
  even.
- If `2 in Q`, then `|P|` is even.
- If `2` lies in neither set, then both `|P|` and `|Q|` are odd.

### Mutual reciprocal congruences

For every `q in Q`,

```text
sum_(p in P) p^(-1) =0 mod q,
```

where inverses are taken modulo `q`.  Similarly, for every `p in P`,

```text
sum_(q in Q) q^(-1)=0 mod p.
```

These are exact mutual syndrome-annihilation conditions.

### Squarefree numerator requirement

Both `D(x)` and `D(y)` must be squarefree.  A generic arithmetic derivative of a
large squarefree integer need not be squarefree and typically has far fewer prime
factors than the input.  Any construction must force unusually smooth, squarefree
reciprocal numerators of comparable logarithmic size.

## 6. Computation boundary

A Wolfram-language enumeration over all squarefree `n<=200000` found no coprime
squarefree two-cycle `D(D(n))=n`.  This is only a sanity check: the known elementary
lower bound for E307 already forces at least sixty primes in `P union Q`, so a direct
integer search at this scale has no exclusion value.

The useful computational object is not raw `n` but the prime-set map `P -> factor(N(P))`.
Future computation should search by:

1. prescribed reciprocal sum on the expanding side;
2. squarefree/smoothness bias for `N(P)`;
3. mutual modular constraints;
4. meet-in-the-middle on logarithmic products;
5. exact verification of the return equation `N(Q)=product(P)`.

## 7. Relation to E313

For squarefree `m=product p_i`, Erdős Problem 313 asks for

```text
sum_i1/p_i=1-1/m.
```

Multiplying by `m` gives exactly

```text
D(m)=m-1.
```

Thus:

```text
E313 = arithmetic-derivative near-fixed points D(m)=m-1;
E307 = coprime squarefree two-cycles D(x)=y, D(y)=x.
```

Primary pseudoperfect numbers are therefore defect-one near-fixed points of the same
dynamics in which E307 seeks a genuine period-two orbit.

## 8. Relation to E306

For disjoint `P,Q`,

```text
(D(x)/x)(D(y)/y)
 =sum_(p in P,q in Q)1/(pq).
```

Hence E307 asks for an E306-type representation of `1` whose semiprime support is
exactly one complete bipartite graph.  The released E306 theorem permits an arbitrary
edge subset and therefore does not imply E307.

The shared structure is CRT incidence geometry.  The divergent structure is:

```text
E306: linear choice of semiprime edges;
E307: nonlinear self-consistent choice of two vertex sets.
```

Local-limit/anchor-fibre machinery may control a random edge set, but E307 additionally
requires rank-one factorization of that edge set and squarefree numerator closure.

## 9. Ranked frontiers

### Frontier A — arithmetic-derivative dynamics

Classify squarefree `n` for which `D(n)` is squarefree and compare

```text
omega(D(n)) versus omega(n),
log D(n) versus log n.
```

A two-cycle requires both statistics to return exactly after two steps.

### Frontier B — reciprocal-numerator smoothness

Construct prime sets `P` for which `N(P)` is squarefree and has a prescribed prime-factor
profile.  This resembles Euclid--Mullin and primary-pseudoperfect constructions but with a
sum of complementary products rather than `product+/-1`.

### Frontier C — mutual syndrome construction

Solve the pair of modular systems

```text
sum_(p in P)p^(-1)=0 mod every q in Q,
sum_(q in Q)q^(-1)=0 mod every p in P
```

while simultaneously controlling real reciprocal sums and products.

### Frontier D — impossibility mechanisms

Seek monotone quantities for squarefree arithmetic-derivative iteration.  Candidates include
prime-factor entropy, largest-prime ratios, smoothness defects, and logarithmic reciprocal
mass.  No such monotone invariant is currently established here.

## 10. Classification

```text
E307 <=> COPRIME SQUAREFREE ARITHMETIC-DERIVATIVE TWO-CYCLE — PROVED
MUTUAL RECIPROCAL-SYNDROME CONDITIONS — PROVED
E313 AS DEFECT-ONE NEAR-FIXED POINT — PROVED
SMALL COMPUTATIONAL SEARCH — NEGATIVE EVIDENCE ONLY
EXISTENCE OR NONEXISTENCE OF A TWO-CYCLE — OPEN FRONTIER
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this adjacent-problem theorem.