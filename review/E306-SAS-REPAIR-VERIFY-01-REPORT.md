# E306-SAS-REPAIR-VERIFY-01 — independent bounded repair-verification report

**Role:** `Erdős 306 — Independent Sparse-Anchor Repair Verifier` (`E306-SAS-REPAIR-VERIFY-01`)  
**Controlling issue:** `Yuren-Tang/research-workbench#72`  
**Exact repaired candidate:** `proof-development/e306-sparse-anchor-v1@3074ca46452a6f3528be588033fe414d5a0c0ef9`  
**Exact pre-repair candidate:** `proof-development/e306-sparse-anchor-v1@4061883d8ee0487ec154f365ce0e1fe915ee3f1c`  
**Controlling independent audit:** `review/e306-sparse-anchor-proof-audit-v1@e9547c15b5858f5c456a9b3ffb9d30d1a0d15233`  
**Owned review branch:** `review/e306-sparse-anchor-repair-verification-v1`  
**Branch base:** `3074ca46452a6f3528be588033fe414d5a0c0ef9`  
**Write boundary:** `review/**` only.

## 1. Final disposition

```text
[PASS E306-SAS-REPAIR-VERIFY-01]
```

The bounded defect `SAS-BR-1` is repaired. The repaired packet closes the exact-cold label-range gap, proves the three required centred-lift/divisibility consequences before their first load-bearing uses, and propagates the repaired range through robust exact-cold rigidity, core-defect amplification, the exact top partition, decoder bookkeeping, the five-sector decomposition, and terminal closure.

This is an ordinary-mathematics repair verification only. It gives no Lean, release, manuscript, Curator, novelty, priority, arXiv, journal, publication, or submission authority.

## 2. Independence and fixed-input record

The verification recomputed the repair from the displayed definitions and inequalities. Correctness was not inferred from:

- the repair worker's ledger or self-audit;
- Research Lead statements;
- Lean or `v0.0.3`;
- prior assurance of the dense one-anchor or multiblock routes;
- AFT, manuscript, Curator, release, or publication material.

The controlling audit was used only to identify `SAS-BR-1` and the preservation gate.

## 3. Diff integrity and scope

The repository comparison

```text
4061883d8ee0487ec154f365ce0e1fe915ee3f1c
  ..3074ca46452a6f3528be588033fe414d5a0c0ef9
```

is six commits ahead, zero behind, and changes exactly:

1. `proof-development/SPARSE-ANCHOR-HUMAN-PROOF.md`;
2. `proof-development/SPARSE-ANCHOR-PROOF-ARCHITECTURE.md`;
3. `proof-development/SPARSE-ANCHOR-DEPENDENCY-AND-PARAMETER-LEDGER.md`;
4. `proof-development/SPARSE-ANCHOR-FAILURE-MODE-AUDIT.md`;
5. `proof-development/SPARSE-ANCHOR-ROUTE-COMPARISON.md`;
6. `proof-development/SPARSE-ANCHOR-MANUSCRIPT-HANDOFF.md`.

No seventh file is changed. Inspection of the six-file diff shows only:

- assurance-state wording;
- the tightened robust-cold base-label range;
- the three legality consequences;
- their use-order and downstream range bookkeeping;
- explicit separation of repaired `Z^2/16` from the independent decoder threshold `X^2/4`;
- preservation and handoff statements required by the controlling audit.

The headline theorem, avoiding theorem, denominator family, sparse synchronization mechanism, complete-pair backbone, exact factor partition, major/minor architecture, parameter architecture, and route-position classification are not changed.

## 4. Independent threshold recomputation

Let

```text
R_0=Q_G(a),
R_0<c_w Z/(log Z)^3,
M=|G|,
c_* Z/log Z <= M <= C_* Z/log Z,
B_0=A_0 sqrt(R_0) Z^2/M.
```

Here `rho_0`, the density constants, `A_0=A_0(rho_0)`, and then `c_w` are fixed structural constants. Uniformly for every assignment in the cold range,

```text
B_0/Z^2
 = A_0 sqrt(R_0)/M
 <= (A_0/c_*) (log Z/Z) sqrt(c_w Z/(log Z)^3)
 = (A_0 sqrt(c_w)/c_*) / sqrt(Z log Z).
```

Therefore

```text
B_0/Z^2=O((Z log Z)^(-1/2))=o(1),
```

