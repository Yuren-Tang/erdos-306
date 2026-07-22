# E306-PF-AUDIT-01 — independent paper-first proof audit report

**Role:** `Erdős 306 — Paper-First Independent Auditor` (`E306-PF-AUDIT-01`)  
**Frozen candidate:** `review/e306-paper-first-proof-audit-v1@5753219dd888b77b0ebe892a8ae7feabb0ca40ae`  
**Candidate files audited:** the five `proof-development/PAPER-FIRST-*` files named in research-workbench issue #53  
**Audit basis:** ordinary mathematics only; no correctness was imported from Lean, `v0.0.3`, `pushlinter`, earlier PDL dossiers, Curator material, REV3, or REV4.

## 1. Formal verdict

`[PASS-WITH-BOUNDED-REPAIRS E306-PF-AUDIT-01]`

The complete-pair route is mathematically viable and the headline theorem follows once three local proof defects in the frozen prose are repaired. None of the defects changes the denominator family, the local-to-global strategy, the Fourier decomposition, the parameter order, or the endpoint. No new external theorem, computation, or alternative route is required.

REV5 must not be launched from the frozen packet as it stands. It may be launched after the bounded repairs in Section 3 are made and checked.

## 2. Executive mathematical assessment

The following load-bearing parts recompute correctly.

1. For \(\mathcal P=\{p:X\le p<X^3\}\),
   \[
   \sum_{p\in\mathcal P}\frac1p=\log 3+o(1),\qquad
   \sum_{p\in\mathcal P}\frac1{p^2}=O((X\log X)^{-1}),
   \]
   whence
   \[
   \sum_{p<q\in\mathcal P}\frac1{pq}
   =\frac12\left(\left(\sum_p\frac1p\right)^2-\sum_p\frac1{p^2}\right)
   \longrightarrow \frac{(\log 3)^2}{2}=0.603474\ldots\in(1/3,1).
   \]
   Thus the common Bernoulli parameter \(\theta=(b\Lambda)^{-1}\) lies in a fixed compact subinterval of \((0,1)\), and the old selected-mass architecture is genuinely unnecessary.

2. The deterministic reciprocal-dispersion lemma is correct. The count of close residues uses at most two integers in each residue class inside an interval of length at most the modulus; for \(s\ge16\), fewer than \(s/2\) vertices can be close, yielding the stated \(cs^3/X^2\) lower bound.

3. The zero-exception cold-block conclusion is correct once the nondominance proposition is placed on a fully correct footing. Every exceptional vertex pays \(\gg N^3/X^2\) on a disjoint cross-edge set, so
   \[
   |E|\ll Q_P(a)X^2/N^3<c_w O(1).
   \]
   Choosing \(c_w\) below the reciprocal constant makes the integer cardinality strictly less than one.

4. The fingerprint argument is uniform in the energy parameter. In the lower range, choosing
   \(s\asymp(RX^2)^{1/4}\) makes the exceptional count \(t\ll RX^2/s^3\ll s\), and the logarithmic count is
   \(O((RX^2)^{1/4}\log X)=o(R)\) uniformly for \(R\ge c_wX/\log^3X\). In the upper range, the trivial entropy \(O(X)\) is \(o(R)\) because \(R\gg X^2/\log^4X\).

5. The global code is injective. The shell vector, hot set, cold-boundary set, complete hot-block assignments, and one integer label per maximal cold segment reconstruct every prime coordinate. Shells, hot assignments, trigger sets, and labels are separately counted; there is no missing layer. Hot and boundary charges may be reused only through a bounded multiplicative constant in the exponent, which Proposition 14 already allows.

6. Below the forcing floor, all blocks are cold and all adjacent labels agree. The common label is \(o(X^2)\), so every centred CRT lift equals that integer and
   \(Q(a)=m^2\sigma^2\). The high-floor Laplace tail beats the affine block entropy because \((2^n/n^3)/n\to\infty\); the remaining diagonal tail is a standard Gaussian sum of size \(O_c(\sigma^{-1}e^{-cC^2/2})\).

7. The full-pair inverse-square mass is comparable with the scaffold variance:
   \[
   \sum_{p<q}\frac1{p^2q^2}
   \le \frac12\left(\sum_p\frac1{p^2}\right)^2
   =O((nX)^{-2}),
   \]
   while the bottom internal block contributes \(\gg(nX)^{-2}\). The auxiliary square mass is \(O_{b,G}(X^{-6})\), so a comparison constant can be fixed before \(G\), with only the final scale threshold depending on \(G\).

