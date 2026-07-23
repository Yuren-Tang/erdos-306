# Erdős 307: general residual port transfer and automatic bilateral output

**Programme:** `E306-RL-ADJ-11`  
**Status:** `MECHANISM TRANSFER / STRENGTHENED EQUIVALENCE / GENERAL DISCRIMINANT THEOREM`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose and source boundary

Han Wang's 2026 preprint *Port Fillings for Primary Pseudoperfect Numbers*,
arXiv:`2605.21518`, defines a port filling by

```text
cB-RD(B)=1,
```

proves the product-rule composition law, a last-two-prime discriminant criterion, a finite
bound for its parameter, and a conditional five-prime splitting mechanism.

The seeded E307 reduction produces the same operator with a different positive residual:

```text
cB-RD(B)=C,
C=x^2p^2.
```

This note separates what transfers formally for every positive residual `C` from what remains
specific to primary pseudoperfect numbers or to the bilateral E307 output.

No claim is made that the residual-`C` statements below occur in the cited preprint; they are
direct generalizations proved here.

## 2. General residual port

Define

```text
Psi_(c,R)(B)=cB-RD(B).                          (2.1)
```

A squarefree integer `B` is a residual-`C` filling of `(R,c)` when

```text
Psi_(c,R)(B)=C.                                 (2.2)
```

The product rule gives, independently of `C`,

```text
Psi_(c,R)(AB)
 =Psi_(Psi_(c,R)(A),RA)(B).                    (2.3)
```

Thus all state transitions and compositions from the residual-one formalism remain valid.
Only the terminal target changes from `1` to `C`.

## 3. Automatic E307 output integrality

Use the seeded E307 notation

```text
M=D(xp),
c=xpy-MD(y)>0,
R=yM,
C=x^2p^2,                                      (3.1)
```

where `x,y,xp` are squarefree in the established disjoint-prefix setting.  In particular,

```text
gcd(xp,M)=1.                                   (3.2)
```

### Theorem 3.1 — the scalar equation automatically produces a positive integer left output

Suppose a positive integer `B` satisfies

```text
cB-RD(B)=C.                                    (3.3)
```

Then

```text
r=(yB-xp)/M                                    (3.4)
```

is automatically a positive integer.

#### Proof: integrality

Reduce `(3.3)` modulo `M`.  Since

```text
c congruent xpy mod M,
R=yM congruent 0 mod M,
C=x^2p^2,
```

we obtain

```text
xp(yB-xp) congruent 0 mod M.
```

By `(3.2)`, `xp` is invertible modulo `M`, so

```text
M divides yB-xp.
```

#### Proof: positivity

Because `y>1`, one has `D(y)>0`, hence

```text
c=xpy-MD(y)<xpy.
```

From `(3.3)`,

```text
cB=C+R D(B)>=C=x^2p^2.
```

For every nontrivial squarefree filler `B`, the right side is in fact strict once `D(B)>0`.
Therefore

```text
xpyB>cB>=x^2p^2,
```

and hence `yB>xp`.  Thus `r>0`. `square`

### Corollary 3.2 — sharpened seeded completion criterion

A squarefree block `B`, coprime to the existing factors, completes the seeded scalar part of
E307 if and only if

```text
cB-RD(B)=C.                                    (3.5)
```

The associated positive integer `r` is forced by `(3.4)`.  The only remaining bilateral output
condition is:

```text
r is a new prime.                               (3.6)
```

Integrality and positivity are not separate arithmetic obligations.

## 4. One-prime terminal formula for general residual

At state `(R,c)`, a one-prime residual-`C` filling satisfies

```text
cq-R=C.
```

Hence the unique candidate is

```text
q=(R+C)/c.                                     (4.1)
```

This is the residual-`C` replacement of the residual-one formula `(R+1)/c`.

## 5. Two-prime factorization theorem

Let the final two primes be `u<v`.  Then

```text
cuv-R(u+v)=C.                                  (5.1)
```

### Theorem 5.1 — general factor port

Equation `(5.1)` is equivalent to

```text
(cu-R)(cv-R)=R^2+cC.                           (5.2)
```

#### Proof

Expand the left side and use `(5.1)`. `square`

Thus every two-prime residual-`C` filling is indexed by a factor pair of the fixed integer

```text
K_(R,c,C)=R^2+cC.                              (5.3)
```

If `d|K_(R,c,C)` and `d'=K/d`, then

```text
u=(d+R)/c,
v=(d'+R)/c.                                   (5.4)
```

The factor pair gives a filling precisely when the displayed values are distinct primes and
integral.

For the seeded E307 port,

```text
R=yD(xp),
c=L_p,
C=x^2p^2,
```

and `(5.3)` is exactly the previously defined cubic integer `K_p`.

## 6. General last-two-prime discriminant

Assume

```text
gcd(c,R)=1.                                    (6.1)
```

Let `P=uv` and `S=u+v`.  Equation `(5.1)` gives

```text
cP-RS=C.                                       (6.2)
```

Let `P_0` be the unique residue representative with

```text
cP_0 congruent C mod R,
0<=P_0<R,                                      (6.3)
```

and put

