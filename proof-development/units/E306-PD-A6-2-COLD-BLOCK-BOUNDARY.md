# E306-PD-A6.2 — cold-block forcing and corrected boundary penalty

**Ledger correspondence:** manuscript P17–P18  
**State:** `COMPLETE-DRAFT`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**External analytic input:** only the construction-facing dyadic block-density hypothesis  
**Predecessor:** `E306-PD-A6.1` (`COMPLETE-DRAFT`)  
**Consumer:** the G5 level-set encoding and the G6 localization theorem

## 1. What this unit proves

Let \(P\) be a finite set of primes in \([X,2X]\), \(N=|P|\), and let
\[
 a=(a_p)_{p\in P},\qquad a_p\in\mathbf Z/p\mathbf Z.
\]
For \(p<q\), let \(H_{pq}\) be the centered CRT representative determined by
\((a_p,a_q)\), and put
\[
 Q_P(a)=\sum_{p<q}\left(\frac{H_{pq}}{pq}\right)^2,\qquad
 \sigma_P^2=\sum_{p<q}\frac1{(pq)^2}.
\]

This unit establishes the complete human route behind the following construction facts.

1. For every \(0<\rho\le 1/4\), sufficiently large low-energy blocks have a unique
   \(\rho\)-dominant integer label.
2. The exceptional primes outside the dominant residue class satisfy the exact bound
   \[
   |E|\le
   \frac{2^{15}RX^2}{(1-\rho)N^3}
   \quad\text{whenever }Q_P(a)\le R.
   \]
3. With the forcing floor \(R_w(c_2,k)=c_2\,2^k/\log^3(2^k)\), one may choose
   \(c_2>0\), an exception budget \(e_0>0\), and a common scale threshold so that
   every cold block is dominant, has at most \(e_0\) exceptions, and its label
   satisfies the quantitative size bounds needed by the adjacent-block theorem.
4. If consecutive cold blocks have different labels, their bipartite control energy
   is at least the exception-reduced boundary floor
   \[
   \Pi_k=
   \frac{(|P_{k+1}|-e_0-1)(|P_k|-e_0)^3}
        {2^{13}(2^k)^2}.
   \]

The active released theorem is the corrected, exception-aware theorem. The
unqualified sentence “distinct adjacent labels force a fixed penalty” is not a
valid theorem: the released source contains the explicit counterexample obtained
by taking the lower label to be the product of all lower-block primes and the
upper label to be \(0\); all represented residues then vanish although the labels
are different.

## 2. Dominant labels

For \(0<\rho\le1/4\), call \(m\in\mathbf Z\) a dominant label when
\[
 |m|\le X^2/2
\]
and
\[
 \#\{p\in P:a_p\equiv m\pmod p\}\ge(1-\rho)N.
\]

### Lemma 2.1 — uniqueness

Assume \(X\ge1\), \(N\ge4\), and two integers \(m,n\) are dominant. Their agreement
classes \(C_m,C_n\) satisfy
\[
 |C_m\cap C_n|\ge |C_m|+|C_n|-N\ge(1-2\rho)N\ge N/2.
\]
Hence the intersection contains two distinct primes \(p,q\). Thus \(pq\mid m-n\).
But
\[
 |m-n|\le |m|+|n|\le X^2,
\]
whereas distinct integers \(p,q\ge X\) have \(pq>X^2\). Therefore \(m=n\).

This is the mathematical content of
`SBEEForcing.dominant_label_unique`; `GlobalControl.coldLabel_eq` is the global
wrapper.

## 3. Nondominant forcing

### Theorem 3.1

For every \(0<\rho\le1/4\), there are constants \(c_2>0\) and \(X_0>0\) such that,
for every integer \(X\ge X_0\), every prime block \(P\subseteq[X,2X]\) satisfying
\[
 N\ge \frac{X}{2\log X},
\]
and every assignment \(a\),
\[
 Q_P(a)\le R,\qquad a\text{ not dominant}
 \quad\Longrightarrow\quad
 R\ge c_2\frac{X}{\log^3X}.
\]

This is the exact conclusion of
`SBEEForcing.theorem_B_nondominant_forcing`.

### Proof