8. The Taylor expansion is uniform. Since \(\sigma\gg(nX)^{-1}\), \(|m|\ll_C\sigma^{-1}\), and every denominator is at least \(X^2\),
   \[
   \max_e |m/e|=O_C(n/X),
   \qquad
   \sum_e|m/e|^3
   \ll_{b,C}\frac1{\sigma X^2}
   =O_{b,C}(n/X).
   \]
   The linear term cancels exactly from \(\theta\sum_e e^{-1}=1/b\), and a fixed small complex remainder gives a positive real Gaussian major contribution.

9. The minor partition is exact. A block assignment has exactly \(b\) lifts modulo \(L=bP\). In the sibling sector the squarefree hypothesis produces a prime \(r\mid b\) at which the frequency and its integer label differ. For every common reservoir prime \(s>2N\), coprimality \((r,s)=1\) implies \(r\nmid j\) in \(h=m+js\), and hence \(\|h/(rs)\|\ge1/(2r)\ge1/(2b)\). This gives \(G\) distinct damping factors and the visible bound \(b(2N+1)\beta_b^G\).

10. The order \(\eta\to C\to G\to n\) is non-circular. After multiplying the two minor estimates by \(\sigma\), the three strict budget inequalities leave the minor absolute sum below the real major sum. Fourier positivity gives a subset satisfying the congruence, and \(\Lambda<1\) converts it to exact equality. Avoidance, numerator induction, and the reductions for \(b=1,2\) then close the headline theorem.

## 3. Mandatory bounded repairs

### Repair R1 — correct the statement of Lemma 8

