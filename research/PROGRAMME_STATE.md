# Erdős 306 Research Lead programme state

**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**State date:** 2026-07-22  
**Workspace:** `Yuren-Tang/erdos-306:research/e306-frontier-v1`  
**Immutable base:** `4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Writes:** `research/**` only  
**Downstream rule:** exact SHA checkpoints only

## Authority boundary

The released theorem authority remains

`v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

with the two named Rosser–Schoenfeld assumptions. The frozen

`codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`

is read-only development context and supplies no released premise or proof status.

This research branch is not a proof-development, manuscript, formalization, review, release, DOI, or submission surface.

## Reactivation and current unit

PORT-DIR reactivation comment: research-workbench issue #9 comment `5038620554`.

E306-RL acknowledgement: issue #9 comment `5043758484`.

Current direction:

`E306-RL-FPCRT-02 — Global finite-prefix transfer and realization threshold`.

Issue #39 remains `PREPARED-HOLD`; this standing-branch work does not activate the child probe.

## Durable recovery

Conversation recovery commit:

`b21c3e993739a6ee1f59f0c657f38bc38ae4756c`

File:

`research/finite-prefix-crt/CONVERSATION_RECOVERY_2026-07-22.md`

Recovered content:

- arbitrary-shift cyclic partition function;
- distribution-free `M/r^2` damping mechanism;
- abundance scale `M >>_A r^2 log r`;
- common high-prime reservoir reuse;
- heuristic high block `Y >> X^2(log X)^2`;
- sequential CRT elimination;
- sparse cyclic-code design with `O_A(log r)` columns;
- the prime-residue realization boundary.

## Local suppression checkpoint

Theorem-source commit:

`38f5b1a84a5d0eb9c5793eb277e65d39bd1c1253`

File:

`research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`

Status:

`ARGUMENT / MATERIAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

Closed locally:

1. weighted arbitrary-shift cyclic-code suppression;
2. distribution-free abundance suppression;
3. sparse `O_A(log r)` cyclic designs;
4. one simultaneous design matrix for all low primes `r<=X`;
5. semiprime CRT interpretation and sequential low-coordinate elimination;
6. algebraic realization of one sparse column as a reduced class modulo the low primorial.

## Global finite-prefix transfer checkpoint

Theorem-source commit before the state-index update:

`2e9b765baeba29746ed08f0526e98674228153bb`

File:

`research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`

Status:

`ARGUMENT / MATERIAL THEOREM CANDIDATE / CONDITIONAL GLOBAL TRANSFER / NOT INDEPENDENTLY REVIEWED`.

### Closed in the FPCRT-02 unit

1. **Exact fixed-prefix Fourier object.** For selected semiprime edges inside the prefix `p<=z=p_N`, the probability of the subset sum modulo `P_N` is an exact character sum with factors `1-theta+theta e(h/e)`.

2. **Congruence-to-exact alias transfer.** If every selected denominator satisfies `e>=z` and the total reciprocal load is bounded away from `2`, Hoeffding gives an alias error `exp(-c z)`, small enough to compare with the `1/P_N` Fourier normalization.

3. **Multiplicity-sensitive cyclic energy.** A unit multiset of size `M` and maximal residue multiplicity `mu` satisfies

   `E_r >= M^3/(12 mu^2 r^2)`.

4. **Prefix-native top-block sensors.** The actual prime block `z/2<s<=z`, reused against every low prime `r<sqrt(z)`, has cyclic energy `>> z/log z` uniformly in `r`. This follows from PNT abundance, Brun–Titchmarsh residue multiplicity, and the preceding energy lemma. No prescribed prime residue classes are required.

5. **Prefix-compatible edge architecture.** Sensor, high-control, and mass edges may all be chosen with semiprime denominator at least `z`, while using only primes at most `z`.

6. **Hyperbolic reciprocal capacity.** The total reciprocal mass of semiprimes `pq>=z`, `p<q<=z`, tends to

   `pi^2/12`.

7. **Uniform target tuning.** After the `o(1)` sensor/control load is reserved, a greedy mass selection gives exact mean `q` with one common Bernoulli parameter in `[1/3,1/2]` for every

   `q in [O(log log z/log z), 1/5]`.

8. **Major-frequency scale and exactness.** The main diagonal frequency sum is `>> V^(-1/2)`, while alias probabilities are exponentially smaller than `1/(P_N sqrt(V))`.

9. **Conditional global transfer theorem.** A quantitative high-coordinate control rate `HC-RATE(z)` implies exact fixed-prefix subset-sum coverage throughout the preceding target interval and hence a candidate rate

   `gamma_N = O(log log p_N/log p_N)`.

10. **Sparse least-prime obstruction.** A route using only a Linnik least-prime bound with exponent `L` cannot close the exact finite-prefix alias comparison unless `L<2`. The known unconditional exponent is above this threshold. This is a method obstruction, not an impossibility theorem for sparse high-interval realization.

### Preferred route change

The preferred finite-prefix route is now:

`top-block abundance sensors -> low-coordinate elimination -> high-coordinate control -> exact Fourier/alias transfer`.

The old interface `PREFIX-REALIZATION(A,X,B)` is no longer the first obstruction. It remains an independently interesting sparse-design question.

## Smallest revised gap

`HC-RATE(z)`:

> On dyadic high-prime blocks from scale `sqrt(z)` to scale `z`, prove an off-diagonal high-assignment partition estimate
>
> `offdiag <= epsilon_z / sigma_ctrl`
>
> with `epsilon_z=o(1/log z)`, uniformly for the Bernoulli parameter range used by the prefix construction.

The `o(1/log z)` rate is forced by the comparison

`sqrt(V)/sigma_ctrl = O(log z)`.

A qualitative eventual-smallness statement with an unspecified rate is insufficient for the current transfer theorem. A sufficiently explicit Peierls/global-partition estimate, or a direct high-coordinate proof with this rate, would close the only visible global Fourier obstruction.

## Current research classification

- conversation recovery: `COMPLETE`;
- local abundance theorem: `PROVED-ARGUMENT`;
- local sparse-design theorem: `PROVED-ARGUMENT`;
- simultaneous algebraic CRT realization: `PROVED-ARGUMENT`;
- fixed-prefix Fourier identity and alias transfer: `PROVED-ARGUMENT`;
- top-block prefix realization: `PROVED-ARGUMENT / EXTERNAL PNT+BRUN–TITCHMARSH INPUTS`;
- hyperbolic reciprocal-mass theorem: `PROVED-ARGUMENT / EXTERNAL PNT+MERTENS INPUTS`;
- uniform target tuning and major-frequency lower bound: `PROVED-ARGUMENT`;
- full global finite-prefix transfer: `CONDITIONAL ON HC-RATE(z)`;
- sparse least-prime-only route: `OBSTRUCTED AT CURRENT EXPONENT SCALE`;
- Li gap-free-floor consequence: `CONDITIONAL / NOT CLAIMED`;
- released Erdős 306 theorem status: unchanged.

## Next routine branch work

1. reconstruct the strongest quantitative high-coordinate partition rate already latent in the control/Peierls architecture;
2. determine whether it directly implies `HC-RATE(z)` or loses a logarithmic factor;
3. if the existing architecture is insufficient, isolate the smallest high-coordinate strengthening or counterexample;
4. optimize the sensor/control split only after the rate comparison is exact;
5. retain the sparse realization question as a secondary independent design problem, not the current blocking route.

Only a theorem, counterexample/obstruction, or exact smallest revised gap returns to issue #9.