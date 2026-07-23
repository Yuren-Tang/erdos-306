# Erdős 307: normalized jet group and target-graph Fourier transference

**Programme:** `E306-RL-ADJ-27`  
**Status:** `GENERAL ALGEBRAIC MECHANISM / FINITE-GROUP TRANSFERENCE / ANALYTIC FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The complement-jet code for a partial defect state requires control of both

```text
M modulo H,
D(M) modulo a,
```

where

```text
a=H-D(H)>0.
```

At first sight the derivative coordinate is nonlinear under multiplication.  The product rule shows
that it becomes additive after normalization by the product coordinate.  This places squarefree
prime blocks in a finite abelian jet group.

For prime derivative modulus, the required complement jets form an inverse graph whose Fourier
transform is a classical Gauss sum.  The target is therefore Fourier-flat.  The analytic difficulty
is transferred to spectral mixing of the prime-jet subset walk, whose individual phase is

```text
chi(p) e(k p^(-1)/ell).
```

This is the exact bridge from E307 block construction to multiplicative-inverse exponential-sum
providers.

## 2. Arithmetic jets and dual numbers

For a positive integer `n`, define its first arithmetic jet

```text
J(n)=(n,D(n)).                                       (2.1)
```

The product rule gives

```text
J(xy)=(xy,xD(y)+yD(x)).                              (2.2)
```

Equivalently, in the dual-number ring

```text
Z[epsilon]/(epsilon^2),
```

one has the multiplicative encoding

```text
n+epsilon D(n),                                      (2.3)
```

because

```text
{x+epsilon D(x)}{y+epsilon D(y)}
 =xy+epsilon D(xy).                                  (2.4)
```

Thus the arithmetic derivative is the tangent coordinate of a multiplicative monoid.

## 3. Normalized finite jet group

Let `m>=2`.  For every integer `n` coprime to `m`, define

```text
lambda_m(n)=D(n)n^(-1) mod m,                        (3.1)
```

and

```text
j_m(n)=(n mod m,lambda_m(n)).                        (3.2)
```

Let

```text
G_m=(Z/mZ)^x times (Z/mZ,+),                         (3.3)
```

with group law

```text
(u,s)(v,t)=(uv,s+t).                                 (3.4)
```

### Theorem 3.1 — normalized jet homomorphism

For integers `x,y` coprime to `m`,

```text
j_m(xy)=j_m(x)j_m(y).                                (3.5)
```

### Proof

Divide the product rule by `xy` modulo `m`:

```text
D(xy)(xy)^(-1)
 =D(x)x^(-1)+D(y)y^(-1) mod m.
```

The product coordinate is multiplicative. `square`

### Prime and squarefree blocks

For a prime `p` not dividing `m`,

```text
j_m(p)=(p,p^(-1)).                                   (3.6)
```

For a squarefree block

```text
M=product_(p in S)p,
```

one has

```text
j_m(M)
 =
 (product_(p in S)p,
  sum_(p in S)p^(-1)) mod m.                         (3.7)
```

Thus the two natural statistics of a prime block — product residue and reciprocal-sum residue — are
exactly the two coordinates of one finite-group walk.

## 4. Complement jet target

Fix a squarefree partial block `H` and put

```text
a=H-D(H)>0.                                         (4.1)
```

Let `T>0`, with

```text
gcd(H,a)=1,
gcd(T,Ha)=1.                                       (4.2)
```

A squarefree complement `M`, coprime to `Ha`, which satisfies

```text
aM-HD(M)=T                                          (4.3)
```

must obey

```text
M congruent m_0:=T a^(-1) mod H,                    (4.4)
```

and

```text
D(M) congruent e_0:=-T H^(-1) mod a.                (4.5)
```

Because `M` is a unit modulo `a`, equation `(4.5)` is equivalent to

```text
lambda_a(M)=e_0 M^(-1) mod a.                       (4.6)
```

Let

```text
L=Ha.
```

By the Chinese remainder theorem, write the normalized jet state as

```text
(u,s) in G:= (Z/LZ)^x times (Z/aZ,+),                (4.7)
```

where `u` is the product coordinate modulo `L` and `s=lambda_a(M)`.

### Definition 4.1 — complement target graph

Define

```text
T_(H,a,T)
 ={
    (u,s):
      u=m_0 mod H,
      s=e_0 u^(-1) mod a
   }.                                                (4.8)
