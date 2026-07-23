# Erdős 307: complement jet code and meet-in-the-middle architecture

**Programme:** `E306-RL-ADJ-22`  
**Status:** `GENERAL CRT-JET THEOREM / SEARCH ARCHITECTURE / BOUNDED DIAGNOSTIC`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

Natural-prefix port trees for the core-858 minimal-support problem were exhaustively searched
through ten terminal primes without producing even one integral closure.  Extending the same tree
further would be computation rather than mechanism.

This note extracts the exact reason a partial block strongly constrains its complement.  A
residual equation fixes both:

1. the product of the complement modulo the partial block;
2. the arithmetic derivative of the complement modulo the partial defect.

The pair is a two-coordinate arithmetic-jet syndrome.  It gives a natural meet-in-the-middle
architecture based on the product rule rather than ordered prime-tail enumeration.

## 2. General residual complement equation

Let `H` be squarefree and put

```text
a=H-D(H).                                          (2.1)
```

Let `T>0`.  A squarefree block `M`, coprime to `H`, completes `H` to defect `T` when

```text
HM-D(HM)=T.                                        (2.2)
```

By the product rule, `(2.2)` is equivalent to

```text
aM-HD(M)=T.                                        (2.3)
```

For squarefree `H`,

```text
gcd(H,D(H))=1,
```

and therefore

```text
gcd(H,a)=1.                                        (2.4)
```

## 3. Complement jet syndrome

### Theorem 3.1 — two-coordinate CRT code

Every complement `M` satisfying `(2.3)` obeys

```text
M congruent T a^(-1) mod H,                        (3.1)
```

and

```text
D(M) congruent -T H^(-1) mod a.                    (3.2)
```

Conversely, if an integer pair `(M,E)` satisfies

```text
M congruent T a^(-1) mod H,
E=(aM-T)/H,
```

then `(M,E)` lies on the unique affine integral jet line determined by `(H,T)`; it gives a genuine
complement precisely when

```text
E=D(M).                                             (3.3)
```

#### Proof

Reduce `(2.3)` modulo `H` and invert `a` using `(2.4)` to obtain `(3.1)`.  Reduce modulo `a` and
invert `H` to obtain `(3.2)`.  The converse statement is a rearrangement of `(2.3)`. `square`

### Interpretation

The residual equation does not merely prescribe a reciprocal sum.  It places the first arithmetic
jet

```text
J(M)=(M,D(M))
```

in one CRT lattice class:

```text
M mod H fixed,
D(M) mod a fixed,
D(M)=(aM-T)/H exactly.                              (3.4)
```

This is the **complement jet code**.

## 4. Primewise syndrome

For every prime `p|H`, equation `(3.1)` is

```text
M congruent -T{D(H)}^(-1) mod p.                   (4.1)
```

Equivalently, in the complete number `N=HM`,

```text
N/p congruent -T mod p.                            (4.2)
```

Thus the single product congruence modulo `H` packages all exact cofactor conditions at the
retained primes.  It is strictly stronger than a quadratic-residue envelope.

## 5. Split complement and product-rule matching

Write

```text
M=UV,
```

where `U,V` are squarefree, coprime to each other and to `H`.  Then

```text
D(M)=U D(V)+V D(U).                                (5.1)
```

The complement conditions become

```text
UV congruent m_0 mod H,                            (5.2)
```

```text
U D(V)+V D(U) congruent e_0 mod a,                 (5.3)
```

where

```text
m_0=T a^(-1) mod H,
e_0=-T H^(-1) mod a.                               (5.4)
```

If `U` is fixed and is a unit modulo `H`, equation `(5.2)` forces

```text
V congruent m_0 U^(-1) mod H.                      (5.5)
```

Equation `(5.3)` then supplies the derivative-coordinate match.

### Theorem 5.1 — exact meet-in-the-middle criterion

A pair of squarefree blocks `(U,V)` completes `H` to defect `T` if and only if:

1. `H,U,V` are pairwise coprime;
2. `(5.2)` holds;
3. the exact integer equality
   ```text
   aUV-H{U D(V)+V D(U)}=T                          (5.6)
   ```
   holds.

