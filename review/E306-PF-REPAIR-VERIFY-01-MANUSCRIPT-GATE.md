# E306-PF-REPAIR-VERIFY-01 — manuscript gate

**Verification classification:** `[PASS E306-PF-REPAIR-VERIFY-01]`  
**Frozen repaired candidate:** `review/e306-paper-first-repair-verification-v1@95a2ede1d40dae41a17fe26e4fe4b491bd94e947`  
**Controlling prior audit:** `review/e306-paper-first-proof-audit-v1@3d1451faf66830bbf38e16047b78dd08d7efa803`  
**Mathematical gate:** `OPEN FOR A FRESH PAPER-FIRST MANUSCRIPT`  
**Submission gate:** `NOT OPENED BY THIS VERIFICATION`

## 1. Gate decision

The bounded repairs required by `E306-PF-AUDIT-01` have been verified. The repaired multiblock proof packet may now be consumed by a fresh paper-first manuscript worker.

This decision removes the prior mathematical reason to withhold a fresh REV5. It is not Owner approval of any manuscript, independent review of a future manuscript, formalization, release promotion, arXiv authorization, journal authorization, or submission authority.

## 2. Verified repair conditions

The following conditions are satisfied in the frozen repaired candidate.

1. Lemma 8 is restricted to
   \[
   |C_m|\ge\max\{16,128B/X\},
   \]
   and every downstream application lies in that range.
2. Proposition 9 proves the `R=0` case before defining `B` or dividing by `B^2`.
3. The substantial-class sum is exactly
   \[
   \frac12\sum_i n_i^3\bigl((S-n_i)-(t-1)\bigr),
   \]
   with the factor `1/2` accounting for ordered-pair double counting.
4. The threshold `s_0=256(B/X+1)` gives
   \[
   (S-n_i)-(t-1)\ge(255/256)(S-n_i)
   \]
   without circular dependence.
5. The forcing conclusion remains
   \[
   R\ge cX/\log^3X
   \]
   for a positive fixed constant.
6. The zero-exception cold-block theorem retains its strict integer `<1` conclusion.
7. Fingerprint entropy, the global level-set code, localization, the CRT tail, both minor sectors, and terminal positivity remain closed.
8. Avoidance handles `T=\varnothing` without an undefined `max(T)`.
9. The dependency ledger and manuscript handoff record the repaired state accurately and await, rather than presume, this verification.
10. No route, headline theorem, denominator family, reservoir, Fourier partition, exact fibre count, or terminal parameter order has changed.

## 3. Controlling source for a fresh manuscript

A fresh manuscript must consume the corrected paper-first packet at or after the frozen repaired candidate, in particular:

- `proof-development/PAPER-FIRST-HUMAN-PROOF.md`;
- `proof-development/PAPER-FIRST-DEPENDENCY-AND-PARAMETER-LEDGER.md`;
- `proof-development/PAPER-FIRST-MANUSCRIPT-HANDOFF.md`;
- the unchanged paper-first route comparison and proof architecture named by that handoff.

It must not recover the unrepaired Lemma 8 statement or the unrepaired Proposition 9 summation from the repair base or an older manuscript.

## 4. Manuscript obligations that remain

The fresh manuscript must still:

- print the centred-CRT rigidity proof in the mathematical body;
- preserve the exact range of Lemma 8 and the `R=0` branch;
- show the ordered-pair factor, the exact `(t-1)` subtraction, and the absorption by `s_0`;
- display the algebra retaining the `X/\log^3X` forcing scale and the strict zero-exception conclusion;
- retain the fingerprint, encoder, localization, minor-partition, and terminal parameter dependencies;
- state truthfully that the present simplified proof is not itself already formalized;
- undergo substantive Owner review and independent mathematical review as a manuscript.

Compression is permissible only within the limits stated in `PAPER-FIRST-MANUSCRIPT-HANDOFF.md`; no prose slogan may replace a load-bearing derivation.

## 5. Reopening conditions

A new mathematical audit is required if a later manuscript or proof-development change:

- weakens or removes the repaired Lemma 8 range;
- omits the `R=0` branch;
- alters the exact cross-class multiplicity calculation;
- weakens the forcing floor needed by entropy domination;
- reintroduces cold-block exceptions;
- changes the complete-pair or auxiliary denominator family;
- changes the common reservoir or makes it scale-circular;
- changes the major/minor partition, exact fibre count, or squarefree sibling argument;
- changes the order `eta -> C -> G -> n`;
- imports Lean, a release, an earlier manuscript, or another route as a missing premise.

Faithful manuscript transcription of the verified packet does not by itself reopen the repair audit, but the resulting manuscript still requires its own review.

## 6. Exact return

`[PASS E306-PF-REPAIR-VERIFY-01]`