Write \(Q_P(a)\le R\), and suppose that no dominant label exists. The proof is a
covering-and-dispersion argument.

#### Step 1: choose a base prime

Fix a threshold \(B>0\). If \(|H_{pq}|>B\), then \(pq\le4X^2\) gives
\[
 \left(\frac{H_{pq}}{pq}\right)^2>
 \frac{B^2}{16X^4}.
\]
Consequently the number of unordered high-representative pairs is at most
\[
 \frac{16RX^4}{B^2}.
\]
Double counting their endpoints shows that some base prime \(p_0\in P\) has at
most
\[
 \frac{32RX^4}{B^2N}
\]
neighbours \(q\) with \(|H_{p_0q}|>B\).

Choose
\[
 B=\sqrt{\frac{256R}{\rho}}\frac{X^2}{N},\qquad u=\frac BX.
\]
Then the exceptional high-\(H\) neighbours are at most \(\rho N/8\).
This is the route
`theoremB_pair_count` \(\to\) `theoremB_basepoint_sum`
\(\to\) `theoremB_basepoint`.

#### Step 2: cover most vertices by a short list of labels

For every remaining \(q\ne p_0\), define
\[
 \ell(q)=H_{p_0q}.
\]
The CRT congruence gives
\[
 a_q\equiv\ell(q)\pmod q,
\]
and \(|\ell(q)|\le B\). All these integers have the same residue modulo \(p_0\);
therefore the number of possible values is at most
\[
 \frac{2B}{X}+2=2u+2.
\]
Thus all but at most \(\rho N/8+1\) vertices lie in at most \(2u+2\) residue
classes. This is `theoremB_shortlist` together with
`theoremB_label_residue`.

#### Step 3: separate substantial and tiny classes

Partition the covered set by the values of \(\ell\). Call a class substantial
when its size is at least
\[
 s_0=32(u+1)+8.
\]
No class contains \((1-\rho)N\) vertices, for that would furnish a dominant
label once the scale inequalities ensure \(B\le X^2/4\).

There are two cases.

