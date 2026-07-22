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

## Reactivation

PORT-DIR reactivation comment: research-workbench issue #9 comment `5038620554`.

E306-RL acknowledgement: issue #9 comment `5043758484`.

Accepted execution order:

1. recover conversation-only finite-prefix CRT material;
2. advance the distribution-free abundance / sparse-design suppression question;
3. report only a material theorem, obstruction, or smallest exact gap to issue #9.

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

## Material theorem checkpoint

Theorem-source commit:

`38f5b1a84a5d0eb9c5793eb277e65d39bd1c1253`

File:

`research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`

Status:

`ARGUMENT / MATERIAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

### Closed locally

1. **Weighted cyclic-code theorem.** For arbitrary shifts and unit coefficients,

   `sum_x F(x) <= 1 + (r-1) exp(-2 D_*)`,

   where `D_*` is the minimum weighted squared circle distance of the cyclic code.

2. **Distribution-free abundance regime.** If

   `M >= ((A+1)/2) r^2 log r`,

   then the local partition function is at most `1+r^(-A)`.

3. **Sparse design regime.** For prime `r`, balanced weights admit a unit design with

   `m <= 192(A+1) log r + O(1)`

   and the same `1+r^(-A)` bound, uniformly in all shifts.

4. **Simultaneous low-prime design.** One `m=O_A(log X)` column matrix works for every prime `r<=X`.

5. **Semiprime CRT interpretation.** An edge `(r,s)` induces the unit `s^(-1) mod r` and an arbitrary shift; common high primes can be reused across all low stars.

6. **Algebraic realization.** Every sparse-design column is one reduced residue class modulo the low primorial.

### Honest boundary

The local theorem is not yet a Li gap-free-floor theorem. The remaining interfaces are:

- quantitative prime realization below a target finite-prefix bound;
- treatment of the remaining Fourier frequency lanes;
- conversion of the resulting Fourier estimate to the finite-prefix gap parameter;
- full load and main-frequency closure.

## Smallest visible missing implication

`PREFIX-REALIZATION(A,X,B)`:

For the simultaneous sparse-design matrix, produce `m<=C_A log X` distinct high primes `s_j<=B`, all larger than `X`, with

`s_j = u_(r,j)^(-1) mod r`

for every low prime `r<=X`, and choose `X=X(N)->infinity` so that

`B(X(N)) <= p_N`

at the target prefix while the remaining frequency and load estimates still imply the desired finite-prefix gap bound.

CRT consistency and qualitative prime existence are not the obstruction. The unresolved point is a prefix-compatible quantitative realization scale together with the global transfer.

## Current research classification

- conversation recovery: `COMPLETE`;
- local abundance theorem: `PROVED-ARGUMENT`;
- local sparse-design theorem: `PROVED-ARGUMENT`;
- simultaneous algebraic CRT realization: `PROVED-ARGUMENT`;
- prefix-compatible quantitative realization: `OPEN-INTERFACE`;
- full finite-prefix gap-free-floor route: `PARTIAL / NOT CLAIMED`.

## Next routine branch work

1. formulate the exact global Fourier object for `L^2(N)` and identify the frequency partition required after low-coordinate elimination;
2. derive the weakest quantitative `B(X)` sufficient for an explicit `gamma_N=o(1)` implication;
3. compare that required `B(X)` against available prime-in-progression inputs without importing them into released Erdős 306 authority;
4. test whether the abundance regime bypasses the sparse realization interface at an acceptable prefix/load scale;
5. search for an obstruction showing that `O_A(log X)` simultaneous columns cannot be realized within the required prefix scale.

Only a theorem, counterexample/obstruction, or exact smallest revised gap returns to issue #9.
