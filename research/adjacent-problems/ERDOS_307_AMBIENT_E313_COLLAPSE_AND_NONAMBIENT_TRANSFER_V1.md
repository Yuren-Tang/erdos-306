# Erdős 307: ambient E313 collapse and the necessity of nonambient port transfer

**Programme:** `E306-RL-ADJ-13`  
**Status:** `STRUCTURAL NO-GO THEOREM / TRANSFER FILTER / COMPUTATIONAL DIAGNOSTIC`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

Residual port pencils show that a block used in E313 can also solve equations with arbitrary
positive residual `C`.  This raises a natural question: can one reuse a known E313 filling in
its original ambient port to construct E307?

The answer is rigid.  Ambient reuse collapses exactly to the consecutive Giuga/primary-
pseudoperfect bridge.  Every genuinely nonconsecutive transfer must move the block to a
nonambient point of its residual-`C` pencil.

## 2. Ambient residual-one ports

Let `y>1` be squarefree and put

```text
b=D(y),
c_y=y-b.                                      (2.1)
```

Suppose a squarefree block `B`, coprime to `y`, fills the ambient residual-one port:

```text
c_y B-yD(B)=1.                                 (2.2)
```

Then, by the product rule,

```text
D(yB)=D(y)B+yD(B)
      =(y-c_y)B+yD(B)
      =yB-1.                                   (2.3)
```

Thus

```text
Y=yB                                             (2.4)
```

is primary pseudoperfect.

## 3. Ambient collapse theorem

### Theorem 3.1

Let `B` satisfy `(2.2)`.  If `Y=yB` is one side of an E307 arithmetic-derivative two-cycle,
then the other side is uniquely

```text
X=Y-1.                                         (3.1)
```

Moreover the cycle exists if and only if

```text
D(Y-1)=Y.                                      (3.2)
```

#### Proof

Equation `(2.3)` gives `D(Y)=Y-1`.  An E307 cycle containing `Y` must have other member
`X=D(Y)=Y-1`.  The return equation is exactly `(3.2)`. `square`

Hence direct ambient reuse of an E313 filling is equivalent to a consecutive derivative cycle:

```text
D(Y-1)=Y,
D(Y)=Y-1.                                      (3.3)
```

For squarefree composite `Y-1`, the first equation is the Giuga arithmetic-derivative
condition; the second is the primary-pseudoperfect condition.

### Consequence

Known or future ambient E313 blocks cannot produce a general nonconsecutive E307 cycle.  They
can do so only when the resulting primary pseudoperfect number has a squarefree Giuga
predecessor.

## 4. Pure scaling cannot match a seeded E307 port

Let `B` fill a residual-one port `(R_0,c_0)`.  Its residual-`C` pencil is

```text
c=Cc_0+tD(B),
R=CR_0+tB.                                     (4.1)
```

The exact gcd law is

```text
gcd(c,R)=gcd(C,t).                             (4.2)
```

For a seeded E307 port,

```text
C=x^2p^2>1,                                    (4.3)
```

and the established disjoint squarefree hypotheses give

```text
gcd(c,R)=1.                                    (4.4)
```

### Theorem 4.1 — nonambient parameter is necessary

If an E313 residual-one block is reused in a seeded E307 port, its pencil parameter must satisfy

```text
t!=0,
gcd(t,C)=1.                                   (4.5)
```

In particular the pure scaled point

```text
(c,R)=(Cc_0,CR_0)                              (4.6)
```

can never be a seeded E307 port.

This is the precise sense in which E313 blocks are reusable but their ambient ports are not.

## 5. Known 2026 port blocks

Han Wang's 2026 preprint *Port Fillings for Primary Pseudoperfect Numbers*,
arXiv:`2605.21518`, records the central port

```text
(66,5)
```

with fillings

```text
23*31,
23*31*47059,
17*101*149*3109,
17*101*157*1979*10093*16879,
```

and the key port

```text
(113322,797)
```

with port-primitive fillings

```text
149*3109,
157*1979*10093*16879.
```

These are residual-one blocks.  The present theorem says that their direct ambient use in E307
reduces to testing whether the resulting primary pseudoperfect number has a Giuga predecessor.
A general E307 use must instead solve the nonambient pencil-intersection equations.

## 6. Computational transfer diagnostic

A block-first quadratic test used the four central-port fillings above and:

- the first twelve primes;
- every nonempty prefix subset of size at most three on each side;
- all ordered disjoint prefix pairs also disjoint from the block;
- the exact seed quadratic
  ```text
  x^2p^2-(Delta B-D(x)yD(B))p
   +x(D(y)B+yD(B))=0.
  ```

There were `74380` positive-deficit prefix/block tests.  None produced an integral seed root.
Hence none reached the seed-primality or final-output-primality stages.

A separate test of the two key-port primitive blocks against all disjoint prefix pairs from the
first ten primes, with each prefix of size at most three, likewise produced no integral seed.

These finite computations have no exclusion force for E307.  Their interpretation is that the
first rare event is already intersection of the E307 seed curve with the fixed block's port
pencil, not primality of the final output.

## 7. Two new primary pseudoperfect examples do not give consecutive cycles

The cited 2026 work gives

```text
N_9=5998279018951962402
```

and its inherited ten-prime example

```text
N_10=35979351189199316534587473905773572006.
```

Direct exact arithmetic gives

```text
N_9-1
 =29*6961*1052221*28239049,
D(N_9-1)=207704818440408340,
```

which is not `N_9`.

Also

```text
N_10-1
 =5*1278439*5628637923154615360543205253559,
D(N_10-1)=7195898381029479079994297497187374391,
```

which is not `N_10`.

Thus neither new example produces an ambient consecutive E307 cycle.  These calculations do
not address nonambient pencil transfer.

## 8. Correct transfer programme

The E313-to-E307 programme should now be:

1. take a residual-one block `B` with base port `(R_0,c_0)`;
2. use its full residual-`C` pencil
   ```text
   (c,R)=(Cc_0+tD(B),CR_0+tB),
   gcd(t,C)=1;
   ```
3. intersect this pencil with the E307 seed surface
   ```text
   c=Delta p-xD(y),
   R=yD(xp),
   C=x^2p^2;
   ```
4. test the automatic positive integer bilateral output for primality.

Equivalently, use the block-first seed quadratic.  Direct ambient reuse should no longer be
searched except as a deliberate Giuga/primary-pseudoperfect consecutive-cycle probe.

## 9. Classification

```text
AMBIENT E313 FILLING -> PRIMARY PSEUDOPERFECT SIDE — PROVED
AMBIENT E307 REUSE -> CONSECUTIVE CYCLE — PROVED
PURE RESIDUAL SCALING IMPOSSIBLE FOR SEEDED E307 — PROVED
NONAMBIENT COPRIME PENCIL PARAMETER NECESSARY — PROVED
KNOWN 2026 BLOCK TRANSFER DIAGNOSTIC — NO INTEGRAL SMALL SEEDS
NEW N_9,N_10 PREDECESSOR CHECK — NOT CONSECUTIVE CYCLES
E307 PRIME TWO-CYCLE — OPEN
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this note.
