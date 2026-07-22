# Sparse top synchronization core and the terminal-quotient obstruction

**Programme:** `E306-RL`  
**Research unit:** `E306-RL-PF1A-04`  
**Status:** `ARGUMENT / NEW THEOREM SEED / EXACT BLOCKED FRONTIER / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

## 1. Purpose

The current paper-first one-anchor route uses the whole top block

```text
B={q prime: Z/2<=q<Z},  Z=X^3,
```

as the quotient on which the exact-cold and fingerprint-entropy theorems are
applied.  Every other prime coordinate is then removed by shift-uniform product-
fibre compression.

This note asks whether the whole top quotient is necessary.  It proves that a
polylogarithmic actual-prime subset already gives uniform conditional compression
for every prime coordinate in the power interval.  It also records the precise
reason this does not, by itself, remove the quotient entirely: rowwise compression
must leave a terminal core, and controlling the number and weight of its mutually
self-consistent modes is a genuinely new sparse synchronization theorem.

No manuscript, proof-development, review, Curator, Lean, release, DOI, or
canonical status changes through this note.

## 2. Setting

Let

```text
P={r prime: X<=r<Z},
B={s prime: Z/2<=s<Z},
Z=X^3.
```

By the PNT,

```text
|B| asymp Z/log Z.
```

For a prime `r in P`, a nonzero residue `d mod r`, and `s in B` with `s!=r`, put

```text
a_(r,d)(s)=||d s^(-1)/r||^2.
```

If `s=r`, define the value to be zero.  Every value lies in `[0,1/4]`.

## 3. Uniform population energy at every scale

### Proposition 3.1 — full-top population floor

There is an absolute constant `c_0>0` such that, for all sufficiently large `Z`,

```text
sum_(s in B, s!=r) a_(r,d)(s) >= c_0 Z/(log Z)^3
```

uniformly for every prime `X<=r<Z` and every `d!=0 mod r`.

### Proof

There are two ranges.

#### Range I: `r<Z/2`

Let `M=|B|`.  Among the residues `s^(-1) mod r`, the multiplicity of one residue is
at most

```text
mu_r <= Z/(2r)+1 <= 2Z/r
```

for large `Z`.  The multiplicity-sensitive cyclic packing inequality gives

```text
sum_(s in B) ||d s^(-1)/r||^2
 >= M^3/(12 mu_r^2 r^2).
```

Since `M>>Z/log Z`, the right side is

```text
>> (Z^3/(log Z)^3)/Z^2
 = Z/(log Z)^3.
```

#### Range II: `Z/2<=r<Z`

Put `Y=Z/2`.  Then `r in [Y,2Y)` and `B subset [Y,2Y)`.  Remove `r` if it belongs
to `B`, and write `M'=|B\{r}|`.

Set

```text
delta=M'/(64Z).
```

If

```text
||d s^(-1)/r|| <= delta,
```

there is an integer `v` with

```text
v = d s^(-1)-ell r,
|v|<=delta r<=M'/64,
v s = d mod r.
```

For fixed nonzero `v`, the last congruence determines one residue class for `s`
modulo `r`.  The interval containing `B` has length `Z/2<=r`, so it contains at
most two integers in that residue class.  There are fewer than `M'/16+1` possible
values of `v`; hence fewer than `M'/2` members of `B\{r}` have phase at most
`delta`.

At least `M'/2` phases are larger than `delta`, and therefore

```text
sum_(s in B, s!=r) a_(r,d)(s)
 >= (M'/2) delta^2
 >> M'^3/Z^2
 >> Z/(log Z)^3.
```

This proves the proposition.  `square`

## 4. Bernoulli sampling of one common top core

Choose every prime `s in B` independently with probability

```text
rho = K (log Z)^4/Z,
```

where `K` is a sufficiently large absolute constant, and call the resulting set
`S`.

For one fixed test `(r,d)`, put

```text
Y_(r,d)=sum_(s in S, s!=r) a_(r,d)(s).
```

Proposition 3.1 gives

```text
E Y_(r,d)
 = rho sum_(s in B, s!=r) a_(r,d)(s)
 >= c_0 K log Z.
```

For independent variables in `[0,1/4]`, the standard multiplicative Chernoff
argument gives

```text
Pr(Y_(r,d) < (1/2) E Y_(r,d))
 <= exp(-c E Y_(r,d))
 <= Z^(-c'K).
```

The number of tests is less than

```text
sum_(r<Z) r < Z^2.
```

Taking `K` large makes the union-bound failure probability less than `1/4`.
Also

```text
E|S| = rho |B| << K (log Z)^3,
```

and an ordinary Chernoff bound gives

```text
|S| <= C K (log Z)^3
```

with probability tending to one.  Hence both events occur simultaneously for at
least one deterministic set `S`.

### Theorem 4.1 — sparse top conditional sensor core

For every fixed `A>0`, all sufficiently large `Z` admit an actual-prime set

```text
S subset B,
|S| <= C_A (log Z)^3,
```

such that

```text
D_r(S)
 := min_(d!=0 mod r)
    sum_(s in S, s!=r) ||d s^(-1)/r||^2
 >= A log Z
```

