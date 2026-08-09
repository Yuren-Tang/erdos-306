# E306 — sparse-target `gamma>1` focused independent review packet

## Review object

Please review the reopened mathematical dependency cone in this exact fixed manuscript source:

```text
repository: Yuren-Tang/erdos-306
branch:     paper/e306-anchor-fibre-v1
source:     8024ff325f454e1fc52c280ac65bab0c48315e96
entry:      paper/e306-anchor-fibre-v1/manuscript/main.tex
```

Title:

> *Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem*

A clean XeLaTeX/Biber build of this exact source is certified by GitHub Actions run `31320182037` (run 204; execution head `f0fc3c441b6d614f26270e4fedcc2ae2b10cbd19`). The PDF is 35 A4 pages; workflow PDF artifact `9039950866`, digest

```text
sha256:a4bef64c3d9a8ace29a11191f9d843308ab55cce165713f0fee4f92489936b15
```

## Why this is a focused review rather than a third full review

The immediately preceding fixed object

```text
20fd8c774397faf14208fcdce550b344a6e9b77b
```

received a blind-style full read with no fatal mathematical objection; an earlier fixed object had also received an independent full read with no fatal objection. Those reviews are genuine evidence for their own objects, but neither automatically certifies the current source.

The present revision changes one real theorem interface: it sparsifies only the fixed target rows and strengthens the clean direct theorem from `gamma>2` to `gamma>1`. The complete prime-pair family, complete top anchor, one-anchor rigidity module, lower-prime row-distance module, weighted row-compression lemma, moving-target character insertion, no-wrap lemma, and prime-dilution closure are otherwise the same proof architecture.

Please therefore audit the **reopened dependency cone below independently and adversarially**. Reopen an unchanged cone only if the new argument actually depends on a previously unchecked or altered feature.

## Current construction and theorem scope

Fix reduced

```text
t=a/b in (0,1),  b squarefree,
```

and fixed

```text
gamma>1,
t < lambda_gamma := (log gamma)^2/2 < 1.
```

Put

```text
Z = X^gamma,
P = {p prime : X <= p < Z},
B = {q prime : Z/2 <= q < Z},
K_* = ceil((log Z)^2),
B_* subset B, |B_*| = K_*.
```

The family is

```text
E_pair = {pq : p,q in P, p<q},
E_b    = {rq : r|b prime, q in B_*},
E      = E_pair disjoint-union E_b,
L      = b prod_(p in P) p.
```

No distributional property of `B_*` beyond its cardinality is claimed or used.

The current headline quantitative claim is the compact-uniform local Gaussian profile for this family for every fixed admissible `gamma>1`; the central value gives proper-target representations, and finite avoidance plus prime dilution gives the qualitative characterization for all positive rationals with squarefree reduced denominator.

## Focused dependency-cone audit

### 1. Sparse target reciprocal and square loads

Please verify from the actual family that

```text
sum_(e in E_b) 1/e   = O_b(K_*/Z) = o(1),
sum_(e in E_b) 1/e^2 = O_b(K_*/Z^2),
```

and that the second quantity is `o(1/(X^2 log^2 X))` for every fixed `gamma>1`. Check that the resulting limits for `Lambda`, `theta`, `sigma^2`, family size, and lattice scale are all stated with the correct quantifiers.

### 2. Sparse fixed-coordinate row distance and weighted compression

For each fixed prime `r|b`, verify

```text
D_r >= K_*/r^2 >>_b (log Z)^2
```

without any hidden distribution assumption on `B_*`. Then check the row-tail estimate and the total sparse-target off-minimizer mass after multiplication by the complete weighted top partition `P_top << Z log Z`. The point to verify is that the fibre compression still pays weighted mass, not raw row-fibre cardinality.

### 3. Target decoder only where exact phase is needed

For a coherent anchor label `m`, verify

```text
E_r(m) / D_r <<_b m^2/Z^2.
```

The current proof deliberately decodes the fixed `b`-coordinates only through a scale `M_tar=Z/log Z`; it uses this only on fixed standardized major arcs `|m|=O(X log X)`. Check that `gamma>1` is exactly sufficient for the required inclusion and that no later argument silently assumes the fixed coordinates continue to decode to `m` through `X^2/4` or `M_dec`.

### 4. Major-arc Taylor expansion with two denominator scales

The old shortcut “every denominator is at least `X^2`” is no longer valid when `1<gamma<2`. Check the separate estimates:

- pair denominators `pq>=X^2` give the old aggregate cubic error;
- sparse target denominators are `asymp_b Z`, and their aggregate cubic remainder is
  ```text
  O_{C,b}(K_* X^3 log^3 X / Z^3)=o(1).
  ```

Check also the uniform small-phase condition and exact linear cancellation `theta Lambda=t` for the **full** family.