Lemma 8 invokes Lemma 7, whose hypothesis requires the first label class to have at least sixteen vertices. As stated, Lemma 8 assumes only
\(|C_m|\ge128B/X\), which can be smaller than sixteen; in that generality the displayed \(c_E|C_m|^3(|C_{m'}|-1)/X^2\) conclusion is not justified and can fail at very small class size.

Replace the size hypothesis by, for example,
\[
|C_m|\ge \max(16,128B/X),
\]
or state the lemma only for the substantial classes actually used later. Every application in Propositions 9 and 10 has a class much larger than sixteen, so this is a restriction of the lemma statement, not a route change.

### Repair R2 — handle the zero-energy case in Proposition 9

The proof sets \(B=A_\rho\sqrt R\,X^2/N\) and divides by \(B^2\). If \(R=0\), this expression cannot be used. Add a preliminary sentence: if \(Q_P(a)=0\), every internal centred lift is zero, hence all coordinates are the residue of the label \(0\), so the conclusion is immediate. Thereafter assume \(R>0\).

### Repair R3 — correct the cross-class summation in Proposition 9

After applying Lemma 8 to substantial classes of sizes \(n_1,\ldots,n_t\), summation over the other classes gives
\[
\sum_{j\ne i}(n_j-1)=(S-n_i)-(t-1),
\]
not \(S-n_i-O(1)\) with an absolute constant. Moreover, if ordered pairs of classes are summed, each undirected cross edge is counted twice; insert a harmless factor \(1/2\).

The correction closes with the constants already present. Since every substantial class has size at least
\(s_0=256(B/X+1)\),
\[
S-n_i\ge (t-1)s_0,
\]
so
\[
(S-n_i)-(t-1)\ge(1-1/s_0)(S-n_i)\ge\frac{255}{256}(S-n_i).
\]
Thus the same lower bound
\[
R\gg X^{-2}\sum_i n_i^3(S-n_i)
\]
follows after changing an absolute constant, and the subsequent largest-class/power-mean dichotomy and substitution remain unchanged.

These three repairs are local and exhaustive for the mathematical gate. The harmless phrase `X^2>max(T)` should also be replaced by “\(X^2\) exceeds every element of \(T\)” so that the empty forbidden set is covered without defining its maximum.

## 4. Theorem-by-theorem audit

### Theorem 1 and Lemmas 2–3 — headline reductions

**Verdict:** valid.

The lcm argument proves necessity. Avoidance makes numerator induction preserve distinctness. The identities \(1/2=1/3+1/6\) and \(1=1/2+1/3+1/6\), used with successive forbidden sets, reduce \(b=1,2\) to squarefree denominators at least three.

### Lemmas 5–6 — prime supply and reciprocal load

**Verdict:** valid.

Tail-uniform PNT gives simultaneous two-sided dyadic density. Abel summation over \([X,X^3)\) gives \(\log\log X^3-\log\log X=\log3\), and the blockwise square-reciprocal estimate is a convergent geometric tail of order \((X\log X)^{-1}\).

### Denominator family and Fourier inversion

**Verdict:** valid.

Unique factorization gives distinctness of pair and auxiliary denominators once block primes avoid the support of \(b\). Every denominator divides \(L\). The load interval makes \(0<\theta<1\), and character orthogonality gives the exact weighted subset count. The Fourier-energy majorant follows from the exact modulus identity and \(\sin(\pi x)\ge2x\) on \([0,1/2]\).

### Lemma 7 — block dispersion

**Verdict:** valid.

The close-residue count and the lower bound were independently recomputed. The constants are disposable, but the cubic dependence \(s^3/X^2\) is correct.

### Lemma 8 — cross-label energy

**Verdict:** false as globally stated; valid in every downstream application after Repair R1.

The omitted \(s\ge16\) condition is required by Lemma 7. No later argument needs the false small-class range.

### Proposition 9 — nondominant forcing

**Verdict:** proof gap in the frozen text; valid after Repairs R1–R3.

The bad-pair average, label-cover bound, small/substantial dichotomy, largest-class alternative, power-mean alternative, and final substitution all recompute. The only defects are the zero-energy division and the incorrect `O(1)` notation/double counting in the cross-class sum.

### Proposition 10 — exact cold labels

**Verdict:** valid once Proposition 9 is repaired.

The dominant label is quantitatively bounded by its internal clique energy. Each exception pays on a disjoint star into the dominant class, and the integer `<1` conclusion is sound.

### Lemma 11 and Proposition 12 — fingerprint entropy

**Verdict:** valid.

The difference of two candidate residues is detected by Lemma 7. The fingerprint size and exception count balance at the fourth root scale. Both energy ranges are covered, and the threshold is uniform in \(R\).

### Lemma 13 — adjacent-label penalty

**Verdict:** valid.

Cold-label bounds give \(|d|<4X^2\); at most one next-block prime divides \(d\). Dispersion over the lower block gives the claimed \(\gg2^{2k}/k^4\) penalty.

### Proposition 14 — global level sets

**Verdict:** valid.

The code is injective. Shells, hot-block assignments, hot/boundary triggers, initial label, and later segment labels are all counted. The use of trigger charges is bounded and disjoint at the edge-family level; any duplication between different exponent factors is absorbed into the displayed constant multiplying \(\delta R\).

### Lemma 15 and Proposition 16 — localization and CRT tail

**Verdict:** valid.

The forcing floor is eventually the bottom hot threshold. The diagonal identity is exact, the integer label is unique in the relevant window, the high-floor entropy is exponentially dominated, and the Gaussian tail has the correct \(1/\sigma\) scale.

### Variance comparison and major frequencies

**Verdict:** valid.

The complete-pair square mass and scaffold variance have the same order. The auxiliary term is negligible after \(G\) is fixed. The logarithm is uniform on the compact \(\theta\)-interval, the cubic remainder is \(O_{b,C}(n/X)\), and the real major sum is \(\gg1/\sigma_E\).

### Block-minor and sibling sectors

**Verdict:** valid.

The factor \(b\) is exact. The squarefree mismatch-prime step is correct. One common reservoir supplies all \(G\) factors for every sibling, and the count \(b(2N+1)\) is an admissible overcount with no missing frequency class.

### Terminal positivity and arithmetic closure

**Verdict:** valid.

The budgets close strictly in the stated order. The Fourier sum has positive real part, the no-wrap interval forces equality rather than only congruence, and the avoiding representation feeds the elementary reductions without collisions.

## 5. Stronger-result and simplification assessment

- The complete-pair denominator family is a **GENUINE STRICT SIMPLIFICATION** of the described selected-mass architecture. It does not strengthen the public headline theorem.
- Packaging the residue analysis as one local-to-global CRT theorem is an **EQUIVALENT REPARAMETERIZATION** at the level of mathematical content, though it is a better theorem hierarchy.
- Zero-exception cold blocks form a **VALID STRONGER INTERMEDIATE THEOREM** after the bounded repairs. They are not a stronger headline result.
- The common reservoir in place of frequency-dependent reservoirs is a **GENUINE STRICT SIMPLIFICATION**.
- The full-pair variance comparison is a **GENUINE STRICT SIMPLIFICATION** of any route requiring a separate large variance certificate.
- The probabilistic concentration description is only an **EQUIVALENT REPARAMETERIZATION** of the same characteristic-function work.
- Lemma 8 in its frozen unrestricted form is **FALSE**; the corrected version needed by the proof is valid.
- Proposition 9 in the frozen prose is **UNPROVED / GAP**; its stated conclusion follows after the three bounded repairs above.

## 6. Independence statement

No step of this verdict relies on an earlier machine-checked theorem or on a prior manuscript. The audit accepted the PNT as the sole external theorem and independently recomputed every load-bearing implication requested in issue #53.