*Substantial-mass case.* After removing a largest substantial class, the other
substantial classes carry total mass at least \(\rho N/2\). For two distinct
labels \(n,n'\), the cross-label dispersion theorem gives
\[
 \sum_{p\in C_n}\sum_{q\in C_{n'}}
   \left(\frac{H_{pq}}{pq}\right)^2
 \ge c_E\frac{|C_n|^3|C_{n'}|}{X^2},
 \qquad c_E=\frac1{8192}.
\]
The cross energies of all ordered distinct class pairs sum to at most \(2Q_P(a)\).
If \(n_\ast\) is a largest class and
\(M_2=\sum_{n\ne n_\ast}|C_n|\), the power-mean inequality yields
\[
 \sum_{n}\sum_{n'\ne n}|C_n|^3|C_{n'}|
 \ge \frac{M_2^4}{L^2},
\]
where \(L\le2u+2\) is the number of substantial labels. Hence
\[
 \frac{c_E(\rho N/2)^4}{2X^2(2u+2)^2}\le R.
\]

*Tiny-mass case.* If the discarded tiny classes carry more than \(\rho N/4\)
vertices, their number and individual size give
\[
 \frac{\rho N}{4}<(2u+2)(32(u+1)+8).
\]

These alternatives are exactly the disjunction produced by
`theoremB_covering_dichotomy` and `theoremB_get_disjunction`.

#### Step 4: close the parameter chase

The density \(N\ge X/(2\log X)\) and the definition
\[
 u^2=\frac{256}{\rho}\frac{RX^2}{N^2}
\]
turn either alternative into a lower bound of order \(X/\log^3X\). More
precisely, the two verified algebraic closures give respectively
\[
 R\ge
 \frac{\rho^2\sqrt{c_E\rho}}{10^6}\frac{X}{\log^3X},
 \qquad
 R\ge
 \frac{\rho^2}{4718592}\frac{X}{\log^3X}.
\]
Take
\[
 c_2=\min\left(
 \frac{\rho^2\sqrt{c_E\rho}}{10^6},
 \frac{\rho^2}{4718592}\right).
\]
A single sufficiently large \(X_0\) simultaneously ensures \(B\le X^2/4\),
the required block cardinalities, and every inequality used in the two
closures. This proves the theorem.

The long rational rearrangements are finite/kernel-residual in
`theoremB_chase_left`, `theoremB_chase_right`, `theoremB_hAR`, and
`theoremB_hRle`; the conceptual implication and the exact constants are exposed
above.

## 4. Exceptional-prime charging

Let \(m\) be dominant, let
\[
 C=\{p:a_p\equiv m\pmod p\},\qquad E=P\setminus C,
\]
and assume
\[
 |m|\le \frac{NX}{16},\qquad Q_P(a)\le R,\qquad R\ge1,\qquad N\ge32.
\]

For each \(q\in E\), apply the single-fibre dispersion estimate to the class
\(C\) with
\[
 \delta=\frac{N}{128X}.
\]
At most half the primes of \(C\) have
\(|H_{pq}|\le\delta pq\). The remaining half contribute at least \(\delta^2\)
each, whence
\[
 \sum_{p\in C}\left(\frac{H_{pq}}{pq}\right)^2
 \ge \frac{(1-\rho)N^3}{2^{15}X^2}.
\]
The cross energies for distinct exceptional vertices are disjoint sub-sums of
the full energy. Therefore
\[
 |E|\frac{(1-\rho)N^3}{2^{15}X^2}
 \le Q_P(a)\le R,
\]
and
\[
 |E|\le
 \frac{2^{15}RX^2}{(1-\rho)N^3}.
\]

These are `exception_single_energy`, `exception_subsum_le_QP`, and
`exception_count_bound`.

For the global argument \(\rho=1/4\) and
\(N\ge X/(2\log X)\). Hence
\[
 |E|\le
 \frac{2^{20}}3\,R\frac{\log^3X}{X}.
\]
If the block is cold,
\(R<R_w(c_2,k)=c_2X/\log^3X\), so
\[
 |E|<\frac{2^{20}}3c_2.
\]
Thus any prescribed real budget \(e_0>0\) is attained by taking
\(c_2\le 3e_0/2^{20}\). Since the cardinality is an integer, a strict upper bound
below \(1\) even gives \(E=\varnothing\). The G6 refinement uses
\(c_2\le2^{-21}\) and proves this empty-exception conclusion in
`cold_no_exceptions_core`.

## 5. Quantitative label bounds

The dominant in-class pairs have centered representative exactly \(m\). Comparing
their reciprocal-square mass with \(\sigma_P^2\) gives
\[
 |m|\le \frac{5}{1-\rho}\frac{\sqrt R}{\sigma_P}.
\]
Also
\[
 \sigma_P\ge\frac{N}{8X^2}.
\]
At \(\rho=1/4\),
\[
 |m|\le \frac{160}{3}\frac{X^2\sqrt R}{N}.
\]
When \(R<R_w(c_2,k)\) and \(N\ge X/(2\log X)\), the right-hand side is
\(O(\sqrt{c_2}\,X^{3/2}\sqrt{\log X})\), whereas \(XN\gg X^2/\log X\).
Consequently, after one further scale threshold,
\[
 32|m|\le X(N-e_0),\qquad N-e_0\ge12.
\]
For the next block the same argument gives
\[
 32|m'|\le 2X\,|P_{k+1}|.
\]
These are precisely the hypotheses consumed by the exception-aware boundary
theorem. Their eventual validity is proved in the released
`boundary_penalty_per_k`/`cold_master` route. No asymptotic constant is chosen
after the block system: \(c_2,e_0\) are fixed first and the common bottom scale
is chosen last.

## 6. Cross-block phase bridge

Let \(p\in P_k\), \(q\in P_{k+1}\), and assume
\[
 a_p\equiv m\pmod p,\qquad a_q\equiv m'\pmod q.
\]
Put \(d=m'-m\), choose \(\bar p\) with \(p\bar p\equiv1\pmod q\), and let
\(H=H_{pq}\). Since \(H-m\) is divisible by \(p\), write \(H-m=up\). Reducing
modulo \(q\) gives
\[
 u\equiv d\bar p\pmod q.
\]
Thus
\[
 \left\|\frac{d\bar p}{q}\right\|
 =\left\|\frac{H-m}{pq}\right\|.
\]
The nearest-integer triangle inequality and the quantitative bound on \(m\)
compare this phase with \(|H|/(pq)\). Summing and absorbing the \(m\)-error gives
the per-\(q\) estimate
\[
 \sum_{p\in P_k\setminus E_k}
 \left(\frac{H_{pq}}{pq}\right)^2
 \ge
 \frac{|P_k\setminus E_k|^3}{2^{13}(2^k)^2},
\]
provided \(q\nmid d\), the reduced lower block has at least \(12\) primes, and
the label-size hypotheses above hold.

The exact normalized declarations are `crossblock_phase_bridge` and
`mismatch_per_q`; the dispersion input is `crossblock_dispersion`, whose constant
before phase-error absorption is \(2^{-11}\).

## 7. Boundary penalty

Let consecutive cold blocks have labels \(m\ne m'\) and exception sets
\(E_k,E_{k+1}\). At most one prime of
\(P_{k+1}\setminus E_{k+1}\) divides \(d=m'-m\): if two did, their product would
divide \(d\), while the label-size inequalities make that product larger than
\(|d|\).

Apply the per-\(q\) estimate to every remaining upper prime and sum:
\[
 \frac{(|P_{k+1}\setminus E_{k+1}|-1)
       |P_k\setminus E_k|^3}
      {2^{13}(2^k)^2}
 \le
 \sum_{p\in P_k,\ q\in P_{k+1}}
 \left(\frac{H_{pq}}{pq}\right)^2.
\]
If \(|E_k|,|E_{k+1}|\le e_0\), monotonicity gives
\[
 \Pi_k=
 \frac{(|P_{k+1}|-e_0-1)(|P_k|-e_0)^3}
      {2^{13}(2^k)^2}
 \le X_k(a),
\]
where \(X_k(a)\) is the bipartite control energy at the boundary.

This is `mismatch_penalty_with_exceptions`; its no-exception specialization is
the corrected `mismatch_penalty`.

## 8. Exact formal correspondence and trust classification

| Human component | Released declaration | Classification |
|---|---|---|
| dominant predicate | `SBEEForcing.IsDominant` | Lean-closed |
| dominant-label uniqueness | `SBEEForcing.dominant_label_unique` | human proof supplied |
| high-pair count/base point/short list | `theoremB_pair_count`, `theoremB_basepoint`, `theoremB_shortlist` | human mechanism supplied; finite counting Lean-closed |
| cross-label energy | `lemma_E_cross_label_energy` | human proof mechanism supplied; constant \(1/8192\) delegated |
| nondominant forcing | `theorem_B_nondominant_forcing` | human proof supplied; algebraic residual delegated |
| dominant label range | `theoremA_label_range`, `sigmaP_lower` | human implication supplied |
| exception energy/count | `exception_single_energy`, `exception_count_bound` | human proof supplied |
| cold block wrapper | `GlobalControl.cold_isDominant` | direct contrapositive |
| phase bridge | `GlobalControl.crossblock_phase_bridge` | human derivation supplied |
| per-upper-prime penalty | `GlobalControl.mismatch_per_q` | human implication supplied |
| corrected boundary theorem | `GlobalControl.mismatch_penalty` | exact hypotheses required |
| exception-aware boundary | `GlobalControl.mismatch_penalty_with_exceptions` | construction endpoint |
| common cold constants | `GlobalControlG5Assembly.cold_master` | constant/threshold assembly |
| no-exception G6 refinement | `GlobalControlG6.cold_no_exceptions_core` | Lean-closed finite threshold |

The old manuscript boundary sentence is a `TRANSLATION-FIDELITY` defect unless
replaced by the corrected theorem with its cardinality, label-size, and exception
hypotheses. The finite constant chases are `FINITE/KERNEL-RESIDUAL`; they are not
new mathematical assumptions.

## 9. Status conclusion

All conceptual implications required for P17–P18 are now explicit. The only
delegated pieces are named finite arithmetic/threshold closures in the immutable
Lean companion. There is no new-mathematics obstruction and no reason to return
this unit to `E306-RL`.

`E306-PD-A6.2` is `COMPLETE-DRAFT`.