The modular conditions `(5.2)--(5.3)` are necessary hashes; `(5.6)` is the final exact check.

This separates candidate generation from verification without loss of completeness.

## 6. Hashable block signature

For every candidate block `U`, store

```text
U mod H,
U mod a,
D(U) mod a,
log U,
number of prime factors,
used-prime mask or disjointness signature.          (6.1)
```

A complementary block `V` must satisfy the product hash `(5.5)` and the bilinear derivative hash
`(5.3)`.  The real-size coordinate `log U` is used only to balance the split; it is not a substitute
for exact arithmetic.

The same architecture can be run in both directions:

```text
LEFT TABLE:
  blocks U and their first jets;

RIGHT TABLE:
  blocks V indexed by product residue mod H;

MATCH:
  product syndrome,
  derivative syndrome,
  exact residual equation,
  prime-output condition.                          (6.2)
```

## 7. Relationship with defect exchange

Suppose a known state `N_0=HR` has defect `c_0`, while `HM` is required to have defect `T`.  The
defect-exchange determinant gives

```text
c_0M-TR
 =H{R D(M)-M D(R)}.                                (7.1)
```

Modulo `H`, this is

```text
c_0M congruent TR mod H.                           (7.2)
```

Equation `(7.2)` is exactly the comparison between the two complement product syndromes.

Thus:

```text
COMPLEMENT JET CODE
  = absolute target syndrome relative to H;

DEFECT EXCHANGE
  = relative syndrome between two complements.     (7.3)
```

They are two forms of the same port rigidity.

## 8. Core-858 minimal-support instance

For the core-858 exact-zero problem, the standard near-fixed coordinate has target

```text
T=858^2=736164.
```

An E307 candidate has `57` prime factors in the standard coordinate:

```text
N=859Y,
omega(Y)=56.
```

A split may retain a large partial block `H` and divide the remaining prime budget between `U` and
`V`.  The target hashes are

```text
m_0=736164 a^(-1) mod H,
e_0=-736164 H^(-1) mod a.                          (8.1)
```

The final E307 output test is

```text
r={N-858*859}/{859^2} prime.                       (8.2)
```

## 9. Natural-prefix diagnostic and stopping rule

The natural smallest-prime prefixes for core `858` were searched with exact ordered-tail bounds.
The results were:

```text
tails   terminal states tested   integral closures
  3             2574                   0
  4            23605                   0
  5           120948                   0
  6           414174                   0
  7          1053970                   0
  8          2036237                   0
  9          3496486                   0
 10          5261337                   0.           (9.1)
```

Every search was finite and complete.  At a state with `k` ordered primes remaining, the first
prime `q` was bounded by

```text
c q^k<=kR q^(k-1)+T,                               (9.2)
```

which follows from the normalized residual equation.  The final prime was determined uniquely by
the terminal formula.

These zero results concern one natural-prefix family only.  They are not a no-go theorem.  Their
proper consequence is the stopping rule:

```text
DO NOT extend the ordered-tail tree further;
SWITCH to complement-jet meet-in-the-middle.        (9.3)
```

## 10. Construction frontier

The highest-value concrete task is now:

1. choose balanced partial blocks `H` on the 57-factor core-858 layer;
2. enumerate medium-sized blocks `U,V` rather than ordered full tails;
3. match the two CRT jet syndromes;
4. verify `(5.6)` exactly;
5. test the affine E307 output prime.

The positive-defect relay supplies a realistic prime reservoir and support profile, but the
low-swap rigidity theorem says that the exact complement must differ by a genuinely large block.

## 11. Classification

```text
COMPLEMENT PRODUCT SYNDROME — PROVED
COMPLEMENT DERIVATIVE SYNDROME — PROVED
AFFINE JET LINE — PROVED
SPLIT-BLOCK PRODUCT-RULE MATCH — PROVED
NATURAL PREFIX THROUGH TEN TAILS — NO INTEGRAL CLOSURE / COMPLETE CHECK
ORDERED-TAIL BRUTE FORCE — STOPPED BY DESIGN
BALANCED JET-CODE MEET-IN-THE-MIDDLE — OPEN IMPLEMENTATION FRONTIER
E307 EXACT ZERO DEFECT — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed.