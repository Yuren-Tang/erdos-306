# Paper-first frontier realignment and a one-anchor proof route

**Programme:** `E306-RL`  
**Research unit:** `E306-RL-PF1A-03`  
**Role:** `Erdős 306 — Research Lead`  
**Status:** `ARGUMENT / MATERIAL ROUTE CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

## 1. Purpose

The research frontier has moved beyond the architecture curated from `v0.0.3`,
the frozen `pushlinter` refactor, REV3, and the pre-pivot PDL corpus.

The current authorial paper mathematics is the frozen paper-first candidate

```text
review/e306-paper-first-proof-audit-v1
  @5753219dd888b77b0ebe892a8ae7feabb0ca40ae
```

whose five controlling proof files were produced from
`proof-development/e306-rigour-v1` after the paper-first reset.

This note has two purposes.

1. Reclassify the old mathematical corpus, the current paper-first proof, and the
   FPCRT research line without silently transferring authority.
2. Use the paper-first complete-pair family together with the Research Lead's
   shift-uniform product-fibre compression to derive a substantially simpler
   candidate proof of the original Erdős 306 theorem.

The frozen paper-first audit candidate is not modified.  The present route is an
alternative research theorem candidate to be compared only after independent
assurance or by a separately authorized review.

## 2. Exact frontier map

### 2.1 Immutable formal record

```text
v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe
```

remains the immutable priority and Lean record.  It is not the controlling paper
architecture.

### 2.2 Frozen refactor

```text
codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff
```

is a discovery and naming source only.

### 2.3 Old Curator architecture

```text
mathematics:curation/erdos-306-proof-architecture-v1
  @6505b51f12de3fdaaf4976379b0ce8b0a665cfc1
```

is a careful integration of the old proof family.  It retains the selected mass
batch, `alpha=3/2`, the control/mass split, global localization, and the old
mechanism-first normalization.  Project control now classifies it as archival and
has withdrawn manuscript control.  It is not today's current-best paper proof.

`mathematics:main@960c92...` has no newer E306 integration.  Hence the true E306
frontier is presently distributed across the frozen paper-first candidate and the
separate Research Lead branch; it is not represented by the public corpus tip.

### 2.4 Current paper-first proof

The frozen authorial proof uses all products

```text
pq,  X <= p < q < X^3,
```

whose reciprocal load tends to `(log 3)^2/2`.  It removes the selected mass batch,
greedy interval, forbidden-load cancellation, `alpha=3/2`, `21/20`, and the old
large finite certificates.

It also proves from scratch:

- deterministic reciprocal dispersion;
- nondominant forcing at `X/log^3 X`;
- exact zero-exception cold labels;
- fingerprint entropy;
- adjacent-label propagation;
- global level-set encoding and localization;
- variance, major arcs, block minors, siblings, and terminal positivity.

Its classification is

```text
AUTHORIAL STRICT SIMPLIFICATION PROVISIONALLY CONFIRMED /
FROZEN FOR INDEPENDENT AUDIT /
NOT YET AN ACCEPTED PROOF FAMILY.
```

### 2.5 Current Research Lead line

The FPCRT line has added mathematical mechanisms not present in the paper-first
proof:

- arbitrary-shift cyclic and product-fibre decoding;
- sparse actual-prime sensors;
- prefix-bounded load--distance lower bounds;
- Gibbs edge sparsification;
- one-anchor finite-prefix architectures.

These mechanisms remain research candidates.  Their old references to “verified
SBEE” should be read as genealogy, not as the preferred current exposition.

## 3. What survives after the paper-first reset

The sparse-Gibbs and one-anchor work does not depend essentially on the old Lean
module hierarchy.

The paper-first standalone proof itself supplies the required one-block inputs.
For a prime block `P subset [Y,2Y]`:

1. every assignment below

   ```text
   F_Y = c Y/log^3 Y
   ```

   is exactly represented by one integer label, with no exceptional coordinates;

2. for every fixed `epsilon>0`, and all sufficiently large `Y`,

   ```text
   #{a : Q_P(a) <= R} <= exp(epsilon R)
   ```

   for `R>=F_Y`;

3. its explicit fingerprint proof gives the moving entropy coefficient

   ```text
   epsilon_Y << Y^(-1/4) log^(13/4) Y.
   ```

Thus the current paper-first Propositions 10 and 12 replace the old SBEE authority
for research exposition.  The old formal theorem remains corroborating evidence,
not the natural source.

The exponent `1/4` in the current sparse-Gibbs FPCRT route is exactly the exponent
visible in the paper-first fingerprint count; it was not an artifact of a stale
Lean normalization.

## 4. Why the complete-pair simplification does not directly solve FPCRT

For the fixed-denominator theorem, the target is `1/b` with `b` fixed.  The full
pair load is a fixed constant and the common Bernoulli parameter remains in a
compact subinterval of `(0,1)`.

In a gap-free finite-prefix theorem the target `q` tends to zero.  If the same
constant-load family were used with one uniform parameter, then

```text
theta = q/Lambda,
```

and the Fourier damping coefficient would be only `Theta(q)`.  The moving
single-block entropy would then have to be absorbed by a vanishing Fourier
exponent.

Consequently the paper-first complete-pair trick does not by itself replace the
FPCRT need for fixed-strength control at reciprocal cost comparable with the
small target.  The FPCRT sparse anchor remains mathematically substantive.

The complete-pair family can nevertheless simplify the FPCRT mass/variance layer
through heterogeneous Bernoulli parameters; that is a later research unit.

## 5. A new one-anchor route for the original theorem

The paper-first proof still uses a chain of dyadic blocks, adjacent-label
propagation, a global injective code, and a Peierls/Laplace localization theorem.
The complete-pair denominator family already contains enough cross edges to
avoid this global chain.

Put

```text
P = {p prime : X <= p < X^3},
Z = X^3,
B = {q prime : Z/2 <= q < Z}.
```

Retain the complete pair denominator family and the same small `b`-sensitive
auxiliary family from the paper-first proof.

The proposed proof uses only:

1. one-block rigidity on `B`;
2. the complete cross families `{rq : q in B}` for every `r in P\B`;
3. the complete pair family to damp coherent labels away from the major arc;
4. the existing finite Fourier and sibling arguments.

### 5.1 Top-block partition

Let `Q_B` be the complete internal CRT energy on `B`.  The paper-first one-block
proof gives a floor

```text
F_B >> Z/log^3 Z
```

such that every assignment below `F_B` is exactly

```text
a_q = m mod q  (q in B)
```

and has energy `m^2 sigma_B^2`, where

```text
sigma_B^2 asymp 1/(Z^2 log^2 Z).
```

For any fixed Fourier damping constant `c>0`, fixed-epsilon fingerprint entropy
and shell summation give

```text
sum_(Q_B >= F_B) exp(-c Q_B)
  <= poly(Z) exp(-c' Z/log^3 Z).
```

Thus the top assignment is either exponentially negligible or one exact integer
label.  No adjacent block and no global encoder is needed for this dichotomy.

### 5.2 Shift-uniform elimination of every lower prime coordinate

Fix a top assignment and a lower prime `r<Z/2`.  The factors belonging to the
cross denominators `rq`, `q in B`, form a cyclic code in the variable `x mod r`.
For two lower residues whose difference is `d!=0 mod r`, its squared code distance
is

```text
D_r(d) = sum_(q in B) ||d q^(-1)/r||^2.
```

Let `M=|B|`.  A residue class modulo `r` occurs among the integers of `(Z/2,Z)` at
most `O(Z/r)` times.  The multiplicity-sensitive cyclic-energy inequality gives

```text
min_(d!=0) D_r(d)
  >> M^3 / ((Z/r)^2 r^2)
  >> Z/log^3 Z,
```

uniformly for every `r<Z/2`.

The Bernoulli parameter is fixed in a compact interval for the original theorem.
Hence the arbitrary-shift fibre theorem gives

```text
sum_(x != decoder) |cross product at x|
  <= r exp(-c Z/log^3 Z).
```

After multiplication over all lower primes, the entire lower CRT fibre is
compressed to one decoded point with total error `o(1)`.  All other pair factors
and auxiliary factors may be discarded in this absolute-value estimate because
their modulus is at most one.

This is the step not present in the frozen paper-first proof.

### 5.3 Identification of the decoder on a coherent top label

Suppose the top assignment is the exact label `m`.  Put

```text
M_dec = X Z/(log Z)^2.
```

For `|m|<=M_dec` and every `r>=X`, the residue `m mod r` has cross energy

```text
E_r(m)
 <= (m^2/r^2) sum_(q in B) q^(-2)
 << (m^2/r^2)/(Z log Z).
```

At the worst row `r=X`, this is `O(Z/log^5 Z)`, whereas the cyclic code distance
is `Omega(Z/log^3 Z)`.  It is therefore the unique decoder for all sufficiently
large `X`.

Thus every prime coordinate is reconstructed as `m mod p` throughout
`|m|<=M_dec`.

For coherent labels with `|m|>M_dec`, the top-block energy itself is already

```text
m^2 sigma_B^2
 >> X^2/log^6 Z,
```

so their total contribution is exponentially negligible.

### 5.4 Direct damping of intermediate coherent labels

Let the full pair assignment be the integer label `m`.  The ordinary major arc
and its Gaussian tail cover `|m|=O(1/sigma_E)`, where

```text
sigma_E^2 asymp 1/(X^2 log^2 X).
```

It remains only to suppress labels larger than the small-phase range but below
`M_dec`.

For

```text
|m| >= X^2/4,
```

choose a fixed-ratio prime interval

```text
I_m = [2 sqrt(|m|), 3 sqrt(|m|)].
```

For `|m|<=M_dec`, this interval lies inside `[X,X^3)` for large `X`.  Tail-uniform
PNT gives

```text
# {p prime : p in I_m} >> sqrt(|m|)/log |m|.
```

For distinct `p,q in I_m`,

```text
1/9 <= |m|/(pq) <= 1/4,
```

so its circle distance is bounded below by `1/9`.  Therefore the complete pair
family gives the deterministic coherent-label energy

```text
Q_E(m)
  >> |m|/(log |m|)^2.
```

This is exponentially stronger than needed.  It replaces the whole multiblock
label-propagation and global-localization apparatus in the coherent intermediate
sector.

Labels between the major window and `X^2/4` remain in the small-phase regime for
all denominators and are controlled by the full variance Gaussian tail.

### 5.5 Siblings modulo b

The product-fibre compression is performed separately for each of the exactly `b`
lifts of a prime-coordinate assignment modulo

```text
L = b prod_(p in P) p.
```

Inside the genuine major window, the paper-first common auxiliary reservoir still
kills every lift which disagrees with the integer label modulo `b`.  Squarefreeness
is used exactly as in the frozen candidate.

Outside the major window, the pair-family energy bounds above already annihilate
all `b` lifts, so no growing auxiliary reservoir is required.

### 5.6 Candidate theorem

The preceding estimates give the following route candidate.

> **Paper-first one-anchor theorem candidate.**  The avoiding unit representation
> for every fixed squarefree `b>=3` follows from the PNT, one complete top prime
> block, shift-uniform product-fibre compression, the complete pair family, and one
> fixed `b`-sensitive reservoir.  The adjacent-block theorem, global block code,
> global level-set theorem, and multiblock localization theorem are not required.

The public endpoint is unchanged.  If correct, this is a genuine strict proof
simplification of the frozen paper-first route, not merely a reparameterization.

## 6. Comparison with the frozen paper-first proof

### Retained

- the complete pair denominator family and natural load `(log 3)^2/2`;
- finite Fourier inversion and no-wrap;
- one-block reciprocal dispersion;
- exact cold labels and one-block fingerprint entropy;
- major-arc Taylor analysis;
- the squarefree sibling reservoir;
- numerator, avoidance, and `b=1,2` closure.

### Replaced

```text
all-block hot/cold decomposition
+ adjacent-label energy
+ global shell/hot/boundary/segment code
+ global level-set theorem
+ forcing-floor localization
```

is replaced by

```text
one top-block partition
+ shift-uniform lower-fibre decoding
+ adaptive-scale coherent-label damping.
```

The new route contradicts the provisional route-comparison claim that adjacent
label propagation is irreducible.  It does not contradict any proved theorem in
the candidate; it supplies a different mechanism.

## 7. Assurance and disposition

This route has not been independently audited and has not been incorporated into
the frozen paper-first candidate.  It must not interrupt or contaminate
`E306-PF-AUDIT-01`, whose task is to judge the frozen proof on its own terms.

Recommended disposition:

1. continue the existing independent audit unchanged;
2. retain this route as a separate RL theorem candidate;
3. after the audit return, compare the accepted frozen proof with this one-anchor
   route in a bounded independent route audit;
4. only then decide whether REV5 should use the frozen route, the one-anchor route,
   or a hybrid;
5. do not send the archival Curator corpus back to `mathematics:main` as
   current-best E306 mathematics.

## 8. Revised Research Lead frontier

The highest-value immediate work is now:

1. adversarially audit the lower-fibre decoder, especially the uniform
   multiplicity bound and the distinguished-decoder range;
2. audit the adaptive interval `[2 sqrt(|m|),3 sqrt(|m|)]` uniformly over all
   integer labels and endpoint scales;
3. write the complete Fourier partition with exact `b`-fibre factors and terminal
   budgets;
4. compare the resulting proof length and dependency DAG with the frozen
   paper-first route;
5. separately rebase the FPCRT sparse-Gibbs line on the paper-first one-block
   propositions and investigate a heterogeneous complete-pair mass reservoir.

A failure in items 1--3 is a genuine Research Lead obstruction.  Routine constant
and endpoint expansion after the route is closed belongs to PDL.