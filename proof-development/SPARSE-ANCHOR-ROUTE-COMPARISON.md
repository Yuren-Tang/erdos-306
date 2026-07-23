# E306-PD-SAS-01 — sparse-anchor route comparison

**Role:** `Erdős 306 — Sparse-Anchor Proof Development Worker` (`E306-PD-SAS-01`)  
**Exact base:** `research/e306-frontier-v1@fed38b7d79b2b037ca1d3521a53b2c61c007867d`  
**Classification:** `VALID STRUCTURAL SIMPLIFICATION; NOT A PROVED LENGTH SIMPLIFICATION`  
**Assurance:** ready only for an independent sparse-route audit.

## 1. Question

The bounded task was to decide whether sparse arithmetic synchronization can replace the dense top-block fingerprint partition in the one-anchor proof, without hiding the same entropy argument in core enumeration, robust cold rigidity, or defect bookkeeping.

The route closes after two explicit repairs:

1. high retained energy is bounded as an energetic sector even when the residue pattern happens to admit a label;
2. cold terms with `U!=emptyset` are top-row defect terms, not genuine global diagonal frequencies.

Both repairs are paid for by the existing `delta^|U|` expansion and do not reintroduce fingerprint entropy.

## 2. Common arithmetic endpoint

The dense and sparse one-anchor routes prove the same theorem and use the same complete-pair backbone:

```text
E_pair={pq:p,q in P,p<q},
P={p prime:X<=p<X^3}.
```

They also use the same finite Fourier selection, direct major arc, full-variance Gaussian tail, adaptive complete-pair damping, no-wrap argument, avoidance, and numerator induction.

The sparse route changes two auxiliary pieces:

```text
dense top anchor B
  -> sparse core S plus dense retained witness R=B\S;

full b-sensitive family {rq:r|b,q in B}
  -> sparse family {rs:r|b,s in S}.
```

The headline theorem is not strengthened.

## 3. Dense one-anchor synchronization

The dense packet uses

```text
complete internal top energy
 -> exact-cold theorem below F_B
 -> fingerprint rigidity
 -> fingerprint entropy above F_B
 -> weighted top partition O(ZlogZ).
```

After that it decodes every lower prime and every prime divisor of `b` against the whole top block.

Its genuinely load-bearing entropy statement is a uniform level-set estimate of the form

```text
#{a:Q_B(a)<=R}<=exp(epsilon R).
```

That theorem suppresses the exponentially many energetic top assignments.

## 4. Sparse replacement

The sparse route uses

```text
population energy on all rows
 -> one common random actual-prime core S
 -> row distance D_r(S)>=AlogZ
 -> decoder-defect expansion
 -> robust exact-cold rigidity on G=R\U
 -> amplification of any core mismatch through G
 -> trivial core enumeration dominated by F_sync.
```

The high-energy top sum is bounded by

```text
exp(O((log Z)^4))
 *exp(-Omega(Z/log^3Z))
 *(1+delta)^N,
```

and not by a fingerprint level-set theorem.

## 5. Is fingerprint entropy genuinely absent?

Yes, in the precise load-bearing sense.

### 5.1 Core enumeration is not fingerprint entropy

The only global count is

```text
Y_S=prod_(s in S)s<=exp(O((log Z)^4)).
```

It counts every core assignment indiscriminately. It has no energy dependence, no injective fingerprint, and no level-set theorem. It is harmless because

```text
(log Z)^4=o(Z/log^3Z).
```

### 5.2 Robust exact-cold rigidity is not fingerprint entropy

The retained witness theorem proves only a low-energy structural statement:

```text
Q_G<c_wZ/log^3Z
 -> one exact integer label.
```

Its proof uses reciprocal dispersion, a repaired nondominant forcing argument, and elimination of the final exceptional coordinates. It does not enumerate energetic assignments.

### 5.3 Defect expansion is not hidden independence

The factor `delta^|U|` comes from summing star-row sibling weights after all internal factors incident to `U` are discarded as quantities at most one. No internal factor is factorized, and no illegal probabilistic independence is used.

Therefore fingerprint entropy is genuinely no longer load-bearing.

## 6. What dense work remains?

One dense local theorem survives:

```text
positive-density exact-cold rigidity on G subset B.
```

It still uses the complete internal graph on `G`, and its proof contains the same repaired nondominant-forcing core as the dense one-anchor packet. The sparse route does not turn the whole top block into a sparse graph; it sparsifies the sensor interface while retaining dense witness edges already present in the natural complete-pair family.

Thus the route is not “sparse” in every combinatorial sense. Its synchronization interface is sparse; its cold witness remains dense.

## 7. Exact theorem replacement table

| Dense one-anchor component | Sparse-anchor replacement | Status |
|---|---|---|
| full-top population distance | same population lemma, then Bernoulli sampling | proved |
| full-top row sensors | one common core `S` of size `Theta(log^3Z)` | proved |
| exact-cold theorem on `B` | robust exact-cold theorem on every positive-density `G` | reproved |
| fingerprint rigidity | absent | removed |
| fingerprint entropy | core-defect amplification plus energy floor | removed |
| energetic top level-set sum | trivial `Y_S` count times `e^{-F_sync}` | proved |
| full-top `b` family | sparse `S_b-S` rows | proved |
| dense top partition | defect expansion and exact `U=emptyset` diagonal | proved |
| row compression error | weighted by `P_top(exp(Delta)-1)` | retained |
| adaptive damping | unchanged complete-pair skeleton | retained |

## 8. New proof burdens

The sparse route adds four nontrivial modules:

1. a uniform population floor through both `r<Z/2` and `r>=Z/2`;
2. simultaneous concentration for one deterministic actual-prime core;
3. decoder-defect cluster expansion with a separate `U!=emptyset` top-error sector;
4. core-defect amplification using the exact-cold label-size bound.

It also requires a two-sided size estimate `|S|asymp(log Z)^3`, not merely an upper bound, so that the fixed `r|b` row tails are superpolynomially small.

## 9. Is the route more concise?

There are two different answers.

### Theorem hierarchy

Yes. The hierarchy is cleaner:

```text
low energy -> exact label,
high energy -> direct exponential suppression,
```

with no fingerprint theorem between them. The target-denominator observability also uses the same core and introduces no reservoir parameter.

### Standalone written proof

Not demonstrably. The sparse packet must prove the sampling theorem, robust subset version, defect expansion, amplification, and top-defect correction. Those modules replace a substantial but already available fingerprint argument. The total ordinary-proof length is comparable and may be slightly greater.

The honest classification is therefore

```text
VALID STRUCTURAL SIMPLIFICATION;
FINGERPRINT ENTROPY GENUINELY REMOVED;
NO CLAIM OF STRICT PROOF-LENGTH REDUCTION.
```

## 10. Relation to the multiblock fallback

The sparse route, like the dense one-anchor route, remains a strict structural simplification of the repaired multiblock architecture: it uses no block chain, adjacent-label propagation, shell code, global multiblock level set, localization parameter `eta`, or finite sibling reservoir `G`.

This comparison does not transfer assurance. The repaired multiblock proof and the dense one-anchor packet are providers of local lemmas only; the present packet requires its own independent ordinary-mathematics audit.
