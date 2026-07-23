# Erdős 307: seeded scalar port composition and the E313 bridge

**Programme:** `E306-RL-ADJ-10`  
**Status:** `GENERAL EQUIVALENCE / SEMIGROUP ACTION / CONSTRUCTION FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The two-prime-per-side seeded reduction produced one cubic divisor factorization.  That
factorization is not an isolated trick.  After fixing one new prime on one side, an arbitrary
block on the opposite side satisfies a scalar arithmetic-derivative port equation of exactly
the type used in primary-pseudoperfect/E313 port constructions.

This note proves the general reduction and composition law.

## 2. Seeded E307 data

Fix coprime squarefree prefixes `x,y` and a new prime `p`, disjoint from both.  Put

```text
M=D(xp)=pD(x)+x,
Delta=xy-D(x)D(y),
c=L_p=xpy-MD(y)=Delta p-xD(y),
R=yM,
C=x^2p^2.                                       (2.1)
```

Assume

```text
c>0.                                            (2.2)
```

Let `B` be a squarefree right filler, coprime to `xyp`, and let `r` be one final left prime.
The proposed completed pair is

```text
X=xpr,
Y=yB.
```

## 3. Exact scalar-port reduction

The derivative-cycle equations are

```text
D(xpr)=yB,
D(yB)=xpr.                                      (3.1)
```

Since `D(xpr)=Mr+xp`, the first equation gives

```text
Mr=yB-xp.                                       (3.2)
```

The second is

```text
D(y)B+yD(B)=xpr.                                (3.3)
```

### Theorem 3.1 — seeded scalar-port equivalence

Equations `(3.1)` hold if and only if

```text
cB-RD(B)=C                                      (3.4)
```

and

```text
r=(yB-xp)/M                                     (3.5)
```

is a positive integer.

#### Proof

Multiply `(3.3)` by `M` and use `(3.2)`:

```text
xp(yB-xp)=M{D(y)B+yD(B)}.
```

Rearranging gives

```text
{xpy-MD(y)}B-yM D(B)=x^2p^2,
```

which is `(3.4)`.  Conversely, if `(3.4)` holds and `r` is defined by `(3.5)`, then the first
derivative equation holds by definition.  Reversing the displayed elimination gives `(3.3)`.
`square`

### Corollary 3.2 — E307 completion criterion

The seed extends to an E307 cycle with an arbitrary squarefree right block `B` and one final
left prime if and only if:

1. `B` is squarefree and coprime to `xyp`;
2. `cB-RD(B)=C`;
3. `(yB-xp)/M` is a positive prime disjoint from all previous factors.

Thus the arithmetic-port problem and the final prime-output problem are cleanly separated.

## 4. General scalar port operator

For integers `c,R` and a positive integer `B`, define

```text
Psi_(c,R)(B)=cB-RD(B).                          (4.1)
```

### Theorem 4.1 — port composition law

For all positive integers `A,B`,

```text
Psi_(c,R)(AB)
 =Psi_(Psi_(c,R)(A), R A)(B).                  (4.2)
```

#### Proof

By the product rule,

```text
Psi_(c,R)(AB)
 =cAB-R{A D(B)+B D(A)}
 ={cA-RD(A)}B-RA D(B),