```text
S_0=(cP_0-C)/R.                                (6.4)
```

Then all integer possibilities are

```text
P=P_0+tR,
S=S_0+ct,
t>=0.                                          (6.5)
```

Define

```text
Disc_C(t)=(S_0+ct)^2-4(P_0+tR).                (6.6)
```

### Theorem 6.1 — residual-`C` last-two-prime criterion

The port has a filling by primes `u<v` if and only if there exists an integer `t>=0` such that:

1. `Disc_C(t)` is a nonnegative perfect square;
2. `S_0+ct` and `sqrt(Disc_C(t))` have the same parity;
3. the roots
   ```text
   u=(S_0+ct-sqrt(Disc_C(t)))/2,
   v=(S_0+ct+sqrt(Disc_C(t)))/2
   ```
   are distinct primes satisfying any imposed lower-bound/disjointness conditions.

The proof is identical algebraically to the residual-one criterion after replacing `1` by `C`.

## 7. Finite parameter bound

Suppose the smaller final prime must satisfy

```text
u>=U,
U>R/c.                                         (7.1)
```

Since `U<=u<v`,

```text
(U-u)(U-v)=U^2-SU+P>=0.
```

Using `(6.5)`,

```text
U^2-S_0U+P_0+t(R-cU)>=0.
```

Because `cU-R>0`, every candidate satisfies

```text
0<=t<=floor((U^2-S_0U+P_0)/(cU-R)).            (7.2)
```

If the numerator is negative, no final two-prime filling exists.

For an ordered prime search after current largest prime `m`, one may take

```text
U=max(m+1,floor(R/c)+1).                       (7.3)
```

Thus the residual-`C` final-two-prime problem is finite just as in the residual-one theory.

## 8. Equivalence of factor and discriminant coordinates

The factor coordinate and discriminant coordinate are the same search in different variables.
For a solution,

```text
d=cu-R,
d'=cv-R,
dd'=R^2+cC.                                (8.1)
```

Meanwhile

```text
P=uv=P_0+tR,
S=u+v=S_0+ct.                                  (8.2)
```

The factor route is preferable when `R^2+cC` can be factored.  The discriminant route is
preferable when modular square sieves and a finite interval in `t` are cheaper than factoring
the full integer.

For E307, this explains the relationship between:

```text
seeded cubic divisor enumeration,
pulled-back discriminant-square curves,
E313-style last-two-prime square sieves.
```

## 9. General residual splitting hypersurface

A `k`-prime block `z_1...z_k` fills `(R,c)` to residual `C` precisely when

```text
c product_i z_i
 -R sum_i product_(j!=i)z_j
 =C.                                            (9.1)
```

This is the residual-`C` analogue of the residual-one splitting hypersurface.

For E313, a prime point on the residual-one hypersurface directly gives another primary
pseudoperfect filling.  For seeded E307, a prime point on `(9.1)` gives a positive integral
bilateral output automatically, but one additional condition remains:

```text
r=(y product_i z_i-xp)/D(xp) is prime.          (9.2)
```

Hence a conditional E307 construction requires a prime-points theorem for the `k` block
coordinates together with the affine/product output `(9.2)`.  It is strictly stronger than the
E313 splitting hypothesis.

## 10. Transfer audit

The mechanism transfer is:

```text
TRANSFERS VERBATIM FOR EVERY C>0:
  product-rule composition;
  prime state transition;
  slope subtraction;
  port-primitive/inherited decomposition relative to a target residual;
  last-two-prime discriminant;
  finite t bound;
  modular square sieves;
  k-prime residual hypersurface.

REQUIRES C=1 OR AN AMBIENT PRIMARY-PSEUDOPERFECT INTERPRETATION:
  direct conclusion that RB is primary pseudoperfect;
  ordinary E313 inheritance from a closed primary pseudoperfect number.

E307-SPECIFIC ADDITION:
  automatic positive integral output r;
  final primality of r;
  bilateral disjointness;
  anti-inheritance after the full two-cycle closes.
```

## 11. Research consequence

The immediate E307 construction programme should now use the mature residual-port toolkit in
two complementary modes:

1. **short terminal blocks:** factor `R^2+cC` or use the finite discriminant/square-sieve
   criterion;
2. **long blocks:** use composition trees, terminal-prime tests, and residual-`C` splitting
   hypersurfaces.

The genuinely new difficulty is no longer port algebra.  It is simultaneous control of:

```text
one residual-C filling B,
and the prime value of (yB-xp)/D(xp).
```

## 12. Classification

```text
AUTOMATIC OUTPUT INTEGRALITY/POSITIVITY — PROVED
GENERAL RESIDUAL-C COMPOSITION — PROVED
GENERAL ONE-PRIME TERMINAL FORMULA — PROVED
GENERAL TWO-PRIME FACTORIZATION — PROVED
GENERAL LAST-TWO DISCRIMINANT — PROVED
GENERAL FINITE t BOUND — PROVED
RESIDUAL-C SPLITTING HYPERSURFACE — PROVED ALGEBRAICALLY
E313 -> E307 MECHANISM TRANSFER — AUDITED
E307 PRIME TWO-CYCLE — OPEN
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this note.
