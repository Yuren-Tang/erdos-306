# E306-PD-A6.3 — global level sets, localization, and control partition

**Ledger correspondence:** manuscript P19–P23  
**State:** `COMPLETE-DRAFT`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Inputs:** `E306-PD-A6.1`, `E306-PD-A6.2`  
**External analytic input:** none beyond the dyadic block-system hypotheses

## 1. Statement of the global control theorem

Let `BS` be an admissible block system with blocks \(P_k\),
\(k_0\le k\le K\), and let \(\mathcal A(BS)\) be the finite product of the
residue spaces \(\mathbf Z/p\mathbf Z\) over all block primes. For
\(a\in\mathcal A(BS)\), write
\[
 Q_{\rm ctrl}(a)
   =\sum_{(p,q)\in\mathcal C}
      \left(\frac{H_{pq}(a)}{pq}\right)^2,
 \qquad
 \sigma_{\rm ctrl}^2
   =\sum_{(p,q)\in\mathcal C}\frac1{(pq)^2}.
\]

For \(C\ge1\), the main assignment set is
\[
 \mathfrak M(C)=
 \left\{a:\exists m\in\mathbf Z,\ |m|\le C/\sigma_{\rm ctrl},
   \ a_p\equiv m\pmod p\ \text{for every block prime }p\right\}.
\]

### Theorem 1.1 — global control partition

For every \(c>0\) and \(\eta>0\), there are a threshold \(k_\ast\) and a
constant \(C_{\rm tail}>0\) such that every admissible block system with
\(k_0\ge k_\ast\) and every \(C\ge1\) satisfy
\[
 \sum_{a\notin\mathfrak M(C)}e^{-cQ_{\rm ctrl}(a)}
 \le
 \frac{\eta+C_{\rm tail}e^{-cC^2/2}}
      {\sigma_{\rm ctrl}}.
\]

The exact released endpoint is
`GlobalControl.global_control_partition_final`.

## 2. The level-set encoding

Fix \(R\ge1\). The set
\[
 \mathcal L(R)=\{a:Q_{\rm ctrl}(a)\le R\}
\]
is encoded by four finite layers.

1. **Hot blocks.** A block is hot if its internal energy is at least
   \[
   R_w(c_2,k)=c_2\frac{2^k}{\log^3(2^k)}.
   \]
   Since the internal block energies form nonnegative sub-sums of
   \(Q_{\rm ctrl}\),
   \[
   \sum_{k\in H}R_w(c_2,k)\le R.
   \]

2. **Mismatch boundaries.** Consecutive cold blocks with different dominant
   labels form a boundary set \(B\). By the exception-aware result of A6.2,
   each boundary \(k\) costs at least
   \[
   \Pi_k=
   \frac{(|P_{k+1}|-e_0-1)(|P_k|-e_0)^3}
        {2^{13}(2^k)^2}.
   \]
   Bipartite energies are disjoint nonnegative sub-sums, hence
   \[
   \sum_{k\in B}\Pi_k\le R.
   \]

3. **Energy shells.** Record
   \[
   v_k=\lfloor Q_k(a)\rfloor.
   \]
   Then \(Q_k(a)<v_k+1\), and the total shell mass is controlled by \(R\).
   The number and weight of shell vectors are bounded by an exponential in
   \(R\) times an exponential in the number \(J=K+1-k_0\) of blocks.

4. **Cold-segment labels and exception data.** The hot blocks and mismatch
   boundaries divide the cold blocks into maximal segments. By A6.2, one
   dominant label propagates along each segment. The initial segment label
   lies in a window of length
   \[
   O\!\left(1+\frac{\sqrt R}{\sigma_{\rm ctrl}}\right);
   \]
   every later segment start is charged to the preceding hot block or
   mismatch boundary. Exceptional primes and their residues are paid for by
   the single-block exception entropy.

Once \((H,B,v,\ell)\) are fixed, the remaining assignment fibre has
exponentially small entropy relative to the energy charges. Summing the
fibres over the four layers gives the following exact form.

### Theorem 2.1 — global level-set estimate

For every \(0<\varepsilon<1\), there are \(A>0\) and \(k_\varepsilon\) such
that, for every admissible `BS` with \(k_0\ge k_\varepsilon\) and every
\(R\ge1\),
\[
 \#\mathcal L(R)
 \le
 e^{AJ}e^{8\varepsilon R}
 \left(1+\frac{\sqrt R}{\sigma_{\rm ctrl}}\right).
\]

