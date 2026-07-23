# E306-PF-REPAIR-VERIFY-01 — independent multiblock repair verification

**Role:** `Erdős 306 — Independent Multiblock Repair Verifier` (`E306-PF-REPAIR-VERIFY-01`)  
**Controlling issue:** `Yuren-Tang/research-workbench#59`  
**Frozen repaired candidate:** `review/e306-paper-first-repair-verification-v1@95a2ede1d40dae41a17fe26e4fe4b491bd94e947`  
**Repair base:** `proof-development/e306-rigour-v1@2817986c38a884c921dca1a5be256d28b0865769`  
**Controlling prior audit:** `review/e306-paper-first-proof-audit-v1@3d1451faf66830bbf38e16047b78dd08d7efa803`  
**Verification type:** bounded ordinary-mathematics repair verification; not a new full-route audit, route comparison, manuscript rewrite, Lean check, or research extension.

## 1. Exact return

`[PASS E306-PF-REPAIR-VERIFY-01]`

The three mathematical defects and the empty-forbidden-set ambiguity identified by the controlling prior audit have been repaired correctly. The repaired constants preserve the positive nondominance forcing floor, and the dependent zero-exception, fingerprint, global level-set, localization, minor-sector, and terminal implications remain closed. The ledger and manuscript handoff describe the repaired state and assurance boundary accurately.

## 2. Scope and change boundary

The comparison from the exact repair base to the frozen candidate is three commits ahead and changes only:

- `proof-development/PAPER-FIRST-HUMAN-PROOF.md`;
- `proof-development/PAPER-FIRST-DEPENDENCY-AND-PARAMETER-LEDGER.md`;
- `proof-development/PAPER-FIRST-MANUSCRIPT-HANDOFF.md`.

The mathematical verification below is confined to the repairs named in issue #59 and to their stated downstream dependency cone. No correctness is imported from Lean, `v0.0.3`, an earlier manuscript, a Curator corpus, a multiblock release claim, or the proof-development owner's self-assessment.

This verifier writes only the two required files under `review/**`.

## 3. Repair R1 — Lemma 8 range

### Repaired statement

Lemma 8 now assumes

\[
 |C_m|\ge \max\{16,128B/X\},\qquad |C_{m'}|\ge2,
 \qquad B<X^2/4.
\]

This is the correct range for its invocation of Lemma 7, whose dispersion conclusion requires a source set of at least sixteen vertices.

### Direct recomputation

For a target prime `q` not dividing `d=m'-m`, Lemma 7 with

\[
 \delta=|C_m|/(64X)
\]

gives at least `|C_m|/2` source primes for which

\[
 \|d\bar p/q\|>\delta.
\]

The repaired second size condition gives

\[
 \frac{|m|}{pq}\le \frac B{X^2}
 \le \frac{|C_m|}{128X}=\frac\delta2.
\]

Consequently those source primes satisfy

\[
 \frac{|H_{pq}|}{pq}\ge \frac\delta2,
\]

and the energy for this target prime is at least

\[
 \frac{|C_m|}{2}\left(\frac{|C_m|}{128X}\right)^2
 \gg \frac{|C_m|^3}{X^2}.
\]

At most one target prime divides the nonzero integer `m'-m`; summing over the remaining targets gives the stated factor `|C_{m'}|-1`. Thus the repaired Lemma 8 is valid.

### Applications

In Proposition 9 every substantial class has size

\[
 n_i\ge s_0=256(B/X+1).
\]

Hence

\[
 n_i\ge256\ge16,
 \qquad n_i\ge256B/X\ge128B/X,
\]

and every ordered substantial-class application lies inside the repaired range. Proposition 10, Lemma 11, and Lemma 13 either use Lemma 7 directly with a source set already much larger than sixteen or repeat the same fixed-target argument under an explicitly verified source-size bound. No downstream use requires the deleted small-class range.

**Finding:** repair correct and complete.

## 4. Repair R2 — the `R=0` branch in Proposition 9

The proof now treats `R=0` before defining

\[
 B=A_\rho\sqrt R\,X^2/N
\]

or dividing by `B^2`.

If `Q_P(a)=0`, every nonnegative internal energy summand is zero, so every centred lift `H_{pq}` is zero. For sufficiently large `X`, the block contains at least two primes. Given any coordinate prime `p`, choose `q\ne p`; the congruences for `H_{pq}=0` imply `a_p\equiv0\pmod p`. Hence all coordinates have common label `0`, which is dominant. This contradicts the nondominance hypothesis.

The remaining nondominant argument therefore has `R>0`, so `B>0` and all later occurrences of `B^2` in denominators are legitimate.

**Finding:** repair correct and occurs at the necessary logical point.

## 5. Repair R3 — substantial-class sum and ordered-pair factor

Let the substantial class sizes be `n_1,\ldots,n_t`, and let

\[
 S=\sum_i n_i.
\]

Applying Lemma 8 to every ordered pair of distinct classes gives the ordered sum

\[
 \sum_i n_i^3\sum_{j\ne i}(n_j-1).
\]

Each undirected cross-class edge occurs in both orientations, so the proof correctly divides by two. Moreover,

\[
 \sum_{j\ne i}(n_j-1)
 =(S-n_i)-(t-1)
\]

exactly. Thus

\[
 R\ge \frac{c_E}{2X^2}
 \sum_i n_i^3\bigl((S-n_i)-(t-1)\bigr).
\]

The substantial threshold absorbs the nonconstant subtraction without circularity. For every `i`,

\[
 S-n_i=\sum_{j\ne i}n_j\ge(t-1)s_0,
\]

and `s_0\ge256`; therefore

\[
 (S-n_i)-(t-1)
 \ge \left(1-\frac1{s_0}\right)(S-n_i)
 \ge \frac{255}{256}(S-n_i).
\]

After changing only an absolute positive constant,

\[
 R\gg X^{-2}\sum_i n_i^3(S-n_i).
\]

No bound on `t` is inserted, and `s_0` was fixed before this summation from `B/X`; there is no dependence of `s_0` on the number of classes or on the conclusion being proved.

**Finding:** exact sum, factor `1/2`, and absorption are all correct.

## 6. Reclosure of the forcing bound

The repaired substantial-class inequality leaves the original two alternatives intact.

If the largest substantial class has size at least `S/2`, the nondominance and mass bounds give a fixed positive proportion outside it. Its single term is therefore

\[
 \gg S^3(S-n_{\max})/X^2\gg_\rho S^4/X^2.
\]

If every class has size below `S/2`, then `S-n_i\ge S/2` and power mean gives

\[
 \sum_i n_i^3\ge S^3/t^2\ge S^3/M^2.
\]

In both alternatives,

\[
 R\gg_\rho \frac{N^4}{M^2X^2},
 \qquad M\le2B/X+2.
\]

When `B/X<1`, `M=O(1)` and this lower bound is

\[
 \gg N^4/X^2\gg X^2/\log^4X,
\]

which is eventually larger than `X/\log^3X`.

When `B/X\ge1`,

\[
 M^2\ll_\rho B^2/X^2
 \asymp_\rho RX^2/N^2.
\]

Substitution yields

\[
 R^2\gg_\rho N^6/X^4,
 \qquad
 R\gg_\rho N^3/X^2
 \gg_\rho X/\log^3X.
\]

The small-class alternative independently gives the same lower scale. Hence a positive fixed `c_w` may still be chosen so that

\[
 Q_P(a)<c_wX/\log^3X
\]

forces a unique dominant label. The ordered-pair factor and the `255/256` loss alter only an absolute constant; they do not change the forcing scale.

**Finding:** Proposition 9 closes with a positive forcing constant.

## 7. Downstream dependency verification

### 7.1 Zero-exception cold blocks

Proposition 10 uses the repaired Proposition 9 only to obtain a dominant class. Its label-energy estimate is unchanged. Each exceptional coordinate pays

\[
 \gg |C|^3/X^2\gg N^3/X^2
\]

on a disjoint star of cross edges. Therefore

\[
 |E|\ll Q_P(a)X^2/N^3<C_\rho c_w.
\]

Decreasing the already positive `c_w` makes the right side strictly below one. Since `|E|` is an integer, `E` is empty. No exception budget is reintroduced.

### 7.2 Fingerprint entropy

Lemma 11 uses Lemma 7 directly with `s\ge16`. Proposition 12 chooses

\[
 s=\lceil A(RX^2)^{1/4}\rceil.
\]

At the repaired positive floor `R\ge c_wX/\log^3X`, this is eventually at least sixteen; its upper-range condition still gives `s\le N/2`. The exceptional count

\[
 t\ll RX^2/s^3\ll s
\]

and logarithmic count

\[
 O((RX^2)^{1/4}\log X)=o(R)
\]

remain uniform. The high-energy trivial range is unchanged.

### 7.3 Global level sets and localization

The hot threshold remains

\[
 w_k=c_w2^k/k^3>0.
\]

Cold blocks have exact labels by Proposition 10; hot blocks retain the fingerprint count; differing adjacent cold labels retain the Lemma 13 charge. Thus the injective code in Proposition 14 still records and bounds shells, hot blocks, boundaries, complete hot assignments, and one label per maximal cold segment.

The localization floor

\[
 \mathcal F_0=\min(w_n,\min_k\Pi_k)
\]

is still eventually `w_n\gg X/n^3`, since the adjacent-label penalties are of larger order. Below this floor all blocks are cold, all adjacent labels agree, and

\[
 Q(a)=m^2\sigma^2.
\]

The high-floor Laplace tail still defeats the affine block entropy because

\[
 (2^n/n^3)/n=2^n/n^4\to\infty.
\]

The Gaussian diagonal tail and its `1/\sigma` scale are unchanged.

### 7.4 Minor sectors

The repaired nodes do not alter the exact fibre count `b`, the block-minor estimate, the sibling partition, the squarefree mismatch prime, or the common `G`-prime reservoir. The two minor bounds remain

\[
 \sum_{S_{\rm blk}}|F(h)|
 \le \frac{b(\eta+K_{c_b}e^{-c_bC^2/2})}{\sigma},
\]

and

\[
 \sum_{S_{\rm sib}}|F(h)|
 \le b(2N+1)\beta_b^G.
\]

### 7.5 Terminal implication

The parameter order remains

\[
 \eta\longrightarrow C\longrightarrow G\longrightarrow n.
\]

The three strict budgets are unchanged. After multiplication by `\sigma`, the total minor absolute sum remains strictly below the positive real major sum. Fourier positivity, no-wrap, exact reciprocal equality, avoidance, numerator induction, and the `b=1,2` reductions therefore remain closed.

**Finding:** every downstream node named in issue #59 remains valid after the repaired constant losses.

## 8. Empty forbidden set

The human proof now requires `X^2` to exceed every element of `T` and explicitly states that this condition is vacuous when `T` is empty. The ledger uses the same formulation. No `max(T)` is taken for an empty set.

**Finding:** ambiguity removed correctly.

## 9. Route and parameter integrity

The candidate comparison introduces no change to:

- the headline theorem or avoiding formulation;
- the complete-pair denominator family;
- the auxiliary denominator family or common reservoir;
- the multiblock scaffold;
- the Fourier major/minor partition;
- the exact fibre count;
- the squarefree sibling argument;
- the variance comparison;
- the terminal parameter order.

The repairs restrict a false lemma statement to its proved range, add a missing zero case, correct a finite class sum and its multiplicity, and synchronize status prose. No new theorem, denominator family, route, or external premise is introduced.

## 10. Ledger and manuscript handoff

The dependency ledger identifies the repaired Lemma 8 range, the separated `R=0` branch, the exact ordered-pair sum, and the retained `X/\log^3X` forcing conclusion. It marks the packet as awaiting bounded verification rather than claiming manuscript clearance in advance.

The manuscript handoff likewise names the repair verification as its immediate consumer, postpones a fresh manuscript worker until this verification passes, states that the repair is local, and expressly denies independent-review, formalization, release, arXiv, journal, or submission authority. Its consumer tests retain the full proof obligations rather than replacing them with a verifier slogan.

**Finding:** both synchronization documents are accurate and do not overstate assurance.

## 11. Final classification

All required bounded checks pass. No further proof-development repair is required within issue #59's scope. This verdict clears the mathematical repair gate only; it does not itself write, approve, release, or authorize submission of a manuscript.

`[PASS E306-PF-REPAIR-VERIFY-01]`