```

The graph has exactly

```text
phi(a)
```

points: the residue `u mod H` is fixed, while `u mod a` ranges over the unit classes and `s` is then
forced.

Every exact complement lies on this graph.  Membership in the graph is not by itself sufficient for
the integer equality `(4.3)`; it is the complete finite-jet syndrome, followed by the exact affine
line check.

## 5. Fourier transform of the target graph for prime a

Assume now

```text
a=ell
```

is prime and does not divide `HT`.  Characters of `G` have the form

```text
(u,s) -> chi(u) e_ell(ks),                           (5.1)
```

where `chi` is a multiplicative character modulo `H ell` and `k mod ell`.

Write

```text
chi=chi_H chi_ell
```

under the CRT decomposition.  The unnormalized Fourier coefficient of the graph is

```text
F(chi,k)
 =conjugate(chi_H(m_0))
   sum_(v in F_ell^x)
     conjugate(chi_ell(v))
     e_ell(-k e_0 v^(-1)).                           (5.2)
```

Substitute `w=v^(-1)`.  Then

```text
F(chi,k)
 =conjugate(chi_H(m_0))
   sum_(w in F_ell^x)
     chi_ell(w)
     e_ell(-k e_0 w).                                (5.3)
```

This is a multiplicative Gauss sum.

### Theorem 5.1 — target-graph Fourier flatness

For the trivial character and `k=0`,

```text
F(1,0)=ell-1.                                        (5.4)
```

For every other frequency:

```text
|F(chi,k)|=
  0             if k=0 and chi_ell is nontrivial;
  1             if k!=0 and chi_ell is trivial;
  sqrt(ell)     if k!=0 and chi_ell is nontrivial.   (5.5)
```

In particular,

```text
|F(chi,k)|<=sqrt(ell)                                (5.6)
```

at every nontrivial frequency.

### Proof

Equation `(5.3)` is respectively the complete multiplicative-character sum, the nontrivial additive
sum over `F_ell^x`, or a classical nontrivial Gauss sum. `square`

The target is therefore not a spectrally concentrated thin set.  Its nontrivial Fourier complexity
has square-root size.

## 6. Bernoulli prime-jet walk

Let `P` be a finite set of primes, all coprime to `H ell T`.  Select each `p in P` independently with
probability `theta_p`, and let `M` be the resulting squarefree product.

The law `mu` of the normalized jet

```text
j(M)=(M mod H ell,lambda_ell(M))                     (6.1)
```

is a probability measure on `G`.

For a frequency `(chi,k)`, its Fourier transform is

```text
mu_hat(chi,k)
 =product_(p in P)
   {(1-theta_p)
     +theta_p chi(p)e_ell(kp^(-1))}.                 (6.2)
```

Thus every prime supplies one mixed multiplicative/inverse-additive multiplier.

## 7. Target-graph transference theorem

Let

```text
|G|=phi(H ell) ell=phi(H)(ell-1)ell.                 (7.1)
```

The uniform density of the target graph is

```text
|T_(H,ell,T)|/|G|
 ={ell-1}/{phi(H)(ell-1)ell}
 =1/{phi(H)ell}.                                     (7.2)
```

### Theorem 7.1 — finite-jet graph transference

With the notation above,

```text
|mu(T_(H,ell,T))-1/{phi(H)ell}|
 <=sqrt(ell)/|G|
   sum_((chi,k)!=(1,0)) |mu_hat(chi,k)|.             (7.3)
```

### Proof

Apply Fourier inversion to the indicator of the target graph.  The trivial term is `(7.2)`.  Bound
every nontrivial graph coefficient by Theorem 5.1 and take absolute values. `square`

### Positivity criterion

A sufficient condition for a complement jet to hit the target graph with positive probability is

```text
sum_((chi,k)!=(1,0)) |mu_hat(chi,k)|
 <{ell-1}/sqrt(ell).                                 (7.4)