simultaneously for every prime `X<=r<Z`.

The constant in the sample size may be enlarged to make the coefficient `A`
arbitrarily large but fixed.

## 5. Conditional fibre compression

Let the Bernoulli parameter lie in a fixed compact subinterval of `(0,1)`.  For a
fixed assignment on the sensor coordinates `S`, every coordinate `r in P\S` sees
an arbitrary shifted cyclic code with squared distance at least `A log Z`.

The arbitrary-shift fibre theorem therefore gives

```text
sum_(x mod r, x!=x_r^*) W_r(x)
 <= r exp(-c A log Z).
```

Choosing `A` sufficiently large gives

```text
sum_(r in P\S) r exp(-c A log Z) = O(Z^(-10)).
```

Consequently, after fixing the assignment on `S`, the whole product of coordinates
`P\S` compresses to one decoded point with total sibling mass `O(Z^(-10))`.
The estimate is uniform in every shift supplied by the sensor assignment and by
all unused denominator factors.

### Corollary 5.1 — quotient reduction

The complete-prime CRT Fourier sum may be reduced, with a negative-power error, to
a quotient indexed only by

```text
product_(s in S) Z/sZ,
```

where `|S|=O((log Z)^3)`.

The sensor scaffold uses only existing complete-pair denominators.  If its edges
are counted separately, its reciprocal load is

```text
(sum_(s in S)1/s)(sum_(r in P)1/r)
 = O((log Z)^3/Z),
```

and is therefore vanishing.  Its square load is smaller still.

## 6. A necessary terminal core for rowwise elimination

The preceding theorem does **not** imply that every coordinate can be eliminated.
This is not a technicality.

### Proposition 6.1 — terminal-core principle

Consider an iterative proof which eliminates coordinates one at a time using only
a shift-uniform one-fibre theorem.  Suppose the proof requires at least `d`
not-yet-eliminated sensor coordinates to certify the needed distance for every
coordinate being eliminated.  Then every elimination order leaves at least `d`
coordinates unevaluated.

### Proof

Once fewer than `d+1` coordinates remain, no remaining coordinate has `d` other
not-yet-eliminated coordinates available as sensors.  Thus the process must stop
with at least `d` coordinates.  `square`

For negative-power sibling suppression one needs distance `D>>log Z`.  Since one
phase coordinate contributes at most `1/4`, every such purely rowwise certificate
needs

```text
d >= 4D >> log Z.
```

Thus a quotient of at least logarithmic dimension is unavoidable for this proof
form.  Theorem 4.1 leaves a quotient of dimension `O((log Z)^3)`, within two
logarithmic powers of the elementary degree lower bound.

## 7. Why conditional concentration is not yet global synchronization

Fixing the quotient assignment `y on S` gives excellent concentration of every
outside fibre.  But after those fibres are removed, the proof must still sum over

```text
prod_(s in S) s
 = exp(O((log Z)^4))
```

possible quotient assignments.

A one-fibre estimate normalizes each conditional partition to approximately one;
it does not bound how many mutually self-consistent quotient modes exist.  In a
general Gibbs system, strong single-site conditional concentration does not imply
a small global partition: pairwise systems may possess many stable modes.  Any
successful argument here must exploit the arithmetic CRT structure, not merely the
abstract shifted-code theorem.

The currently available full-top one-block theorem supplies exactly this missing
entropy sink.  It proves that the large quotient has only a short integer diagonal
plus an exponentially suppressed complement.  Theorem 4.1 shows that the large
quotient can first be reduced to a polylogarithmic core; it does not yet replace
that final synchronization theorem.

## 8. Exact new frontier

The remaining theorem is the following.

### Sparse arithmetic synchronization problem

Construct a set `S subset B` of polylogarithmic size, or a near-linear sparse graph
on `B`, and prove a bound of the form

```text
sum_(quotient assignments outside a short integer diagonal)
  [internal sparse Gibbs weight]
  [retained decoded-skeleton weight]
 <= o(1/sigma_E).
```

The theorem must retain the coherent integer modes needed by the major arc while
suppressing every other self-consistent quotient mode.  It should not assume the
full-block fingerprint entropy theorem it is intended to replace.

A positive solution would replace the last full top-block quotient by a
polylogarithmic synchronization core and would produce a reusable sparse CRT Gibbs
rigidity theorem.  A negative solution should identify an arithmetic family of
spurious stable quotient modes or a lower bound showing that density of the
current one-block theorem is essential.

## 9. Disposition

Established here:

```text
UNIFORM FULL-RANGE POPULATION FLOOR — PROVED ARGUMENT
POLYLOG ACTUAL-PRIME CONDITIONAL SENSOR CORE — PROVED ARGUMENT
TERMINAL-CORE PRINCIPLE — PROVED ARGUMENT
```

Not established:

```text
CONDITIONAL COMPRESSION => GLOBAL SPARSE SYNCHRONIZATION.
```

Therefore the honest return is

```text
NEW-THEOREM SEED FOUND /
EXACT BLOCKED FRONTIER: SPARSE ARITHMETIC SYNCHRONIZATION /
NOT A REPLACEMENT FOR THE CURRENT ONE-ANCHOR ROUTE YET.
```
