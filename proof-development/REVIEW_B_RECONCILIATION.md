# Erdős 306 — Review B reconciliation and manuscript-revision packet

**Role:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Status:** `READY-FOR-MANUSCRIPT-REVISION`  
**PDL predecessor:** `proof-development/e306-rigour-v1@a39a19731ba76c85aac4791d2763bc9f2984fa2d`  
**Independent Review B:** `review/e306-p1-construction-v1@0b9c79d8727152d5e2511b39a48bbea0d437487e`  
**Immutable formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Fixed manuscript candidate:** `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
**Secondary read-only decomposition source:** `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`

## 1. Meaning of this checkpoint

Review B classified the fixed manuscript candidate as
`BOUNDED MATHEMATICAL REVISION REQUIRED`, while finding no
`MATERIAL-MATHEMATICAL-GAP`, indispensable unrecorded theorem, circular
parameter choice, or material discrepancy with the released headline theorem.

The present packet reconciles every Review B item against the PDL proof units,
adds the missing translation-fidelity details, and gives one bounded source for
the next manuscript worker. `READY-FOR-MANUSCRIPT-REVISION` means:

1. the mathematics needed to repair the candidate is available in a coherent,
   dependency-respecting human-proof package;
2. every retained kernel residual has an exact released declaration and an
   exposed mathematical implication;
3. the manuscript candidate itself has **not** yet been revised and must not be
   described as review-passed until the revision is made and checked;
4. no proof status, analytic premise, or authority is transferred from the
   secondary refactor.

No `paper/`, `lean/`, release, workflow, tag, DOI, review-branch, or other-role
surface is modified by this packet.

## 2. Exact control system and centred CRT convention

This section closes Review B item `RB-01` and supplements
`E306-PD-A6.1`.

Let `BS` have indices `k0 <= k <= K` and finite prime blocks

\[
 P_k\subseteq[2^k,2^{k+1}).
\]

The half-open windows are disjoint. The finite block support is

\[
 \mathcal P=\bigcup_{k=k_0}^{K}P_k,
\]

and a global assignment is a residue vector

\[
 a=(a_p)_{p\in\mathcal P},\qquad a_p\in\mathbf Z/p\mathbf Z.
\]

The control graph is exactly

\[
 \mathcal C=
 \bigcup_{k=k_0}^{K}\{(p,q):p,q\in P_k,\ p<q\}
 \;\cup\;
 \bigcup_{k=k_0}^{K-1}(P_k\times P_{k+1}).
\]

For distinct primes `p,q`, let `H_{pq}(a)` be the unique integer satisfying

\[
 H_{pq}(a)\equiv a_p\pmod p,
 \qquad
 H_{pq}(a)\equiv a_q\pmod q,
 \qquad
 -\frac{pq}{2}<H_{pq}(a)\le\frac{pq}{2}.
\]

It is obtained from the ordinary CRT representative in `[0,pq)` by subtracting
`pq` precisely when that representative exceeds `pq/2`. Thus centring changes
neither residue, and

\[
 |H_{pq}(a)|\le pq/2.
\]

Define

\[
 Q_{\rm ctrl}(a)=
 \sum_{(p,q)\in\mathcal C}
 \left(\frac{H_{pq}(a)}{pq}\right)^2,
 \qquad
 \sigma_{\rm ctrl}^2=
 \sum_{(p,q)\in\mathcal C}\frac1{(pq)^2}.
\]

The internal and adjacent-bipartite pieces are disjoint as indexed pairs:
internal pairs lie in one block, whereas a bipartite pair has endpoints in two
successive disjoint blocks. This gives the exact energy decomposition used in
the single-block and boundary arguments.

The product map is injective on every strictly ordered distinct-prime pair
pool. Indeed, if `pq=p'q'` with all four entries prime and `p<q`, `p'<q'`,
unique factorisation gives `{p,q}={p',q'}`, and the ordering gives equality of
the ordered pairs. A gadget product `rs`, with `r|b` and `s` a block prime,
cannot equal a two-block-prime product because block primes are chosen outside
the prime support of `b`.

Exact released locators are `BlockSystem`, `internalPairs`, `bipartitePairs`,
`ctrlPairs`, `blockSupport`, `GlobalAssignment`, `crtRepr`, `Hglob`, `Qctrl`,
`sigmaCtrl`, and `energy_splits`.

## 3. Label-uniform cold fibres: non-wrapped and wrapped large labels

This section closes the wrapped/large-label part of `RB-03` and `RB-05`,
supplementing `E306-PD-A6.2` and `E306-PD-A6.3`.

The cold-block theorem first gives, at the fixed forcing constant, a unique
small dominant representative `M`: at least three quarters of the block primes
carry residue `M`, and `M` lies in the quantitative label range proved in
A6.2. The level-set decoder, however, must count a fibre uniformly in the
label recorded by the segment data, including labels outside the small range.
There are two cases.

### 3.1 Non-wrapped large label

Suppose the recorded integer label lies in the ordinary centred interval and
is larger than the cold label range. If the corresponding fibre were nonempty,
the cold assignment would itself exhibit that label on the required dominant
class. The single-block label-range theorem would then place it inside the
small range, a contradiction. Hence the non-wrapped huge-label fibre is empty.
This is the implication implemented by `cold_count_nonwrap` from
`theoremA_label_range` and `cold_label_size64`.

### 3.2 Wrapped large label

A large recorded integer may represent the same residues as a small dominant
integer after modular wrapping. Cold dominance extracts the small
representative `M` and a large agreement class. Two distinct primes from that
class rigidify the integer lift: if two admissible small representatives agree
modulo both primes, their difference is divisible by the product of the two
primes but is smaller in absolute value than that product, so they are equal.
This is `two_prime_label_eq` and `cold_small_label_agree`.

For every assignment in the wrapped-label fibre, retain the assignment and
reinterpret its dominant class using `M`. This is an injection into the fixed
small-label fibre: equality after the map is equality of the underlying global
assignments. The ordinary cold-fibre estimate therefore bounds the wrapped
fibre, with the doubled epsilon budget used by the charge assembly. The exact
released route is

```text
wrapped_count_le_small_fixed_label
  -> cold_count_wrap
  -> cold_count_large
  -> fiber_card_exp_bound'
  -> hrhs_charge_bound
  -> hrhs_final
  -> global_levelset_final.