with an implied constant depending only on already fixed structural data. Hence, after those constants are fixed, one may enlarge the final arithmetic threshold and require uniformly

```text
B_0<Z^2/16.
```

This is non-circular. `B_0<Z^2/16` is imposed only by the terminal choice of `X` (equivalently `Z=X^3`) after the robust-cold constants have been fixed. It is not used to select `A_0` or `c_w`, and no later parameter is fed back into the cold theorem.

The operative labels are now exactly the base-prime labels satisfying `|m|<=B_0`; dominance is defined only among those labels. The former operative allowance `|m|<Z^2/4` has been removed.

## 5. Three legality consequences — line-by-line verification ledger

### 5.1 Same-class centred lift

**Input.** Let `p` and `q` be distinct primes in one class `C(m)`, with `p,q in [Z/2,Z)` and `|m|<=B_0`.

**Congruences.** By definition of `C(m)`,

```text
a_p=m mod p,
a_q=m mod q.
```

Thus `m` is a CRT representative of the pair residues modulo `pq`.

**Centred range.** Since the primes are distinct and each is at least `Z/2`,

```text
pq>=Z^2/4,
pq/2>=Z^2/8.
```

The repaired bound gives

```text
|m|<=B_0<Z^2/16<Z^2/8<=pq/2.
```

Hence `m` lies strictly inside the centred representative interval modulo `pq`, and therefore

```text
H_(pq)(a)=m.
```

**First and downstream uses checked.** This fact is stated before:

- dominant-class energy in Proposition 8.3;
- the quantitative label estimate derived from that energy;
- exact identification of retained top lifts below `F_sync`;
- the identity `T_U(y)=m^2 sigma_(G,S)^2`;
- the coherent top-label tail.

All uses involve distinct complete-pair endpoints, so `p!=q` is satisfied by the denominator family `p<q` or by an explicit cross-edge.

### 5.2 Distinct base-prime labels are nonzero at a target prime

**Input.** Let `m_i!=m_j` be two labels produced from the same base prime `p_0`. Let `q` be a target vertex in the class carrying `m_j`.

The target classes partition nonbad neighbours of `p_0`, so

```text
q!=p_0.
```

Both labels reproduce the base coordinate, hence

```text
p_0 | (m_i-m_j).
```

Suppose, for contradiction, that the difference vanishes modulo `q`. Since `p_0` and `q` are distinct primes,

```text
p_0q | (m_i-m_j).
```

But the difference is nonzero and

```text
0<|m_i-m_j|
 <= |m_i|+|m_j|
 <=2B_0
 <Z^2/8
 <p_0q,
```

because `p_0q>=Z^2/4`. This is impossible. Therefore

```text
m_j-m_i !=0 mod q.
```

**First and downstream uses checked.** The fact is stated before the substantial-class energy estimate. For every ordered pair of distinct substantial classes, it supplies the nonzero residue required by reciprocal dispersion. The source class has size at least

```text
s_0=1024(B_0/Z+1)>=16,
```

and the target lies outside the source class; the conservative loss of at most one target vertex causes no endpoint defect. The ordered-class double count is divided by two exactly once.

### 5.3 Uniqueness of a dominant label

Let `m,m'` be dominant. Since `rho_0<1/8`,

```text
|C(m) intersection C(m')|
 >= |C(m)|+|C(m')|-M
 >=(1-2rho_0)M.
```

As `M asymp Z/log Z`, the overlap contains at least two distinct primes `p,q` for all sufficiently large `Z`. At every shared prime the two integer labels represent the same residue, so

```text
p|(m-m'),
q|(m-m'),
pq|(m-m').
```

On the other hand,

```text
|m-m'|<=2B_0<Z^2/8<pq,
```

again because `pq>=Z^2/4`. The only multiple of `pq` in this strict interval is zero, hence `m=m'`.

**First and downstream uses checked.** Uniqueness is proved before Proposition 8.2 concludes and before Proposition 8.3 selects the dominant label. It is not inferred from the later quantitative label estimate.

## 6. Reclosure of robust exact-cold rigidity

The `R_0=0` case remains separated before `sqrt(R_0)` is introduced. If `R_0=0`, every centred pair lift is zero and all coordinates are represented by the unique label `m=0`.

For `R_0>0`, the bad-pair estimate and base-prime averaging remain unchanged:

```text
#bad <=R_0Z^4/B_0^2=M^2/A_0^2,
```