### 5. Pair-only first coherent tail

For

```text
C/sigma < |m| <= X^2/4,
```

the current proof no longer claims full CRT decoding. It claims only that all prime coordinates in `P` decode to `m`, then discards the sparse target factors in modulus and uses the complete pair factors to obtain

```text
|F(h_m^*)| <= exp(-c m^2 sigma^2).
```

Please check carefully that pair square mass is asymptotic to full square mass, that every pair phase is genuinely `m/(pq)` on the distinguished skeleton, and that no source-character phase information is needed in this tail.

### 6. Lower-prime decoder and retained damping for `gamma>1`

Check the unchanged lower-prime decoder with

```text
M_dec = XZ/(log Z)^2,
```

and the retained interval

```text
I_m=[2 sqrt(|m|), 3 sqrt(|m|)]
```

for `X^2/4 < |m| <= M_dec`. In particular verify that `I_m subset [X,Z/2)` follows for every fixed `gamma>1` and that the retained energy remains

```text
Q_ret(m) >> |m|/(log |m|)^2.
```

### 7. No fixed ordering between `M_dec` and the anchor-label ceiling

The old orientation displayed

```text
M_dec << Z^(3/2)/sqrt(log Z)
```

is not valid throughout `1<gamma<2`. The current proof removes that ordering. Check the dichotomy:

- if coherent labels exist above `M_dec`, the old internal-anchor Gaussian damping closes them with exponent `M_dec^2 sigma_{B,0}^2 >> X^2/log^6 Z`;
- if the low-energy anchor-label ceiling lies below `M_dec`, the nominal large coherent range is empty.

Please verify that no summation or label-count estimate elsewhere needs the discarded ordering.

### 8. Moving targets, quotient exactness, and finite avoidance

Check that moving the lattice target still only multiplies the Fourier numerator by the unit character `e(-hj/L)`, so all modulus estimates above are uniform on each fixed standardized window. Verify that the major range is genuinely decoded at the fixed coordinates there, and that `Lambda<1` eventually still gives no-wrap for all relevant moving targets. Confirm that finite avoidance and prime dilution use no lost property of the full target rows.

### 9. Entropy-saturation corollary

The new corollary says that for fixed reduced `0<t<1/2` with squarefree denominator, choosing

```text
gamma = exp(2 sqrt(t))
```

gives `lambda_gamma=2t`, `alpha=1/2`, and therefore at least

```text
2^{(1-o(1)) M_X}
```

exact representations in the mesoscopic typical-cardinality window and at some exact cardinality. Check that this is correctly described as an entropy rate per denominator, not an absolute optimization across families of different sizes.

### 10. Statement/proof agreement and hidden legacy assumptions

Search adversarially for any surviving use of `gamma>2`, full target rows, or the assertion that every denominator is at least `X^2`. Check the Abstract, Theorems 1.2/1.3, Sections 2--7, the proper-target theorem in Section 9, and the scope discussion in Section 10 against the actual proof.

## Bounded exposition repairs also made

The same source expands the fingerprint-rigidity contradiction, defines label classes at first use, states the CRT uniqueness bookkeeping in weighted row compression, corrects the Section 7 atom wording, and removes a temporary lcm notation collision. Please check these for fidelity if encountered. They are not intended to change theorem scope.

The common-proper-refinement result was condensed from a proposition/proof to a remark; it remains a peripheral consequence of finite avoidance and is not used in the analytic theorem.

## Fixed-object typography note

The exact Greek dedication remains

```text
ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ
ΚΑΙ ΟΙΣ ΦΙΛΩ
```

The current dedication-only setting is STIX Two Text Medium, 10.5 pt on 16 pt with `LetterSpace=9`. Body text remains ETbb and mathematics NewTX. The build checks exact Unicode extraction and embedding. `ΟΙΣ` is deliberate under classical relative attraction and should not be treated as an obvious typo without a contrary philological argument.

Typography is secondary to the mathematical review; report any visual or source-portability defect you actually observe.

## Requested review output

Please return one of:

- **FOCUSED PASS** — the reopened dependency cone closes and no hidden legacy hypothesis survives;
- **FOCUSED PASS WITH MINOR REPAIRS** — the theorem closes but bounded statement/exposition repairs are needed;
- **DEPENDENCY CONE REOPENED** — a substantive issue requires renewed proof work;
- **FAIL** — the `gamma>1` strengthening is not established by this source.

For every substantive finding, give the exact section/equation/lemma and its dependency consequence. Please distinguish a defect in the new sparse-target transport from an unrelated optional or expository issue in an already reviewed part of the paper.

A review PASS is evidence only. It does not authorize merge, tag, release, DOI changes, arXiv upload, journal submission, endorsement requests, or external contact.