```

`ColdDominance c2` supplies the small representative uniformly and is discharged
inside `cold_master` from `theorem_B_nondominant_forcing`. Thus no unrecorded
wrap hypothesis and no extra analytic input occurs. The long finite bounds in
these declarations remain legitimate kernel residuals after the injection and
charge mechanism above have been stated.

## 4. Bernoulli factors, nonvanishing, and the logarithm branch

This section closes the translation-fidelity part of `RB-11`, supplementing
`E306-PD-A7–A10`.

For a main label `m` and edge `e`, put `z=m/e`. The final scale ensures
`|z|<=1/10` and `1/3<=theta<=2/3`. The Bernoulli factor is

\[
 B_\theta(z)=(1-\theta)+\theta e^{2\pi iz}.
\]

Its real part satisfies

\[
 \Re B_\theta(z)
 =1-\theta+\theta\cos(2\pi z)>0,
\]

because `|2 pi z|<=pi/5`, so `cos(2 pi z)>0`, and `1-theta>=1/3`.
Consequently every factor lies in the open right half-plane and is nonzero.
The principal complex logarithm is therefore unambiguously defined along the
whole Taylor segment from `0` to `z`; no analytic continuation across the
negative real axis is being assumed.

Uniformly for the displayed theta and disk,

\[
 \log B_\theta(z)=
 2\pi i\theta z
 -2\pi^2\theta(1-\theta)z^2+R_\theta(z),
 \qquad
 |R_\theta(z)|\le C_3|z|^3.
\]

The final numeric fields verify both

\[
 |m/e|\le1/10
 \quad(e\in E,\ |m|\le N)
\]

and

\[
 C_3\sum_{e\in E}|m/e|^3\le1/10.
\]

The exact expected-mass identity cancels the total linear term. Conjugation
sends the term for `m` to the term for `-m`, so the finite main sum is real.
These are the hypotheses and implications represented by
`bernoulliCharFun_ne_zero_main`, `sum_logphi_bound`, `term_label_eq`,
`term_label_re_lower`, `main_sum_re_lower`, and `main_sum_im_zero`.

## 5. Exact Fourier-minor partition and the `b`-fibre

This section closes `RB-12`.

Use canonical frequency representatives `0<=h<L`. Let `S_M` be the genuine
Fourier-main labels, represented by the distinct integers `|m|<=N`; the scale
condition `2N+1<=L` makes this parametrisation injective. Let

\[
 S_m=(\mathbf Z/L\mathbf Z)\setminus S_M
\]

be the Fourier-minor set. For a frequency `h`, let `a(h)` be its block residue
assignment. Define

\[
 S_{\rm blk}=S_m\cap\{h:a(h)\notin\mathfrak M(C)\},
\]

and

\[
 S_{\rm ext}=S_m\cap\{h:a(h)\in\mathfrak M(C)\}.
\]

Then `S_blk` and `S_ext` are disjoint and their union is exactly `S_m`. In
particular, no genuine Fourier-main frequency is accidentally included in the
block lane.

Put

\[
 P=\prod_{p\in\operatorname{blockSupport}(BS)}p,
 \qquad L=bP.
\]

If two frequencies have the same block assignment, their difference is
divisible by every block prime and hence by `P`. Inside `[0,bP)`, a fixed
residue modulo `P` has at most the `b` representatives

\[
 r,\ r+P,\ldots,r+(b-1)P.
\]

Thus every assignment fibre has cardinality at most `b`. This is the exact
period argument behind `mainArc_fiber_card_le` and `r2_blockFiberTail`.

## 6. Exact sibling mismatch and common gadget reservoir

This section closes `RB-13` and `RB-14`.

For each `h in S_ext`, choose a witness integer `m(h)` for
`a(h) in mainArc(C)`, so

\[
 |m(h)|\le C/\sigma_{\rm ctrl}\le N,
 \qquad
 h\equiv m(h)\pmod p
\]

for every block prime `p`. Since `h` is Fourier-minor, it is not congruent to
`m(h)` modulo `L`. If it agreed modulo every prime divisor of squarefree `b`,
then it would agree modulo their product `b`. Since `b` is coprime to the block
product `P`, CRT would give agreement modulo `L`, a contradiction. Hence one
may choose

\[
 r(h)\mid b,\qquad r(h)\text{ prime},\qquad
 h\not\equiv m(h)\pmod{r(h)}.
\]

Choose, after `N` and the desired damping target are fixed, one common set
`Gset` of exactly `G` primes in the designated high block, all outside the
prime support of `b`, with

\[
 2N<s\qquad(s\in Gset).
\]

The density threshold supplies this set. The denominator family contains
`rs` for every prime `r|b` and every `s in Gset`; therefore it contains all
`r(h)s` needed by every extra frequency. These products are distinct:
unique factorisation recovers both the denominator prime `r` and the high
block prime `s`.

For `s in Gset`, agreement modulo `s`, mismatch modulo `r(h)`, and
`2|m(h)|<s` give the phase separation used by the released gadget lemma and
hence

\[
 \left|(1-\theta)+\theta e^{2\pi ih/(r(h)s)}\right|
 \le
 \sqrt{1-\frac8{9r(h)^2}}
 \le
 \sqrt{1-\frac8{9b^2}}
 =\beta_b<1.
\]

The `G` factors are distinct, so each extra frequency contributes at most
`beta_b^G`. There are at most `2N+1` label choices and at most `b` frequencies
in each block-residue fibre. Thus

\[
 |S_{\rm ext}|\le b(2N+1),
 \qquad
 \sum_{h\in S_{\rm ext}}|F(h)|
 \le b(2N+1)\beta_b^G.
\]

This explicitly supplies the fields denoted formally by `mfun`, `rfun`,
`Gset`, congruence, mismatch, edge membership, small-label separation,
cardinality, and pointwise-to-sum budget in `R2MultiGadgetReservoir`,
`multiGadgetBoundData_of_reservoir`,
`r2MultiGadgetReservoir_of_pointwise_budget`, `r2_extra_count_le`, and
`r2_buildFreqLanes`.

## 7. The semiprime / `omega=Omega=2` equivalence

This section closes `RB-17`.

If `n=pq` with distinct primes, additivity of `Omega` and the coprimality of
`p,q` give `Omega(n)=2`, while the distinct prime support has cardinality two,
so `omega(n)=2`. This is the direction used by `isSemiprime_omega_Omega`.

Conversely, suppose `omega(n)=Omega(n)=2`. The equality `Omega(n)=2` says that
the prime factorisation of `n` contains exactly two prime factors counted with
multiplicity, so `n=pq` for primes `p,q`, allowing equality. If `p=q`, the
number of distinct prime factors would be one, contradicting `omega(n)=2`.
Thus `p` and `q` are distinct and `n` is a squarefree semiprime.

A manuscript may therefore retain the mathematical word “equivalently”, while
stating separately that the named released bridge proves the direction consumed
by the public theorem.

## 8. Review B disposition ledger

| Review item | Final PDL disposition | Exact repair source |
|---|---|---|
| `RB-01` | `ABSORBED-PDL` | §2 above; A6.1 |
| `RB-02` | `ABSORBED-PDL` | A6.1 §§2–4, including `controlLoad<=32/(k0-1)` and released `<=512/(k0-1)` |
| `RB-03` | `ABSORBED-PDL` | A6.2 §§2–5; §3 above for wrapped/large labels |
| `RB-04` | `ABSORBED-PDL` | A6.2 §§6–7, `mismatch_penalty_with_exceptions` |
| `RB-05` | `ABSORBED-PDL` | A6.3 §2; §3 above; exact four-level encoder and charge route |
| `RB-06` | `ABSORBED-PDL` | A6.3 §3, floor, no-exception propagation, centred CRT and diagonal identity |
| `RB-07` | `ABSORBED-PDL` | A6.3 §4, shell sum, `8 eps<c'`, floor absorption |
| `RB-08` | `ABSORBED-PDL` | A6.3 §5, label injection and discrete Gaussian tail |
| `RB-09` | `MANUSCRIPT-REVISION-INSTRUCTION` | Replace mechanism-only P17–P23 by A6.2–A6.3 plus §§2–3; do not mark the fixed candidate paper-proved before rewrite |
| `RB-10` | `ABSORBED-PDL` | A6.4 §6, component decomposition and constants `1000001`, `501` |
| `RB-11` | `ABSORBED-PDL` | A7–A10 §2; §4 above |
| `RB-12` | `ABSORBED-PDL` | §5 above; exact `S_m` intersection and `b`-fibre |
| `RB-13` | `ABSORBED-PDL` | A7–A10 §5; §6 above |
| `RB-14` | `ABSORBED-PDL` | §6 above; common reservoir and finite budget |
| `RB-15` | `ABSORBED-PDL` | A7–A10 §§7–8, exact `eta -> C -> Dmp -> G -> k0` order and quarter budgets |
| `RB-16` | `ABSORBED-PDL / CONTRACT-CORRECTION` | A11–A13 §8: finite set to finite strictly increasing tuple; no infinite sequence |
| `RB-17` | `ABSORBED-PDL` | §7 above |
| `RB-18` | `MANUSCRIPT-REVISION-INSTRUCTION` | Synchronise `PROOF_LEDGER.md` only after the candidate text incorporates the repairs |
| `RB-19` | `SEPARATE-NOT-AUTHORIZED` | Stale Lean comments are a documentation-only task; no release source is changed here |
| `RB-20` | `RECORDED-EVIDENCE-LIMITATION` | Review B inspected declarations but did not independently rerun kernel/CI; no mathematical repair follows |