This is `GlobalControlG5Assembly.global_levelset_final`.

### Why the factor \(e^{AJ}\) is necessary

The constant is uniform before the block system is chosen, but each block
carries bounded local encoding entropy. The correct global statement
therefore has a fixed base cost \(e^A\) per block, namely \(e^{AJ}\).
A formulation with an arbitrary constant chosen after `BS` is vacuous; a
formulation demanding one absolute constant independent of \(J\) is not the
proved route. The fixed \(A\) is harmless because the later forcing floor
grows exponentially in \(k_0\), whereas admissibility gives \(J=O(k_0)\).

### Exact combinatorial dependencies

The released assembly is:
\[
 \texttt{cold\_master}
 \longrightarrow
 \texttt{cover\_card\_le}
 \longrightarrow
 \texttt{hrhs\_charge\_bound}
 \longrightarrow
 \texttt{hrhs\_final}
 \longrightarrow
 \texttt{global\_levelset\_final}.
\]
The finite product identities, subset-charge sums, integer-window
cardinalities, and exponential rearrangements are kernel-residual; the
mathematical encoder and all charge sources are explicit above.

## 3. Localization below the forcing floor

Define the global floor
\[
 \mathcal F_0(BS)=
 \min\{R_w(c_2,k_0),\Pi_{k_0}\}.
\]
After increasing \(k_0\), monotonicity gives
\[
 R_w(c_2,k_0)\le R_w(c_2,k),\qquad
 R_w(c_2,k_0)\le\Pi_k
\]
for every relevant block and boundary.

Suppose \(a\notin\mathfrak M(C)\) and
\[
 Q_{\rm ctrl}(a)<\mathcal F_0(BS).
\]
No block can be hot and no boundary can have distinct cold labels. The G6
small-constant refinement of A6.2 removes all cold exceptions in this
low-energy regime. Hence every coordinate of \(a\) agrees with one common
integer label \(m\).

For each control pair, the scale inequality
\[
 2|m|<pq
\]
places \(m\) in the centered CRT interval, so
\[
 H_{pq}(a)=m.
\]
Therefore
\[
 Q_{\rm ctrl}(a)
 =m^2\sum_{(p,q)\in\mathcal C}\frac1{(pq)^2}
 =m^2\sigma_{\rm ctrl}^2.
\]
If \(|m|\le C/\sigma_{\rm ctrl}\), then \(a\in\mathfrak M(C)\), contrary to
assumption. Thus \(|m|>C/\sigma_{\rm ctrl}\).

We obtain the exact dichotomy
\[
 a\notin\mathfrak M(C)
 \Longrightarrow
 Q_{\rm ctrl}(a)\ge\mathcal F_0(BS)
 \quad\text{or}\quad
 a\in\mathfrak D(C),
\]
where \(\mathfrak D(C)\) is the diagonal sector with a common label
\(|m|>C/\sigma_{\rm ctrl}\) and exact energy
\(m^2\sigma_{\rm ctrl}^2\).

This is `GlobalControl.g6_localization`; the exact energy identity is
`diagonal_Qctrl`.

## 4. Laplace absorption above the floor