```

This criterion concerns the finite-jet syndrome only.  Exact defect still requires the affine
integer equality, reciprocal-load control, squarefreeness/disjointness, and the final E307 output
prime.

## 8. Spectral energy of a prime step

For one prime `p`, the phase is

```text
chi(p)e_ell(kp^(-1)).                                (8.1)
```

For Bernoulli parameter `theta`,

```text
|(1-theta)+theta z|^2
 =1-4theta(1-theta) sin^2(arg(z)/2).                 (8.2)
```

Hence spectral damping is controlled by the mixed distance of

```text
chi(p)e_ell(kp^(-1))
```

from `1`.  For a prime interval `I`, the natural provider is a bound for

```text
sum_(p in I) chi(p)e_ell(kp^(-1)),                   (8.3)
```

or, more robustly, a level-set estimate for the corresponding phase distances.

This is a prime-twisted reciprocal exponential sum.  It lies at the interface of:

```text
Dirichlet characters,
Kloosterman-type inverse phases,
prime interval supply.
```

## 9. Relationship with E306 transference

The mechanism has the same abstract decomposition as the hot-cold E306 programme:

```text
HOT PRIME-JET SCAFFOLD:
  make the product/reciprocal finite jet mix;

COLD MASS RESERVOIR:
  place the reciprocal load near the required defect threshold;

TERMINAL PORT:
  close the exact affine residual and output prime.
```

The difference is structural:

```text
E306:
  the ambient CRT group is fixed after the denominator architecture is chosen;

E307:
  H, a=H-D(H), the target graph, and the terminal residual all move with the partial block.
```

This is the self-modular obstacle.

## 10. Balanced meet-in-the-middle

For a split complement `M=UV`, store normalized jet signatures

```text
j(U)=(U,lambda(U)),
j(V)=(V,lambda(V)).                                  (10.1)
```

The group law gives

```text
j(M)=j(U)j(V).                                       (10.2)
```

Thus the finite-jet matching problem is ordinary group collision:

```text
j(V) in j(U)^(-1) T_(H,a,T).                         (10.3)
```

When `a` is prime, every translated target graph has the same square-root Fourier profile.
This is the exact algebraic basis for a balanced hash table or a convolution argument.

The final exact check remains

```text
aUV-H{U D(V)+V D(U)}=T.                             (10.4)
```

The group collision is a strong necessary filter and a natural analytic approximation to the exact
line.

## 11. Research frontier

The next theorem/provider problem is now precise.

### Prime-jet spectral provider

For prime or controlled squarefree `a`, prove sufficiently strong bounds for

```text
sum_(p in I) chi(p)e_a(kp^(-1))                     (11.1)
```

uniformly over the nontrivial jet frequencies relevant to the selected partial block.

### Joint finite/Archimedean local limit

Refine Theorem 7.1 by adjoining an Archimedean coordinate for reciprocal mass or defect, so that the
walk hits both:

```text
the finite inverse graph,
the exact or terminally closable residual window.   (11.2)
```

### Moving-modulus core comparison

Apply the same spectral diagnostics to the minimal-support relays for cores `858` and `1722`.
The near-zero core-1722 relay gives the best current Archimedean starting point; core `858` has the
most developed ordered-tail and complement-code diagnostics.

## 12. Classification

```text
ARITHMETIC JETS AS DUAL-NUMBER MULTIPLICATIVE MONOID — PROVED
NORMALIZED JET HOMOMORPHISM — PROVED
COMPLEMENT TARGET AS INVERSE GRAPH — PROVED
PRIME-MODULUS TARGET FOURIER FLATNESS — PROVED
BERNOULLI PRIME-JET MULTIPLIER — PROVED
FINITE-JET GRAPH TRANSFERENCE — PROVED
PRIME-JET SPECTRAL PROVIDER — OPEN
JOINT FINITE/ARCHIMEDEAN LOCAL LIMIT — OPEN
E307 EXACT RESIDUAL-SQUARE FILLING — OPEN
```

The classical Gauss-sum evaluation is standard.  The normalized-jet packaging and its application to
E307 have not received an independent novelty audit.  No released E306 theorem, manuscript, Lean
authority, review status, DOI, arXiv, submission, or canonical status is changed.