No item remains `MATERIAL-MATHEMATICAL-GAP` or `BLOCKED-FRONTIER`.

## 9. Exact manuscript-revision sequence

The next manuscript worker should consume this packet once, in the following
order.

1. Replace the schematic control-system paragraph by §2 and the complete A6.1
   estimate.
2. Replace P17–P23 mechanism prose by the A6.2–A6.3 theorem sequence, including
   §3's label-uniform fibre route.
3. Insert A6.4's exact mass-pool cancellation and variance constants.
4. Insert A7–A10's main-arc proof together with §4's nonvanishing/log-branch
   justification.
5. Define the Fourier-minor lanes exactly as in §5, then insert the sibling and
   reservoir argument of §6.
6. Display the terminal dependency table and the three quarter-budget
   inequalities from A7–A10 §§7–8.
7. Add the finite ordered-tuple bridge from A11–A13 §8 and the equivalence note
   from §7 above.
8. Only after the text is changed, synchronise every `PROOF_LEDGER.md` status;
   until then P16–P23 and P27–P32 remain review-gated in the fixed candidate.

Acceptance requires that a reader can verify every load-bearing implication
without using Lean comments as evidence, while named finite arithmetic and
threshold closures may remain transparently delegated to the immutable
companion.

## 10. Residual boundaries

The only still-open source certification is the independent human comparison
of the two Rosser–Schoenfeld axiom transcriptions with the publisher scan on
pp. 69–70 (`BLOCKED-SOURCE`). It does not reopen the downstream proof or this
Review B reconciliation.

`RB-19` remains outside present authority, and `RB-20` is an execution-record
qualification rather than a theorem obligation. The persistent programme may
continue to architecture comparison and future proof-interface work after the
manuscript consumer has taken this exact checkpoint.