so fixed large `A_0` supplies a base prime with the required small bad degree. All resulting labels satisfy `|m|<=B_0` and occupy one residue class modulo `p_0`.

The small/substantial class alternatives are unchanged and legal:

- `s_0>=16` before reciprocal dispersion;
- the number of labels is `M_0<=4B_0/Z+2`;
- the substantial inner sum is `(S_0-n_i)-(t-1)`;
- ordered class pairs count every cross edge twice and the factor `1/2` is absorbed once;
- the `[Z/2,Z)` endpoint loss is covered by the constants in `s_0` and the perturbation bounds.

Legality consequence 5.2 closes the substantial-class reciprocal-dispersion step. Legality consequence 5.3 gives uniqueness. Thus Proposition 8.2 is reclosed.

For Proposition 8.3, legality consequence 5.1 gives exact same-class lifts before the dominant-class energy estimate:

```text
Q_G(a)>=c m^2 sigma_G^2.
```

This yields the quantitative label bound. After reducing the cold constant or enlarging the terminal threshold, it gives the stronger perturbative inequality `|m|<=|C|Z/1024`. For an exceptional coordinate `q notin C`, `d=a_q-m` is nonzero modulo `q` by the definition of `C`; reciprocal dispersion over `C`, with the actual `m/(pq)` perturbation retained, costs `c|C|^3/Z^2`. Summing disjoint cross-edge sets gives fewer than one exception. The zero-exception conclusion is therefore reclosed.

## 7. Core-defect amplification and actual phases

Let `G=R\U` with `|U|<=N/2`, let the exact-cold decoder assignment on `G` have label `m`, and let `s in S` be defective. Since `S` and `G` are disjoint, every edge `rs` is legal and `r!=s`.

With `d=y_s-m mod s`, reciprocal dispersion gives

```text
sum_(r in G)||d r^(-1)/s||^2
 >=c|G|^3/Z^2
 >=cZ/(log Z)^3.
```

The actual centred CRT phase is, modulo integers,

```text
H_(rs)/(rs)=j_r/s+m/(rs),
j_r=d r^(-1) mod s.
```

At retained energy below a fixed multiple of `Z/(log Z)^3`, the quantitative exact-cold label bound gives

```text
|m|<<Z^(3/2)/(log Z)^(1/2).
```

Hence the `ell^2` norm of the perturbation satisfies

```text
|| (m/(rs))_(r in G) ||_2
 <=C|m|sqrt(|G|)/Z^2
 =O(1/log Z),
```

whereas the dispersion norm is

```text
>>sqrt(Z)/(log Z)^(3/2).
```

The reverse triangle inequality therefore leaves a fixed fraction of the dispersion energy. No pointwise deletion of the perturbation is used, and no step depends on the old wider label range.

## 8. Exact top partition

Below `F_sync`, robust exact-cold rigidity first labels all decoder rows in `G`; core-defect amplification then forces every sensor in `S` to carry the same label. The quantitative label satisfies `|m|<Z^2/16` for large `Z`. Every retained top product is at least `Z^2/4`, so every corresponding centred lift is exactly `m` and only then may one write

```text
T_U(y)=m^2 sigma_(G,S)^2.
```

The three classes remain distinct and exhaustive:

```text
U=emptyset, T_U<F_sync:
  genuine global integer diagonal;

U!=emptyset, T_U<F_sync:
  retained diagonal with actual nondecoder top defects;

T_U>=F_sync:
  energetic, irrespective of formal label existence.
```

The corresponding bounds remain:

```text
Y_S exp(-kappa_bF_sync)(1+delta)^N,
Y_S2^Ndelta^(N/2),
O(ZlogZ)((1+delta)^N-1)=O(Z^2delta).
```

Thus the exact top partition and zero-defect main class survive unchanged.

## 9. `Z^2/4` occurrence audit

No remaining occurrence of `Z^2/4` acts as an admissible robust-cold label range. Remaining uses are of the following legal kinds:

1. the product lower bound `pq>=Z^2/4` for distinct primes in `[Z/2,Z)`;
2. explanatory statements identifying and rejecting the former allowance `|m|<Z^2/4`;
3. comparison with half-products when proving centred-lift legality.

The analytically operative decoder threshold is `X^2/4`, not `Z^2/4`. It belongs to fixed-`b` decoding and the Sector II/III split.

## 10. Decoder, major/minor, no-wrap, and arithmetic compatibility

With `Z=X^3`,

