# Programme-state addendum: E307 rebound, block code, and defect spectrum

**Programme:** `E306-RL`  
**Date:** 2026-07-23  
**Status:** `MATERIAL ADJACENT-PROBLEM CHECKPOINT / RESEARCH ONLY / NOT INDEPENDENTLY REVIEWED`

## 1. Executive correction

The proposed global obstruction

```text
Y and D(Y) squarefree, 0<D(Y)<Y
  =>D^2(Y)<Y
```

is false.  Two explicit Giuga-core mechanisms now prove squarefree descent followed by overshoot.
The shorter construction gives a descending side with `60` prime factors and uses only two affine
prime forms.

Therefore no future E307 no-go programme should rely on monotonicity or two-step size contraction.
Exact equality

```text
D^2(Y)=Y
```

must be attacked through exact return arithmetic.

## 2. Direct rebound theorem

For any squarefree quotient-one Giuga core `C`,

```text
D(C)=C+1,
```

and any squarefree block `A` with

```text
C/(C+1)<D(A)/A<1,
```

simultaneous prime solutions of

```text
D(A)v+A=Cm
```

produce

```text
Y=Av,
X=Cm,
D(Y)=X<Y<D(X)
```

once `v` exceeds the exact reciprocal-gap threshold.

For `C=30`, an explicit `59`-prime block and primes `v=25409` and a `123`-digit prime `m` give an
unconditional counterexample.  This is the minimal mechanism for disproving contraction.

## 3. Exact core-30 target

The E307 subproblem with one side `30r` remains

```text
30Y-31D(Y)=900,
(Y-30)/31 prime.
```

Equivalently, with

```text
N=31Y,
```

one seeks

```text
N-D(N)=900,
31 exactly divides N,
(N-930)/961 prime.
```

Every eligible standard-coordinate state has at least `67` prime factors.  A previously constructed
positive-return relay reaches this support layer but lies on the wrong side of the residual-900
surface.  Complete one-, two-, and three-swap repairs of that relay fail.

## 4. Block-code theorem

For coprime squarefree blocks `A,B` and `0<C<AB`,

```text
AB-D(AB)=C
```

if and only if

```text
B D(A)=-C mod A,
A D(B)=-C mod B,
D(A)/A+D(B)/B<1.
```

The theorem extends to any number of pairwise coprime blocks.  For squarefree `A`, the first
condition assigns one unique complement residue

```text
theta_C(A)=-C D(A)^(-1) mod A.
```

Thus exact defect is a hybrid of:

```text
multiplicative CRT syndrome,
reciprocal-load positivity.
```

The primewise `mu`-Sondow/Korselt criterion is prior literature; the block packaging is the current
construction interface and is not novelty-audited.

## 5. Ambient E313 boundary

If `K` is any even squarefree primary pseudoperfect number and `B` is a coprime squarefree block,
then `B` is odd and

```text
B-KD(B)
```

is odd.  Therefore no even PPN ambient core can be filled to any even residual, including `900`, by
any coprime squarefree block.

Known E313 blocks may still enter through nonambient residual-port pencils, but ambient inheritance
is completely unavailable.

The standard small `mu`-Sondow constructions often insert `rad(mu)` into the constructed number.
They are incompatible with primitive defect-900 states, which satisfy `gcd(N,900)=1`.

## 6. Defect spectrum

If squarefree `N` satisfies

```text
delta(N)=N-D(N)=C>0,
```

then for every `p|N`, with `K=N/p`,

```text
delta(K)=(K+C)/p=(N+Cp)/p^2.
```

Hence every final prime is a one-prime terminal port from its cofactor.

For a two-prime tail `N=Hqt`, with `c=delta(H)`, the two factors in

```text
(cq-H)(ct-H)=H^2+Cc
```

are exactly the intermediate defects

```text
delta(Hq),
delta(Ht).
```

The two-prime divisor port is therefore a defect ladder

```text
(H,c) -> (Hq,d) -> (Hqt,C),
```

not an anonymous factorization.

For the distinguished factor `31`,

```text
31 delta(N/31)=N/31+900,
```

and the E307 output prime is

```text
delta(N/31)-30.
```

## 7. Computational diagnostics

The following complete bounded tests gave no integer two-prime terminal closure:

1. the natural support-65 partial block;
2. `12,020` one-boundary-replacement support-65 blocks;
3. structured odd tails obtained from all currently used primary-pseudoperfect cores, completed by
   the smallest admissible primes;
4. all distinct structured sub-tail variants arising from those known cores.

The failures occur at bounded divisor support / integrality, before primality.

These are diagnostics, not general exclusions.

## 8. Corrected research ranking

### Highest-value constructive mechanism

Build distant block libraries with controlled

```text
theta_900(A),
D(A)/A,
delta(A),
distinguished factor 31,
```

and seek mutual block-syndrome collisions rather than low-Hamming repairs.

### Highest-value terminal mechanism

Generate large primitive intermediate quotient-one `d`-Sondow states `K` and test

```text
(K+900)/d
```

for a new prime.  The parameter `d` is generally enormous; small OEIS `mu` tables are not the right
search space.

### Analytic mechanism

Develop a multiplicative hot-cold model:

```text
hot block:
  mix product residues;

cold block:
  supply reciprocal mass;

terminal block:
  close the finite residual 900 exactly.
```

The essential new difficulty relative to E306 is self-modularity: the modulus and target both move
with the selected block.

### Low-value directions

```text
more contraction inequalities;
more random low swaps;
more local congruences without a gluing or distribution theorem;
ambient transfer from even PPN chains.
```

## 9. Honest status

```text
SQUAREFREE TWO-STEP CONTRACTION — FALSE / EXPLICIT COUNTEREXAMPLES
DIRECT TWO-LINEAR-FORM REBOUND — PROVED
CORE-30 E307 <=> DEFECT-900 + OUTPUT PRIME — PROVED
BLOCK-SYNDROME GLUING — PROVED
AMBIENT EVEN-PPN TO EVEN DEFECT — IMPOSSIBLE
DEFECT SPECTRUM / INTERMEDIATE LADDER — PROVED
EXACT DEFECT-900 E307 FILLING — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No released E306 proof, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed by this checkpoint.
