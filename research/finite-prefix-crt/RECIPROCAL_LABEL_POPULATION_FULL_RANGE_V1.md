# Full-range reciprocal-label population and simultaneous sampling

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-RLPOP-02`  
**Status:** `ARGUMENT / MATERIAL GENERAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-23

## 1. Purpose

The square-root GFF route uses the top prime block to suppress coherent integer
labels after the genuine Gaussian range.  The first one-anchor note proved the
population estimate only up to `Z^(9/8)`.  The sparse-synchronization route has a
larger deterministic label range, of order

```text
Z^(3/2)/(log Z)^(1/2).
```

This note proves a uniform population bound up to the much larger natural interval

```text
|m|<=c Z^2/log Z.
```

It also states the target-dependent simultaneous sampling consequence needed by
the small-parameter route.

## 2. Setting

Let

```text
B={s prime:Z/2<s<=Z}.
```

For `x in {0,1}` and an integer `m`, define

```text
E_(m,x)(s)=||m/(2s)+x/2||^2.
```

By PNT,

```text
|B| asymp Z/log Z.
```

## 3. Reciprocal-interval count

Fix

```text
delta=c_0/log Z
```

with `c_0>0` sufficiently small.  By symmetry it is enough to take `m>0`.

If

```text
||m/(2s)+x/2||<delta,
```

then there is an integer `k`, with parity prescribed by `x`, such that

```text
|m/s-k|<2delta.
```

Assume

```text
m>=Z/log Z.
```

Then `m/s>=1/log Z`.  If `c_0<=1/8`, the case `k=0` is impossible.

For every `k>=1` with `k>2delta`, the inequality confines `s` to

```text
I_k=(m/(k+2delta),m/(k-2delta)).
```

Its length is

```text
|I_k|
 =4delta m/(k^2-4delta^2)
 <=C delta m/k^2.
```

Only `k` satisfying

```text
m/Z-O(delta)<=k<=2m/Z+O(delta)
```

can make `I_k` meet `[Z/2,Z]`.

### Proposition 3.1 — bad-integer count

Uniformly for

```text
Z/log Z<=m<=c_1 Z^2/log Z,
```

the number of integers `s in [Z/2,Z]` satisfying the small-phase inequality is

```text
O(delta Z+m/Z+1).
```

#### Proof

If `m<Z`, only `O(1)` positive integers `k` are relevant, and their total interval
length is `O(delta m)<=O(delta Z)`.

If `m>=Z`, the relevant `k` are comparable to `m/Z`.  Therefore

```text
sum_k |I_k|
 <=C delta m sum_(k asymp m/Z)1/k^2
 <=C delta Z.
```

The number of intervals is `O(m/Z+1)`.  The number of integers in their union is
at most total length plus the number of intervals.  `square`

The parity restriction can only reduce the count.

## 4. Uniform positive population energy

Choose `c_0` and then `c_1` sufficiently small.  Since

```text
delta Z asymp Z/log Z
```

and

```text
m/Z<=c_1 Z/log Z,
```

Proposition 3.1 and the PNT imply that at most a fixed proper fraction of the
primes in `B` satisfy the small-phase inequality.

Thus a fixed positive proportion of `s in B` obey

```text
E_(m,x)(s)>=delta^2.
```

### Theorem 4.1 — full-range reciprocal-label population floor

There are absolute constants `c,C>0` such that, for all sufficiently large `Z`,
uniformly for

```text
Z/log Z<=|m|<=c Z^2/log Z,
x in {0,1},
```

one has

```text
(1/|B|)sum_(s in B)E_(m,x)(s)
 >=C/(log Z)^2.
```

Negative `m` follows from circle-distance symmetry after changing the sign of the
corresponding integer `k`.

## 5. Compatibility with synchronized label ranges

The robust exact-cold witness theorem at top scale has forcing floor

```text
F_Z asymp Z/(log Z)^3
```

and variance scale

```text
sigma_Z asymp 1/(Z log Z).
```

Hence its deterministic coherent label range is

```text
sqrt(F_Z)/sigma_Z
asymp Z^(3/2)/(log Z)^(1/2).
```

This is `o(Z^2/log Z)`.  Therefore Theorem 4.1 covers the entire coherent outer
range required by both:

1. the fixed-parameter sparse-synchronization proof of the original theorem;
2. the small-parameter square-root GFF route.

## 6. Simultaneous target-dependent sample

Let `q` be a target parameter and suppose

```text
q>=C (log Z)^4/Z.
```

Choose a sample size

```text
M=C_A (log Z)^3/q.
```

Then `M<=|B|` for a sufficiently large threshold constant.

Sample `M` primes uniformly without replacement from `B`.  For any fixed
reciprocal-label test, Theorem 4.1 gives expected sample energy

```text
>>M/(log Z)^2
 >>A log Z/q.
```

Serfling/Bernstein concentration gives failure probability

```text
<=exp(-cA log Z/q).
```

This is at most `Z^(-cA)` for `q<=1`.  There are fewer than `CZ^2` reciprocal-label
tests in the full range, including both values of `x`.  The CRT row-test family
also has fewer than `Z^2` members.

Taking `A` sufficiently large and using the already established row population
floors gives one deterministic actual-prime sample `S subset B` such that
simultaneously:

```text
min_(d!=0 mod r)
 sum_(s in S,s!=r)||d s^(-1)/r||^2
 >>log Z/q
```

for every prime row `r<Z`, and

```text
sum_(s in S)||m/(2s)+x/2||^2
 >>log Z/q
```

for every

```text
Z/log Z<=|m|<=c Z^2/log Z,
x in {0,1}.
```

Multiplication by the small Bernoulli kernel coefficient `theta asymp q` produces
effective energy `>>log Z` in every test.

### Theorem 6.1 — full-range dual-purpose core

For every target

```text
q>=C(log Z)^4/Z,
```

there exists one actual-prime set

```text
S subset B,
|S|=O((log Z)^3/q),
```

which simultaneously supplies polynomially strong absolute suppression for all
prime CRT rows and all coherent outer labels in the full range of Theorem 4.1.

## 7. Significance

The theorem closes the upper-endpoint uncertainty in the square-root GFF
candidate.  It also shows that actual-prime sample availability itself persists
down to the much smaller scale

```text
q~(log Z)^4/Z.
```

The obstruction to reaching that scale in the present proof is therefore not the
reciprocal-label population or the number of available top primes.  It is the
explicit sampled-core synchronization entropy isolated in

`SAMPLED_CORE_DEFECT_EXPANSION_POWER_BARRIER_V1.md`.

Classification:

```text
FULL-RANGE RECIPROCAL-LABEL POPULATION — PROVED ARGUMENT
DUAL-PURPOSE TARGET-ADAPTIVE CORE — MATERIAL THEOREM CANDIDATE
SQUARE-ROOT OUTER-LANE ENDPOINT — CLOSED AT ARGUMENT LEVEL.
```

No proof-development, manuscript, Curator, review, Lean, release, DOI, arXiv, or
canonical status changes through this note.
