# Erdős 307: the core-30 residual-900 port and exact zero defect

**Programme:** `E306-RL-ADJ-16`  
**Status:** `GENERAL EQUIVALENCE / FIXED-PORT CONSTRUCTION FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The explicit Giuga-core relay counterexample shows that the return defect

```text
D^2(Y)-Y
```

can have either sign in the squarefree regime.  This note identifies the exact zero-defect
coordinate when one side of the desired cycle contains the smallest quotient-one Giuga core

```text
30,
D(30)=31.
```

The result is a fixed residual port:

```text
30Y-31D(Y)=900.
```

Thus the core-30 subproblem of E307 is not a moving two-cycle problem.  It is a scalar
residual-`900` port-filling problem plus one final primality test.

## 2. Exact core-30 equivalence

Let `Y` be squarefree and coprime to `30`.  Define

```text
Psi(Y)=30Y-31D(Y).                                 (2.1)
```

### Theorem 2.1 — residual-900 characterization

The following are equivalent.

1. There is a prime `r`, coprime to `30Y`, such that
   ```text
   D(Y)=30r,
   D(30r)=Y.
   ```
2. One has
   ```text
   Psi(Y)=900,                                     (2.2)
   ```
   and
   ```text
   r=(Y-30)/31                                     (2.3)
   ```
   is a prime coprime to `30Y`.

#### Proof

If `D(Y)=30r` and `D(30r)=Y`, then

```text
Y=31r+30.
```

Hence

```text
30Y-31D(Y)
 =30(31r+30)-31(30r)
 =900.
```

Also `(2.3)` follows.

Conversely, assume `(2.2)`.  Reducing modulo `31`,

```text
30Y congruent 900 congruent 1 mod 31.
```

Since `30 congruent -1 mod 31`, this gives

```text
Y congruent 30 mod 31,
```

so `r=(Y-30)/31` is an integer.  Equation `(2.2)` becomes

```text
31D(Y)=30(Y-30)=930r,
```

and therefore

```text
D(Y)=30r.
```

If `r` is prime, then

```text
D(30r)=31r+30=Y.
```

This proves the equivalence. `square`

## 3. Exact defect identity

Suppose only that

```text
D(Y)=30r
```

for a prime `r`.  Then

```text
D^2(Y)=D(30r)=31r+30.
```

### Theorem 3.1 — residual versus return defect

```text
30{D^2(Y)-Y}=900-Psi(Y).                           (3.1)
```

#### Proof

Using `31D(Y)=930r`,

```text
30D^2(Y)
 =30(31r+30)
 =31D(Y)+900.
```

Subtract `30Y`. `square`

### Sign dictionary

```text
Psi(Y)>900  <=> D^2(Y)<Y;
Psi(Y)=900  <=> D^2(Y)=Y;
Psi(Y)<900  <=> D^2(Y)>Y.                          (3.2)
```

The Giuga-core relay counterexample in `E306-RL-ADJ-15` is therefore a squarefree filling on the
positive-defect side `Psi(Y)<900`.

## 4. Scalar port formulation

For the general port operator

```text
Psi_(c,R)(B)=cB-RD(B),
```

the core-30 problem is the fixed instance

```text
(c,R,C)=(30,31,900).                               (4.1)
```

Thus an E307 cycle with a side `30r` is produced by:

1. finding a squarefree `Y`, coprime to `30`, with
   ```text
   Psi_(30,31)(Y)=900;
   ```
2. checking that
   ```text
   (Y-30)/31
   ```
   is prime.

All residual-`C` port composition theorems apply without modification.

## 5. Partial block state and terminal-prime formula

Let `Q` be a squarefree partial block, coprime to `30`, and put

```text
A=D(Q),
c_Q=30Q-31A,
R_Q=31Q.                                           (5.1)
```

Then

```text
Psi_(30,31)(Q)=c_Q.
```

If only one final prime `t` remains, the residual-`900` equation is

```text
c_Q t-R_Q=900.
```

### Proposition 5.1 — unique terminal prime

The only possible final factor is

```text
t={900+31Q}/{30Q-31D(Q)}.                         (5.2)
```

A one-prime completion exists if and only if:

1. `c_Q>0`;
2. the displayed quotient is an integer prime not dividing `30Q`;
3. the forced output
   ```text
   r={Qt-30}/31                                   (5.3)
   ```
   is a prime disjoint from `30Qt`.

The integrality of `r` is automatic once `(5.2)` is integral, by the proof of Theorem 2.1.

### Reciprocal interpretation

Since

```text
c_Q/Q=30-31 sum_(q|Q)1/q,
```

the positivity condition is

```text
sum_(q|Q)1/q<30/31.                                (5.4)
```

The terminal prime fills the exact remaining reciprocal deficit.

## 6. Exact reciprocal identity

If `(5.2)` holds and `Y=Qt`, then

```text
30Y-31D(Y)=900.
```

Dividing by `31Y` gives

```text
sum_(q|Q)1/q+1/t
 =30/31-900/(31Qt).                                (6.1)
