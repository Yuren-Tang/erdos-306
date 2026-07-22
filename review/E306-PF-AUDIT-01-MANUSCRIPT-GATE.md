# E306-PF-AUDIT-01 — REV5 manuscript gate

**Audit classification:** `[PASS-WITH-BOUNDED-REPAIRS E306-PF-AUDIT-01]`  
**Current gate:** `WITHHOLD REV5`  
**Reason:** the route is complete, but the frozen proof text contains three local mathematical defects that must be repaired before manuscript consumption.

## 1. What has passed

The following parts require no change of route and no replacement theorem:

- the complete-pair denominator family and its reciprocal load `(log 3)^2/2`;
- elimination of the old mass-selection and normalization layers;
- deterministic block dispersion;
- zero-exception cold blocks at the forcing floor;
- fingerprint entropy in both energy ranges;
- adjacent-label propagation;
- the injective global code and its separate shell/hot/boundary/label counts;
- localization, exact diagonal energy, Laplace domination, and Gaussian tail;
- full-pair/scaffold variance comparison, including non-circular absorption of the fixed auxiliary reservoir;
- uniform Taylor expansion with aggregate remainder `O_(b,C)(n/X)`;
- exact block-minor fibre factor `b`;
- squarefree sibling detection and common-reservoir damping;
- parameter order `eta -> C -> G -> n`;
- strict Fourier positivity, no-wrap, avoidance, numerator induction, and the `b=1,2` reductions.

The public theorem is not stronger than the existing endpoint. The proof architecture is genuinely simpler, and the exact cold-block statement is a stronger intermediate theorem.

## 2. Mandatory pre-REV5 repairs

A proof-development owner must make all of the following changes in the candidate proof sources. The auditor is not authorized to edit those files.

### Gate condition 1 — restrict Lemma 8 to the range in which Lemma 7 applies

Add the hypothesis

```text
|C_m| >= max(16, 128 B/X)
```

or an equivalent substantial-class hypothesis. Do not leave Lemma 8 stated for arbitrary classes satisfying only `|C_m|>=128B/X`.

### Gate condition 2 — separate the `R=0` case in Proposition 9

Before defining `B=A_rho sqrt(R) X^2/N` and dividing by `B^2`, prove directly that `Q_P(a)=0` forces the common label `0`. Continue the bad-pair argument only under `R>0`.

### Gate condition 3 — repair the substantial-class energy sum

Replace the printed term

```text
S - n_i - O(1)
```

by the exact term

```text
(S - n_i) - (t - 1)
```

and insert a factor `1/2` if the proof sums ordered class pairs. Then use the existing substantial threshold

```text
n_j >= s_0 = 256(B/X+1)
```

to show

```text
(S-n_i)-(t-1) >= (255/256)(S-n_i).
```

The largest-class and power-mean alternatives may then proceed exactly as written, with altered absolute constants.

### Gate condition 4 — synchronize dependent status claims

After the three mathematical repairs, update any proof ledger or handoff sentence that presently calls every node proved without qualification. The corrected packet must identify the repaired Lemma 8 and Proposition 9 statements exactly. No old formal source may be cited as validation.

### Gate condition 5 — remove the empty-set ambiguity

Replace `X^2>max(T)` by “`X^2` exceeds every element of `T`” or explicitly treat `T=empty`. This is not route-critical, but a fresh manuscript must not inherit an undefined expression.

## 3. Bounded verification required after repair

The receiver need not commission a new full-route audit. A bounded verification is sufficient if it checks all of the following:

1. Lemma 8 contains the missing size hypothesis and no downstream application violates it.
2. Proposition 9 treats `R=0` before any division by `B`.
3. The cross-class sum contains `(t-1)` and any double-counting factor.
4. The substantial threshold really absorbs `(t-1)` by a fixed factor.
5. The final forcing conclusion remains `R>=cX/log^3X` with a positive constant.
6. Proposition 10 cites the repaired Proposition 9 and retains the strict integer `<1` conclusion.
7. No candidate edit changes the complete-pair route, the reservoir, the global tail theorem, or the terminal parameter order.

If these seven checks pass, the audit classification upgrades operationally to a clean manuscript launch gate without another mathematical reconstruction.

## 4. Conditions under which REV5 may be launched

REV5 may be launched only after:

- all five gate conditions above are present on the controlling proof-development source;
- the bounded verification records that the corrected nondominant-forcing proof closes;
- the manuscript worker is instructed to use the corrected paper-first packet rather than the frozen uncorrected prose;
- the manuscript includes the full CRT rigidity proof in the body and does not replace it with an encoder slogan or formalization claim;
- the manuscript states truthfully that the present simplified proof is not itself already formalized.

Once these conditions are met, no mathematical reason remains to withhold a fresh paper-first REV5.

## 5. Conditions that would reopen the gate

A new full audit is required if a repair does any of the following:

- weakens the forcing floor below the scale needed for entropy domination;
- reintroduces exceptions into cold blocks;
- changes the complete-pair family or the load interval;
- makes the reservoir size depend on the final scale in a circular way;
- changes the exact fibre count or sibling partition;
- changes the order `eta -> C -> G -> n`;
- imports an earlier Lean or manuscript result as a missing premise.

Purely local implementation of Gate conditions 1–5 does not trigger this reopening rule.

## 6. Exact return

`[PASS-WITH-BOUNDED-REPAIRS E306-PF-AUDIT-01]`