Choose an intermediate exponent \(c'\) with
\[
 8\varepsilon<c'<c.
\]
Partition the nonnegative energy axis into unit shells. The level-set estimate
implies a full Laplace bound of the form
\[
 \sum_a e^{-c'Q_{\rm ctrl}(a)}
 \le
 e^{AJ}K(c',\varepsilon)
 \left(1+\frac1{\sigma_{\rm ctrl}}\right),
\]
where \(K(c',\varepsilon)\) is independent of the block system.

On the sector \(Q_{\rm ctrl}\ge\mathcal F_0\),
\[
 e^{-cQ_{\rm ctrl}}
 \le
 e^{-(c-c')\mathcal F_0}e^{-c'Q_{\rm ctrl}}.
\]
Thus
\[
 \sum_{Q_{\rm ctrl}\ge\mathcal F_0}
 e^{-cQ_{\rm ctrl}}
 \le
 e^{-(c-c')\mathcal F_0}
 e^{AJ}K(c',\varepsilon)
 \left(1+\frac1{\sigma_{\rm ctrl}}\right).
\]

The bottom-block density and A6.1 give explicit exponential/polynomial
bounds for \(\mathcal F_0\), \(J\), and \(\sigma_{\rm ctrl}^{-1}\). The floor
grows faster than the affine entropy \(AJ\) and the logarithm of
\(\sigma_{\rm ctrl}^{-1}\). Hence, after one scale threshold depending on
\(c,\varepsilon,A,c_2,e_0,\eta\),
\[
 \sum_{Q_{\rm ctrl}\ge\mathcal F_0}
 e^{-cQ_{\rm ctrl}}
 \le\frac{\eta}{\sigma_{\rm ctrl}}.
\]

This is `GlobalControl.sectorI_absorption'`. The limit lemmas proving that the
exponential floors dominate the affine and polynomial factors are
finite/asymptotic support, not additional number-theoretic input.

## 5. The diagonal Gaussian tail

A diagonal assignment is determined by its integer label. Therefore
\[
 \sum_{a\in\mathfrak D(C)}e^{-cQ_{\rm ctrl}(a)}
 \le
 \sum_{|m|>C/\sigma_{\rm ctrl}}
 e^{-cm^2\sigma_{\rm ctrl}^2}.
\]
Split the exponent:
\[
 e^{-cm^2\sigma^2}
 =
 e^{-\frac c2m^2\sigma^2}
 e^{-\frac c2m^2\sigma^2}
 \le
 e^{-cC^2/2}
 e^{-\frac c2m^2\sigma^2}.
\]
The remaining integer Gaussian sum is \(O_c(1/\sigma)\), uniformly once
\(c\sigma^2/2\le1\). Consequently
\[
 \sum_{a\in\mathfrak D(C)}e^{-cQ_{\rm ctrl}(a)}
 \le
 \frac{C_{\rm tail}e^{-cC^2/2}}{\sigma_{\rm ctrl}}.
\]

The exact released constant may be taken as
\[
 C_{\rm tail}=1+\frac{6\sqrt2}{\sqrt c};
\]
the theorem is `sectorII_gaussian`.

## 6. Assembly

The localization dichotomy covers every off-main assignment by the floor
sector or the diagonal sector. Since the summands are nonnegative, adding the
last two estimates gives
\[
 \sum_{a\notin\mathfrak M(C)}e^{-cQ_{\rm ctrl}(a)}
 \le
 \frac{\eta}{\sigma_{\rm ctrl}}
 +
 \frac{C_{\rm tail}e^{-cC^2/2}}{\sigma_{\rm ctrl}},
\]
which is Theorem 1.1.

The quantifier order is:
\[
 c,\eta
 \ \longrightarrow\
 \varepsilon,c',A,c_2,e_0,C_{\rm tail}
 \ \longrightarrow\
 k_\ast
 \ \longrightarrow\
 BS,C.
\]
In particular, the entropy constant \(A\), tail constant, and target \(\eta\)
are fixed before the bottom scale. There is no circular choice.

## 7. Formal correspondence and trust classification

| Human node | Released declaration | Classification |
|---|---|---|
| hot/boundary/shell/segment data | `hotSet`, `boundarySet`, `shellVec`, `segStarts` | definitions |
| exception-reduced floor | `Pifloor` | exact corrected boundary input |
| four-level cover | `GlobalControlG5Data.cover_card_le` | finite combinatorics |
| charge assembly | `hrhs_charge_bound`, `hrhs_final` | finite/kernel-residual after explicit encoder |
| level-set theorem | `global_levelset_final` | conceptual proof supplied |
| floor and diagonal sector | `globalControlFloor`, `diagSector` | definitions |
| exact diagonal energy | `diagonal_Qctrl` | human proof supplied |
| localization | `g6_localization` | conceptual proof supplied |
| high-floor absorption | `sectorI_absorption'` | conceptual proof supplied; limit arithmetic delegated |
| Gaussian tail | `sectorII_gaussian` | human proof supplied |
| final partition | `global_control_partition_final` | direct nonnegative-sector assembly |

The stale header in `GlobalControl.lean` is a
`DOCUMENTATION-STATUS DEFECT`; the active released declarations above are
Lean-closed. No theorem status in this unit is inferred from that header.

## 8. Manuscript repair consequence

The mechanism paragraphs for P19–P23 must be replaced by, or explicitly
depend on, the theorem sequence above. In particular the manuscript must state:

- the fixed \(e^{AJ}\) level-set factor;
- the corrected boundary floor and exception hypotheses;
- the no-exception refinement used in localization;
- the exact diagonal energy identity;
- the choice of \(c'\in(8\varepsilon,c)\);
- the constant-first/scale-last absorption order.

These are load-bearing hypotheses and implications, not optional
expository detail.

`E306-PD-A6.3` is `COMPLETE-DRAFT`.
