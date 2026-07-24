# E306-PD-SAS-01 — sparse-anchor proof architecture

**Controlling proof:** `proof-development/SPARSE-ANCHOR-HUMAN-PROOF.md`  
**Frozen source:** `research/e306-frontier-v1@fed38b7d79b2b037ca1d3521a53b2c61c007867d`  
**Assurance state:** bounded `SAS-BR-1` repair incorporated; independent repair verification required.

## 1. Endpoint

For a positive rational `a/b` in lowest terms, a representation by distinct squarefree semiprime reciprocals exists exactly when `b` is squarefree. The proof reduces sufficiency to an avoiding representation of `1/b` for fixed squarefree `b>=3`.

## 2. Denominator family

Let

```text
Z=X^3,
P={p prime:X<=p<Z},
B={q prime:Z/2<=q<Z}.
```

Construct one deterministic actual-prime core

```text
S subset B,
|S| asymp_A (log Z)^3.
```

Use

```text
E_pair={pq:p,q in P,p<q},
E_b^S={rs:r|b prime,s in S},
E=E_pair disjoint-union E_b^S,
L=b product_(p in P)p.
```

The complete-pair load tends to `(log 3)^2/2`; the sparse `b` load is `O_b((log Z)^3/Z)`. The actual variance remains

```text
sigma_E^2 asymp_b 1/(X^2log^2X).
```

## 3. Sparse synchronization spine

```text
full-range population floor
  -> one common Bernoulli-sampled core S
  -> shift-uniform row distance D_r(S)>=AlogZ
  -> uniform row sibling factor delta<=Z^(-K_0)
  -> decoder-defect expansion by U
  -> positive-density exact-cold rigidity on G=R\U
     with repaired base-label range and centred-lift legality
  -> one-core-defect amplification through G
  -> low retained energy = complete integer diagonal
  -> high-energy and large-U suppression
  -> exact separation of U=emptyset from top-defect U!=emptyset
  -> top partition O(ZlogZ).
```

Here `R=B\S`. The dense witness theorem is deterministic and uses complete internal edges on `G`; fingerprint entropy is not invoked.

## 4. Exact factor ledger

The complete-pair factors are partitioned as follows.

```text
Top synchronization:
  S-R and R-R.

Lower prime row kernels:
  S-(P\B).

Target-denominator row kernels:
  S_b-S.

Retained skeleton:
  S-S,
  R-(P\B),
  (P\B)-(P\B).
```

Every denominator is assigned exactly once. Discarding a retained factor is permitted only inside an upper bound where its modulus is at most one; the decoded main term retains the entire skeleton.

## 5. Two necessary proof-development corrections

The research seed is valid only after two distinctions are made explicit.

First, a pair `(y,U)` with `T_U>=F_sync` is energetic even if its residues happen to admit a common label. It is bounded by

```text
Y_S exp(-kappa_bF_sync)(1+delta)^N,
```

not by the Gaussian diagonal formula.

Second, when `U!=emptyset`, coherence on `G` does not make the original top assignment globally coherent: the rows in `U` are actual nondecoder coordinates. Their total cold mass is

```text
O(ZlogZ)((1+delta)^N-1)=O(Z^2delta).
```

Only `U=emptyset` and `T_emptyset<F_sync` is the genuine global integer diagonal.

## 6. Robust exact-cold theorem and `SAS-BR-1`

For every fixed positive density `c_*`, if

```text
G subset {q prime:Z/2<=q<Z},
|G|>=c_*Z/logZ,
Q_G(a)<c_wZ/log^3Z,
```

then one integer `m` satisfies `a_r=m mod r` for every `r in G`, with

```text
|m|<=C_*sqrt(Q_G(a))/sigma_G.
```

The base-prime construction uses

```text
R_0=Q_G(a),
B_0=A_0sqrt(R_0)Z^2/|G|.
```

At the cold threshold,

```text
B_0/Z^2=O(1/sqrt(ZlogZ))=o(1).
```

The terminal arithmetic threshold is therefore enlarged so that, uniformly throughout the robust-cold argument,

```text
B_0<Z^2/16.
```

Every relevant base-prime and dominant label is restricted to `|m|<=B_0`. Before class energy or zero-exception is invoked, the proof records:

```text
same class p,q:
  |m|<pq/2, hence H_(pq)=m;

distinct base-prime labels m_i,m_j and target q!=p_0:
  p_0|(m_i-m_j) and 0<|m_i-m_j|<p_0q,
  hence m_i-m_j is nonzero modulo q;

two dominant labels sharing p,q:
  pq divides their difference and its absolute value is <pq,
  hence the labels coincide.
```

The proof also preserves all prior bounded repairs:

1. reciprocal dispersion is applied only with a source class of size at least sixteen;
2. the zero-energy case is separated before defining the cutoff proportional to `sqrt(Q_G)`;
3. the substantial-class sum is `(S-n_i)-(t-1)`, and ordered class pairs contribute a factor `1/2`.

## 7. Core-defect amplification

If the retained witness block has label `m` and one `s in S` has `y_s!=m mod s`, reciprocal dispersion over `G` gives

```text
sum_(r in G)||d r^(-1)/s||^2 >> Z/log^3Z.
```

The repaired exact-cold range first makes all retained witness lifts legal; the quantitative exact-cold label bound then makes the perturbation `m/(rs)` negligible in `l^2`. Thus one core defect already costs the synchronization floor.

## 8. Lower-coordinate compression

For fixed top assignment, every lower prime row and every prime divisor of `b` has a shift-uniform nearest decoder. The weighted retained-skeleton inequality yields error

```text
P_top(exp(Delta)-1),
P_top=O_b(ZlogZ),
Delta<=Zdelta+exp(-Omega_b(log^3Z)).
```

This factor is retained explicitly; it is not replaced by an unweighted row-error sum.

## 9. Decoder ranges

For coherent top label `m`, put

```text
M_dec=XZ/(log Z)^2.
```

Every prime coordinate in `P` decodes to `m` for `|m|<=M_dec`. Every prime coordinate of squarefree `b` decodes to `m` for `|m|<=X^2/4`. Hence the actual frequency is the integer `m mod L` throughout the major and full-variance Gaussian ranges.

The occurrence of `X^2/4` here is unrelated to the discarded robust-cold allowance `|m|<Z^2/4`. It is the fixed-`b` decoder and Sector II/III threshold. For large `X`,

```text
X^2/4<M_dec<Z^2/16,
```

and the quantitative cold-label bound `O(Z^(3/2)/(logZ)^(1/2))` is also below `Z^2/16`. Thus the repaired robust-cold range contains every later decoded range, while no later decoder or major/minor estimate uses the old `Z^2/4` label allowance.

## 10. Five exhaustive sectors

```text
I.   |m|<=C/sigma_E:
     direct actual-family major arc.

II.  C/sigma_E<|m|<=X^2/4:
     full-variance Gaussian tail.

III. X^2/4<|m|<=M_dec:
     adaptive complete-pair damping on
     [2sqrt(|m|),3sqrt(|m|)].

IV.  M_dec<|m| within the repaired cold-label range
     (in particular |m|<Z^2/16):
     sparse-top Gaussian tail.

V.   energetic top assignments, large defect sets,
     cold U!=emptyset top defects, and lower-row siblings.
```

The CRT coordinate map is bijective, and every denominator factor lies in the exact ledger above. Thus the sectors are exhaustive without a sibling multiplicity or omitted residual class.

## 11. Parameter order

All structural constants are fixed first:

```text
b and its compact Bernoulli interval,
robust-cold density and thresholds,
K_0,
sensor strength A=A(b,K_0),
sampling constants for S.
```

The only terminal order is

```text
C -> X.
```

Choose `C` to suppress Sector II, then choose `X` beyond every arithmetic, sampling, rigidity, Taylor, decoder, adaptive-interval, avoidance, and error threshold, including the uniform terminal inequality `B_0<Z^2/16` at the cold cutoff.

## 12. Theorem hierarchy and comparison

The sparse route removes the load-bearing fingerprint-entropy theorem and the full-top `b` family. It retains the deterministic dense exact-cold theorem on a positive-density witness block. The only enumeration of the sparse core is the elementary bound

```text
prod_(s in S)s<=exp(O((log Z)^4)),
```

which is directly dominated by the synchronization energy `Z/log^3Z`.

This is a cleaner theorem hierarchy, but not an established reduction in written proof length. Sparse sampling, defect expansion, amplification, and the top-defect sector replace the discarded fingerprint layer.