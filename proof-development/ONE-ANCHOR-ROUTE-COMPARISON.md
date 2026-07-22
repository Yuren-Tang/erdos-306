# E306-PD-OA1-01 — one-anchor route comparison

**Role:** `Erdős 306 — One-Anchor Proof Developer` (`E306-PD-OA1-01`)  
**Parent:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Exact base:** `research/e306-frontier-v1@74a68bef4778f15bb818c804d9c5fb0040660246`  
**Classification:** `GENUINE STRICT SIMPLIFICATION`  
**Assurance state:** ready for a separate independent route audit; not a manuscript, formalization, release, or submission authority.

## 1. Question decided

The task was to determine whether the Research Lead's one-anchor candidate can be expanded into a complete ordinary proof, or whether it merely renames, incompletely suppresses, or falsely discards work performed by the independently audited multiblock paper-first route.

The answer is affirmative.  The route closes after two proof-development corrections that do not alter its architecture:

1. for a fixed prime `r|b`, the strong row distance is proved directly from
   `||d q^{-1}/r||>=1/r` term by term; no unproved equidistribution of the top primes modulo `r` is used;
2. the nondecoder error is summed only after multiplication by the complete top-block partition.  The resulting factor is `O(Z log Z)`, and the error remains exponentially small.

Together with the three bounded repairs found by `E306-PF-AUDIT-01` in the one-block base, these corrections give a closed proof.

## 2. Common arithmetic frame

Fix a squarefree integer `b>=3`, a finite forbidden set `T`, and a large scale `X`.  Put

```text
Z = X^3,
P = {p prime : X <= p < Z},
B = {q prime : Z/2 <= q < Z},
S_b = {r prime : r|b}.
```

Use

```text
E_pair = {pq : p,q in P, p<q},
E_b    = {rq : r in S_b, q in B},
E       = E_pair disjoint-union E_b,
L       = b * product_(p in P) p.
```

The complete-pair load tends to `(log 3)^2/2`, while the full-top auxiliary load is `O_b(1/log Z)`.  Hence the common Bernoulli parameter

```text
theta = 1/(b * sum_(e in E) 1/e)
```

stays in a fixed compact subinterval of `(0,1)`, and the total reciprocal load is below `1`.

Both the multiblock and one-anchor proofs use this exact finite Fourier selection mechanism.  They differ only in how the nonmajor frequencies are controlled.

## 3. The audited multiblock route

The audited paper-first route controls the prime-coordinate assignment by the chain

```text
one-block dispersion
 -> nondominant forcing
 -> zero-exception cold blocks
 -> energetic-block fingerprints
 -> adjacent-label penalties
 -> shell/hot/boundary/segment code
 -> global level-set theorem
 -> multiblock localization
 -> block-minor estimate.
```

It then controls the `b`-coordinate siblings with a separately chosen finite reservoir of size `G`.  Its terminal order is

```text
eta -> C -> G -> X.
```

The independent audit found the route correct after three local repairs:

- the cross-label lemma must assume the substantial class has at least sixteen vertices;
- the zero-energy case of nondominant forcing must be handled before dividing by the bad-pair cutoff;
- the cross-class sum must retain `(t-1)` and the factor `1/2` caused by ordered-class double counting.

Those repairs are incorporated in the present one-block theorem.

## 4. The one-anchor replacement

The new route retains only one complete prime block as a rigidity anchor: the top block `B`.

### 4.1 Top partition

The repaired one-block theorem gives a floor

```text
F_B >> Z/log^3 Z.
```

Below this floor every top assignment is exactly the residue assignment of one integer label `m`; above it fingerprint entropy makes the weighted top partition exponentially small.  The entire top partition has polynomial size

```text
sum_(top assignments a) exp(-c Q_B(a)) = O(Z log Z).
```

No neighbouring block is introduced.

### 4.2 Shift-uniform row decoding

For every lower prime coordinate `r in P\B`, all denominators `rq`, `q in B`, form a cyclic code in the row residue.  The maximum residue multiplicity is at most `Z/(2r)+1`, and the cyclic energy is uniformly

```text
D_r >> Z/log^3 Z.
```

For every fixed `r|b`, each nonzero row difference contributes at least `1/r^2` for every top prime, giving the stronger estimate

```text
D_r >>_b Z/log Z.
```

The sum of all nondecoder row products is therefore

```text
Delta <= Z^2 exp(-c Z/log^3 Z).
```

### 4.3 Retained skeleton