```

Thus the complete reciprocal mass lies just below `30/31`, by the exact finite correction
`900/(31Y)`.

This is the exact-zero counterpart of the relay counterexample, where the chosen block has
reciprocal mass slightly above `30/31` and therefore produces positive return defect.

## 7. Two-prime tail factorization

Suppose two final primes `q,t` remain after the partial block `Q`.  Port composition gives

```text
c_Q qt-R_Q(q+t)=900.                               (7.1)
```

Multiplying by `c_Q` and adding `R_Q^2` gives:

### Theorem 7.1 — core-30 two-prime divisor port

```text
(c_Q q-R_Q)(c_Q t-R_Q)
 =R_Q^2+900c_Q.                                    (7.2)
```

Hence all two-prime tails are parameterized by complementary divisors of

```text
K_Q=R_Q^2+900c_Q.                                  (7.3)
```

If `d d'=K_Q` and

```text
d congruent d' congruent -R_Q mod c_Q,
```

then

```text
q=(d+R_Q)/c_Q,
t=(d'+R_Q)/c_Q.                                   (7.4)
```

The remaining tests are primality, disjointness, and primality of the forced core-side factor

```text
r=(Qqt-30)/31.
```

## 8. Prime-transition dynamics

Appending one prime `q` to the partial block updates

```text
(Q,c_Q,R_Q)
  ->(Qq, q c_Q-R_Q, qR_Q).                         (8.1)
```

The normalized slope evolves by

```text
c_Q/R_Q
  ->c_Q/R_Q-1/q.                                   (8.2)
```

Thus the exact core-30 E307 search is a standard residual-port tree beginning at

```text
(c,R)=(30,31)
```

and targeting residual

```text
C=900.
```

At every partial state, the future-prime threshold is

```text
q>R_Q/c_Q.                                         (8.3)
```

## 9. Exact-zero construction problem

The highest-value core-30 problem is now:

```text
find a squarefree port filling of
Psi_(30,31)(Y)=900
whose forced quotient (Y-30)/31 is prime.
```

This has three complementary formulations.

### Terminal formulation

Choose `Q` with `c_Q>0` and make `(5.2)` and `(5.3)` prime.

### Divisor formulation

Choose a shorter partial block and solve the two-prime factorization `(7.2)`.

### Pencil formulation

Intersect the fixed port `(30,31,900)` with residual-port pencils generated by E313 or other
squarefree block libraries.

The positive relay counterexample proves that the port residual can pass below `900`; small
negative-defect examples lie above `900`.  Exact equality is now a sharply formulated arithmetic
intersection problem, not a monotonicity question.

## 10. Classification

```text
CORE-30 E307 <=> RESIDUAL-900 PORT + OUTPUT PRIME — PROVED
RETURN-DEFECT / PORT-RESIDUAL IDENTITY — PROVED
ONE-PRIME TERMINAL FORMULA — PROVED
TWO-PRIME DIVISOR PORT — PROVED
EXACT RESIDUAL-900 FILLING WITH PRIME OUTPUT — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed by this research note.