```

which is the right side. `square`

Hence positive integers act on port states by

```text
(c,R) . A=(Psi_(c,R)(A),RA),                   (4.3)
```

and component multiplication gives a semigroup action.

### Prime transition

For a prime `q`,

```text
(c,R) . q=(cq-R,Rq).                            (4.4)
```

The normalized slope evolves by

```text
(cq-R)/(Rq)=c/R-1/q.                            (4.5)
```

Thus adjoining primes simply subtracts their reciprocals from the port slope.

## 5. Partial blocks and positivity

For a squarefree partial block `A`, put

```text
c_A=Psi_(c,R)(A),
R_A=RA.                                         (5.1)
```

Then

```text
c_A/R_A=c/R-sum_(q|A)1/q.                      (5.2)
```

Suppose a full squarefree block `B` satisfies

```text
Psi_(c,R)(B)=C>0.                               (5.3)
```

For every proper divisor `A|B`,

```text
c_A>0.                                          (5.4)
```

Indeed the reciprocal sum over `A` is strictly smaller than the reciprocal sum over `B`, and

```text
c/R-sum_(q|B)1/q=C/(RB)>0.
```

### Future-prime threshold

If `q` is the next prime after state `(c_A,R_A)`, positivity requires

```text
q>R_A/c_A.                                      (5.5)
```

This gives an exact branch-and-bound threshold at every node of the port tree.

## 6. Terminal-prime formula

If only one right prime `q` remains, the target equation is

```text
c_A q-R_A=C.
```

### Proposition 6.1

The unique terminal candidate is

```text
q=(C+R_A)/c_A.                                  (6.1)
```

Hence a port search can grow a partial block and at every node test whether the remaining
terminal candidate is an integer prime.

This is the direct analogue of terminal-prime tests in primary-pseudoperfect port fillings,
with a general positive target residual `C` rather than residual `1`.

## 7. Two-prime block and the cubic divisor identity

Take `B=qs`.  Then

```text
cqs-R(q+s)=C.                                   (7.1)
```

Multiplying by `c` and adding `R^2` gives

```text
(cq-R)(cs-R)=R^2+cC.                            (7.2)
```

For the E307 seed,

```text
R^2+cC
 =y^2M^2+L_p x^2p^2
 =K_p.                                          (7.3)
```

Thus the earlier divisors

```text
d=L_pq-yM,
d'=L_ps-yM
```

are exactly the two possible intermediate port coefficients after adjoining `q` or `s` first.
The cubic divisor reduction is therefore the length-two port composition law.

## 8. Port-tree interpretation

A right block

```text
B=q_1...q_k
```

can be built through states

```text
(c_0,R_0)=(c,R),
(c_j,R_j)=(c_(j-1)q_j-R_(j-1),R_(j-1)q_j).      (8.1)
```

The final condition is

```text
c_k=C.                                          (8.2)
```

The endpoint is independent of the ordering because it equals `Psi_(c,R)(B)`, although the
intermediate states and pruning efficiency depend on the chosen order.

The search state needs only

```text
current c_j,
current R_j,
remaining target C,
used prime set.
```

No repeated arithmetic-derivative expansion is necessary.

## 9. Relationship with E313

For a squarefree integer `B`, primary-pseudoperfect equations and their port variants also take
the form

```text
cB-RD(B)=C_0.                                   (9.1)
```

The composition rule `(4.2)`, prime transition `(4.4)`, slope subtraction `(4.5)`, and
terminal formula `(6.1)` are therefore shared mechanisms.

The difference is at closure:

```text
E313:
  the scalar port output is itself the desired object and may admit inheritance;

E307:
  the scalar port fills only one side of a coupled derivative cycle,
  and the remaining quotient r=(yB-xp)/M must be prime;
  once the full cycle closes, anti-inheritance forbids further multiplication.
```

Thus E307 is not disconnected from E313.  It is a scalar port-filling problem with an additional
bilateral prime-output constraint.

## 10. Construction programme

The new route is:

1. choose prefixes `x,y` and seed `p` with `c=L_p>0`;
2. solve the scalar port equation
   ```text
   cB-RD(B)=C=x^2p^2
   ```
   by port composition, terminal-prime formulas, or inherited block libraries;
3. test whether
   ```text
   r=(yB-xp)/D(xp)
   ```
   is a new prime;
4. verify disjointness and the derivative cycle.

The highest-value adjacent question is whether known or new E313-style port blocks can be
adapted to prescribed residuals `C` which are large squares, while simultaneously controlling
the affine prime output `r`.

## 11. Honest classification

```text
SEEDED E307 -> SCALAR PORT EQUATION — PROVED
GENERAL PORT COMPOSITION LAW — PROVED
PRIME STATE TRANSITION AND SLOPE SUBTRACTION — PROVED
PARTIAL-PORT POSITIVITY AND THRESHOLDS — PROVED
TERMINAL-PRIME FORMULA — PROVED
TWO-PRIME CUBIC FACTORIZATION AS LENGTH-TWO PORT — PROVED
ARBITRARY-BLOCK E307 CONSTRUCTION — OPEN
E307 PRIME TWO-CYCLE — OPEN
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this note.