```text
X^2/4<M_dec=XZ/(log Z)^2<Z^2/16
```

for large `X`. The quantitative cold-label bound

```text
|m|<<Z^(3/2)/(log Z)^(1/2)
```

also lies below `Z^2/16` and is larger than `M_dec` in the required asymptotic range.

Consequently:

- lower-prime decoders remain valid through `M_dec`; at the smallest row `r=X`, `M_dec<XZ/4<=rs/2`;
- fixed-`b` decoders remain valid through `X^2/4`, with candidate-energy/code-distance ratio `O(m^2/Z^2)=o(1)`;
- Sector I remains the actual-family major arc;
- Sector II remains the full-variance Gaussian tail through `X^2/4`;
- Sector III remains the adaptive complete-pair range `X^2/4<|m|<=M_dec`, with `[2sqrt(|m|),3sqrt(|m|)] subset [X,Z/2)` and distinct prime pairs;
- Sector IV remains the coherent cold-label tail above `M_dec`, now explicitly inside `Z^2/16`;
- Sector V still contains every top or lower nondecoder error;
- the five sectors are exhaustive by the squarefree CRT coordinate bijection and exact factor partition;
- terminal no-wrap uses only `Lambda<1` and is logically independent of every label range;
- squarefree-semiprimality, avoidance, numerator induction, and the `b=1,2` reductions are unchanged.

## 11. Preservation matrix for the issue #66 canonical gate

Every non-`SAS-BR-1` preservation condition survives:

1. **Arithmetic family:** `Z=X^3`, `P`, `B`, `S`, `E_pair`, `E_b^S`, and `L` unchanged; load, variance, disjointness, squarefree period, and avoidance unchanged.
2. **Population floor:** the `r<Z/2` multiplicity argument and the `Z/2<=r<Z` short-congruence argument are unchanged and remain separate.
3. **Common core:** one Bernoulli sample serves all rows; `rho=K(log Z)^4/Z`, fewer than `Z^2` tests, and two-sided `|S|asymp(log Z)^3` remain.
4. **Actual row tails:** the exact Bernoulli kernel and the `D/4` uniqueness conversion remain.
5. **Decoder-defect expansion:** the legal fixed-`U` order, retained `G-G` and decoder-star factors, and one actual `delta` per defective row remain.
6. **Robust exact-cold:** class-size, zero-energy, label count, small/substantial split, `(S_0-n_i)-(t-1)`, ordered-pair `1/2`, endpoint losses, quantitative label bound, and zero exceptions remain, with `SAS-BR-1` now added.
7. **Core amplification:** actual star phases and the `ell^2` perturbation comparison remain explicit.
8. **Top classification:** `U=emptyset`, cold `U!=emptyset`, and energetic assignments remain separate.
9. **Top errors:** `Y_S`, binomial factors, and the explicit comparison `(log Z)^4=o(Z/(log Z)^3)` remain in the packet.
10. **Factor partition and lower compression:** all six complete-pair classes plus `S_b-S`, the retained skeleton, and `P_top(exp(Delta)-1)` remain.
11. **Sparse target observability:** reciprocal load, square load, fixed-row distance, decoder range, and squarefree CRT identification remain.
12. **Decoder ranges and sectors:** both decoder ranges, adaptive interval, distinct-prime exclusion, Taylor remainder, coherent tail, and Sector V assignment remain.
13. **Terminal closure:** the order `structural constants -> C -> X`, positive major mass, absolute suppression, `Lambda<1`, avoidance, induction, and small-denominator reductions remain.

No preservation condition requires a second route audit or structural revision.

## 12. Route and canonical status

The repair does not strengthen the public theorem or alter the route. The repaired sparse packet is now an independently assured ordinary-proof alternative with the same honest position:

```text
INDEPENDENTLY ASSURED ALTERNATIVE /
CLEANER HIERARCHY BUT COMPARABLE BURDEN.
```

Correctness does not itself select this route over dense one-anchor for canonical exposition.

## 13. Changed-file and no-mutation record

This verifier created only:

- `review/E306-SAS-REPAIR-VERIFY-01-REPORT.md`;
- `review/E306-SAS-REPAIR-VERIFY-01-CANONICAL-GATE.md`.

No repaired-candidate file, proof-development file, research file, prior review, dense one-anchor file, multiblock file, AFT file, mathematics file, manuscript file, Lean file, workflow, release, tag, DOI, default branch, arXiv, journal, publication, or submission surface was modified.