The row kernels use exactly the top-cross denominators.  All lower-lower complete-pair factors are retained at the decoded point.  This is essential: those unused factors later damp every coherent intermediate label.  The exact product inequality yields an accumulated error

```text
exp(Delta)-1,
```

which becomes

```text
O(Z log Z * Delta)
```

after summing the top partition.

### 4.4 Decoder identification

For coherent top label `m`, every prime coordinate in `P` decodes to `m mod r` throughout

```text
|m| <= M_dec = X Z/(log Z)^2.
```

For `|m|<=X^2/4`, every prime coordinate of `b` also decodes to `m`.  Since `b` is squarefree, prime-coordinate agreement is agreement modulo `b`; the decoded frequency is then the genuine integer frequency `m mod L`.

### 4.5 Adaptive damping

For

```text
X^2/4 < |m| <= M_dec,
```

the interval

```text
[2 sqrt(|m|), 3 sqrt(|m|)]
```

lies in `P\B` and contains `>>sqrt(|m|)/log|m|` primes.  Every distinct pair from this interval contributes a circle distance at least `1/9`, so

```text
Q_pair(m) >> |m|/(log|m|)^2.
```

This direct complete-pair damping replaces all propagation and global localization.

### 4.6 Full-top `b` family

Using every top prime in `E_b` converts the old sibling reservoir into a row code.  The `b` coordinates are decoded in the major and Gaussian ranges, and outside those ranges the complete-pair or top energy already suffices.  Consequently there is no sibling sector and no parameter `G`.

## 5. Exact comparison of discarded lemmas

The following multiblock results are not used:

| Multiblock result | One-anchor replacement | Hidden equivalent work? |
|---|---|---|
| all-block hot/cold decomposition | one top-block low/high partition | no; only one block is classified |
| adjacent-label penalty | rowwise shift-uniform code distance | no propagation remains |
| shell vector | absent | no |
| hot-block set | absent | no |
| cold-boundary set | absent | no |
| cold-segment labels | one top label | strictly fewer labels |
| global injective code | product-coordinate bijection plus retained skeleton | not equivalent; the coordinate product is exact from squarefreeness of `L` |
| global level-set theorem | top one-block entropy | no multiblock level set is counted |
| forcing-floor localization | top partition plus row decoding | different local mechanism |
| block-minor sector | five explicit sectors | the old block-minor is split by actual analytic cause |
| sibling-minor sector | full-top `b` row decoding | eliminated |
| parameter `eta` | absent | no high-floor budget remains at scale `1/sigma_E` |
| reservoir size `G` | absent | all top primes are used, with vanishing load |

Some genuine work is moved, but not concealed:

- the one-block forcing and fingerprint proof remains in full;
- the former global rigidity burden is replaced by the cyclic row-distance theorem and retained-skeleton inequality;
- the former sibling argument is replaced by the fixed-row code theorem for every prime divisor of `b`.

The replacement results are shorter, independent, and do not reconstruct the discarded chain under different names.

## 6. Five-sector Fourier exhaustion

After the top assignment is either labelled or noncoherent, every frequency belongs to exactly one of:

1. genuine major frequencies `|m|<=C/sigma_E`;
2. the full-variance Gaussian tail up to `X^2/4`;
3. adaptive complete-pair damping up to `M_dec`;
4. the coherent top-label tail above `M_dec`;
5. noncoherent top assignments and nondecoder fibres.

The coordinate map modulo the squarefree period `L` is a bijection, so there is no suppressed factor `b` and no residual sibling class.  This partition is disjoint and exhaustive.

## 7. Parameter comparison

All structural constants are fixed by `b`, the compact Bernoulli interval, and the repaired one-block theorem.  The only terminal choice is

```text
C -> X.
```

First choose `C` so that the Gaussian tail is below a fixed fraction of the positive major coefficient.  Then choose `X` above the finite maximum of the PNT, top forcing, row distance, decoder, adaptive interval, Taylor, avoidance, no-wrap, and strict-budget thresholds.  Sectors III–V and the fibre error then tend to zero absolutely, hence are `o(1/sigma_E)`.

## 8. Route classification

The one-anchor route proves the same headline theorem and does not strengthen the public endpoint.  It does, however, strictly reduce the proof DAG:

```text
multiblock propagation + global coding + localization + sibling reservoir
```

is replaced by

```text
one top block + independent row decoding + retained complete-pair skeleton.
```

The correct classification is therefore

```text
GENUINE STRICT SIMPLIFICATION.
```

This is a proof-development conclusion only.  Independent route audit remains required before manuscript adoption.