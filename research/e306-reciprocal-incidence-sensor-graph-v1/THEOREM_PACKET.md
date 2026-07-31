# Theorem Packet

Throughout, write

```text
e(t)=exp(2 pi i t).
```

All finite cyclic residues are represented only when an ordinary integer
representative is needed. In phase expressions the choice of centred or
uncentred CRT representative is immaterial.

## 1. Exact mixed-modulus CRT graph coefficient theorem

Let `G=(V,E)` be a finite loopless multigraph. Parallel edges are allowed. Give
each vertex `v` an integer modulus `n_v>=2`, and assume the family `(n_v)` is
pairwise coprime. Put

```text
A_G=product_(v in V) Z/n_v Z.
```

For an edge `e={u,v}`, let `n_e=n_u n_v`. For `a in A_G`, let `h_e(a) mod n_e`
be the CRT lift satisfying

```text
h_e(a)=a_u mod n_u,
h_e(a)=a_v mod n_v.
```

For each edge take a finite nonnegative Fourier kernel

```text
K_e(t)=sum_(j in mathcal J_e)c_e(j)e(jt),
c_e(j)>=0,
C_e=sum_(j in mathcal J_e)c_e(j)>0,
```

where `mathcal J_e subset Z` is the finite edge alphabet/Fourier support. Let
`J_e` be the independent random variable taking values in `mathcal J_e` with

```text
Pr(J_e=j)=c_e(j)/C_e.
```

### Definition 1.1 — ambient signless reciprocal incidence homomorphism

Define the additive homomorphism

```text
partial_rec_tilde : Z^E -> A_G
```

by

```text
(partial_rec_tilde j)_v
 =sum_(e={v,w}) j_e n_w^(-1) mod n_v.
```

Its restriction to the finite product alphabet is denoted

```text
partial_rec=partial_rec_tilde|_(product_e mathcal J_e).
```

The same scalar edge label enters both endpoint equations with the same sign.
The endpoint coefficient is the inverse of the opposite modulus. This is the
signless reciprocal incidence homomorphism; it is not obtained by choosing an
orientation of an ordinary incidence matrix.

For `beta in A_G`, define the alphabet-restricted affine fibre

```text
F_beta(G,n,mathcal J)
 ={j in product_e mathcal J_e:partial_rec_tilde j=beta}.
```

The homogeneous restricted fibre is `F_0`. These restricted fibres need not be
cosets, and `F_0` need not be a linear code, because an arbitrary finite product
alphabet need not be an additive subgroup of the ambient domain. Literal
kernel/coset or linear-code language is valid only after a separate additive
label group, subgroup, or module domain compatible with the syndrome map has
been supplied.

### Theorem 1.2 — exact sourced coefficient identity

For every source vector

```text
beta=(beta_v) in A_G,
```

one has

```text
Z_G(beta)
:=sum_(a in A_G)
   e(-sum_v beta_v a_v/n_v)
   product_(e={u,v}) K_e(h_e(a)/(n_u n_v))

 =product_(v in V)n_v
  *sum_(j in F_beta(G,n,mathcal J)) product_(e in E)c_e(j_e)

 =product_(v in V)n_v
  *product_(e in E)C_e
  *Pr(partial_rec_tilde J=beta).
```

The identity remains valid for absolutely summable nonnegative Fourier
coefficients by absolute convergence.

### Corollary 1.3 — alphabet-restricted sourced fibres and enumerator evaluation

For independent variables `x_(e,j)` indexed by `e in E` and
`j in mathcal J_e`, define the edge-symbol-resolved weighted enumerator

```text
W_beta(G;x)
 =sum_(j in F_beta(G,n,mathcal J))
    product_(e in E)x_(e,j_e).
```

Then Theorem 1.2 says exactly

```text
Z_G(beta)=product_v n_v * W_beta(G;c).
```

Thus the zero-source coefficient is an edge-symbol-resolved weighted
enumerator/partition-function evaluation of the homogeneous restricted fibre,
and the arbitrary-source coefficient is the corresponding affine-fibre
evaluation. No MacWilliams identity for these generally nonlinear restricted
fibres is asserted.

On the ambient domain `Z^E`, `ker(partial_rec_tilde)` is of course an additive
subgroup and every nonempty full inverse image is a coset of that kernel. More
generally, if an additive allowed-label subgroup or module `B` and a compatible
syndrome homomorphism on `B` are separately supplied, then the homogeneous
fibre in `B` is a literal kernel and its nonempty affine fibres are cosets. An
arbitrary finite product alphabet does not acquire that structure merely by
restriction.

### Corollary 1.4 — component factorization

If `G` is the disjoint union of components `G_1,...,G_s`, with source vector
`beta=(beta^(1),...,beta^(s))`, then

```text
Z_G(beta)=product_(i=1)^s Z_(G_i)(beta^(i)),
```

and

```text
Pr(partial_rec_tilde J=beta)
 =product_(i=1)^s
   Pr(partial_rec_tilde^(i) J^(i)=beta^(i)).
```

No source-balance condition is hidden across different components.

### Theorem 1.5 — exact source-convolution identity

Let `c_e` and `d_e` be two finite nonnegative coefficient systems on integer
edge labels, and define their edgewise additive convolution

```text
r_e(k)=sum_(i+j=k)c_e(i)d_e(j).
```

Write

```text
N=product_(v in V)n_v,
```

and let `Z_c`, `Z_d`, and `Z_r` denote the sourced coefficients obtained from
the three systems. Then, for every `beta in A_G`,

```text
Z_r(beta)
 =(1/N) sum_(gamma in A_G)
    Z_c(gamma)Z_d(beta-gamma).
```

This is an exact source-convolution identity arising from additivity of
`partial_rec_tilde`. It is not a random-current switching lemma: it neither
switches supports nor preserves the original three-point alphabet.

## 2. Bernoulli three-point specialization

Let

```text
f_e(t)=|(1-theta_e)+theta_e e(t)|,
nu_e=theta_e(1-theta_e),
0<theta_e<1,
0<lambda_e<=1.
```

### Proposition 2.1 — positive fractional-power majorant

For every real `t`,

```text
f_e(t)^lambda_e
 <=1-lambda_e nu_e
   +(lambda_e nu_e/2)e(t)
   +(lambda_e nu_e/2)e(-t).
```

The right side is the characteristic function of the three-point law on
`mathcal J_e={-1,0,1}`:

```text
Pr(J_e=0)=1-lambda_e nu_e,
Pr(J_e=1)=lambda_e nu_e/2,
Pr(J_e=-1)=lambda_e nu_e/2.
```

Consequently Theorem 1.2 applies edge by edge to the Bernoulli modulus.

The algebra permits edge-dependent `theta_e` and `lambda_e`. Arithmetic
concentration constants are uniform only when the activities

```text
eta_e=lambda_e theta_e(1-theta_e)
```

are bounded below on the edges used for mixing. When `theta_e` ranges in a
fixed compact set `Theta subset (0,1)` and `lambda_e` ranges in a fixed compact
set `Lambda subset (0,1]`, constants depending on both ranges are denoted
`c_(Theta,Lambda)`. No uniform concentration statement is asserted when the
activity tends to zero.

## 3. Reciprocal sums and homogeneous syndromes

Put

```text
N=product_(v in V)n_v,
R(j)=sum_(e={u,v}) j_e/(n_u n_v).
```

### Theorem 3.1 — syndrome/integer-reciprocal equivalence

For every integer edge-label vector `j in Z^E`,

```text
partial_rec_tilde j=0
iff
R(j) is an integer.
```

### Corollary 3.2 — exact no-wrap relation

If

```text
partial_rec_tilde j=0
```

and

```text
sum_e |j_e|/(n_u n_v)<1,
```

then

```text
sum_(e={u,v}) j_e/(n_u n_v)=0.
```

For `j_e in {-1,0,1}`, its positive and negative supports therefore give an
exact balanced signed reciprocal relation. The congruence-to-equality step is a
separate no-wrap argument after the homogeneous syndrome has been established.

## 4. Support-core and exact `2`-core restriction

For an integer label vector `j`, define its support graph by

```text
E[j]={e in E:j_e!=0},
V[j]={v in V:v is incident with an edge of E[j]},
G[j]=(V[j],E[j]).
```

Thus isolated ambient vertices are not included when minimum support degree is
stated.

### Theorem 4.1 — local-no-wrap support core

Let `j` be a nonzero element of the homogeneous restricted fibre. Assume the
exact local no-wrap condition

```text
j_e!=0 and v in e  ==>  n_v does not divide j_e.
```

Then the support graph `G[j]` has minimum degree at least `2`. Hence:

1. every support component contains a graph cycle;
2. every support edge lies in the graph-theoretic `2`-core of `G`;
3. if `G` is simple, every nonzero support has at least the girth of its
   component;
4. a forest admits no nonzero homogeneous assignment satisfying the displayed
   local-no-wrap condition.

For the three-point alphabet, the local condition is automatic because
`j_e=+/-1` and every `n_v>=2`.

This theorem is a support-core consequence only. It does not say that the
support is Eulerian, a signed circuit, a frame circuit, a cycle cover, or a
minimal code support.

### Theorem 4.2 — exact `2`-core restriction and zero-extension

Assume, for every edge `e`, that

```text
0 in mathcal J_e,
```

and every allowed nonzero symbol is nondivisible by either endpoint modulus:

```text
j in mathcal J_e\{0}, v in e  ==>  n_v does not divide j.
```

Let `K=core_2(G)`. Give each core edge its original alphabet. Then restriction
to `E(K)` and zero-extension on `E\E(K)` are inverse bijections between the
alphabet-restricted homogeneous fibres:

```text
F_0(G,n,mathcal J)  <->  F_0(K,n|_(V(K)),mathcal J|_(E(K))).
```

In particular, for the edge-symbol-resolved enumerator of Corollary 1.3,

```text
W_0(G;x)
 =product_(e notin E(K))x_(e,0) * W_0(K;x).
```

A forest therefore has homogeneous restricted fibre exactly equal to the
singleton zero assignment under the displayed zero-symbol and nondivisibility
hypotheses. This is a nonlinear alphabet-restricted bijection, not a dimension
or linear-code statement unless additional module hypotheses are imposed.

### Corollary 4.3 — odd-prime three-point minimum distance

Let `G` be simple, let the vertex moduli be distinct odd primes, and take

```text
mathcal J_e={-1,0,1}
```

on every edge. Every nonzero homogeneous restricted assignment has Hamming
weight at least `4`.

The odd-prime hypothesis is essential: on the triangle with moduli `2,3,5`,

```text
1/6-1/10-1/15=0.
```

### Example 4.4 — explicit non-Eulerian `K_4` homogeneous witness

On `K_4` with vertex moduli `5,7,11,13`, order the six edges as

```text
5*7, 5*11, 5*13, 7*11, 7*13, 11*13
```

and assign labels

```text
-1,   +1,   +1,    +1,   -1,    -1.
```

Then

```text
-1/35+1/55+1/65+1/77-1/91-1/143=0,
```

so Theorem 3.1 gives a homogeneous syndrome. The support is all of `K_4` and
has degree `3` at every vertex. Homogeneous reciprocal supports therefore need
not be Eulerian, ordinary cycles, signed circuits, or cycle covers.

## 5. Sourced separator elimination

For any induced graph `G[W]` equipped with the inherited internal edge family,
define

```text
P_(G[W])
 =sup_(beta in product_(v in W)Z/n_vZ)
    Pr(partial_rec_tilde^(G[W]) J=beta),
M_(G[W])
 =product_(v in W)n_v * P_(G[W]).
```

Write `P_G=P_(G[V])` and `M_G=M_(G[V])`.

Let `C subset V`, put `O=V\C`, and decompose the edge set into

```text
E=E[C] disjoint-union E[O] disjoint-union E(O,C).
```

Condition on all labels on `E[O]`. For each `p in O`, let

```text
F_p={e={p,q}:q in C}
```

and define the source-uniform row concentration

```text
rho_p
 =sup_(t mod n_p)
   Pr(
     sum_(e={p,q} in F_p)J_e n_q^(-1)
      =t mod n_p
   ).
```

### Theorem 5.1 — sourced separator elimination

For every source vector `beta` and every fixed value of the internal labels on
`E[O]`,

```text
Pr(partial_rec_tilde J=beta | J|_(E[O]))
 <=product_(p in O)rho_p
   *P_(G[C]).
```

After averaging over `J|_(E[O])`,

```text
P_G
 <=product_(p in O)rho_p * P_(G[C]).
```

Equivalently,

```text
M_G
 <=product_(p in O)(n_p rho_p) * M_(G[C]).
```

The induced source on `C` may depend on all exposed and eliminated labels. The
supremum in `P_(G[C])` makes the inequality source-uniform.

### Corollary 5.2 — separator min-entropy certificate

Suppose a nested elimination removes the vertices `O` and leaves terminal core
`C`. If

```text
M_(G[C])<=T
```

and every removed row satisfies

```text
n_p rho_p<=1+epsilon_p,
```

then

```text
max_beta Pr(partial_rec_tilde J=beta)
 <=T product_(p in O)(1+epsilon_p)
   /product_(v in V)n_v.
```

Equivalently, with natural logarithms,

```text
H_infinity(partial_rec_tilde J)
 >=sum_(v in V)log n_v
   -log T
   -sum_(p in O)log(1+epsilon_p).
```

This is a maximum-atom/min-entropy certificate. It is not a total-variation
statement and is not by itself a lower bound for the number of homogeneous
assignments.

### Definition 5.3 — conditional sensor-separator architecture

A graph family admits a conditional sensor-separator proof if it has a nested
sequence

```text
V=C_0 superset C_1 superset ... superset C_m
```

such that at stage `i`:

1. edges internal to `C_i\C_(i+1)` are exposed;
2. each removed vertex has a disjoint family of cross edges into `C_(i+1)`
   whose reciprocal sum has a source-uniform bound `rho_p`;
3. the unexposed core receives an arbitrary affine source and is estimated
   uniformly in that source;
4. the product of all factors `n_p rho_p`, together with the terminal-core
   contribution, is controlled.

The separator theorem is algebraic. A successful application must additionally
supply arithmetic inverse-residue dispersion, an admissible decoder image,
coverage of hidden target directions, retained residual damping, and final
quotient/no-wrap semantics.

Terminal and interior sensing are two sufficient realizations of this same
conditional architecture; neither is declared universally optimal.

## 6. Decoder image and hypergraph algebra

Let `A` be a finite assignment set, let `S` be a finite sensor-state set, and
let

```text
C:S->A
```

be a completion map. Let `W:A->[0,infinity)` be a nonnegative weight.

### Proposition 6.1 — decoder-image domination

If `C` is injective, then

```text
sum_(s in S) W(C(s))
 <=sum_(a in A)W(a).
```

In the literal sensor construction, the accepted decoder determines every
nonsensor coordinate from the sensor assignment and the coherent label.
Different sensor assignments retain different sensor coordinates, so the
completion map is injective. The actual decoder image is therefore a monotone
weighted subpartition of the full anchor partition. This is separate from the
complex identity of Theorem 1.2.

### Theorem 6.2 — exact algebraic hypergraph extension

Let `H=(V,E)` be a finite loopless hypergraph with pairwise coprime vertex
moduli. Put

```text
n_e=product_(v in e)n_v
```

and define the ambient additive map

```text
(partial_rec_tilde^H j)_v
 =sum_(e containing v)
   j_e (product_(w in e\{v})n_w)^(-1)
   mod n_v.
```

For finite nonnegative edge kernels supported on integer alphabets, the same
CRT character expansion gives the sourced coefficient identity with
`partial_rec_tilde^H` in place of `partial_rec_tilde`. Moreover, for every
integer hyperedge-label vector,

```text
partial_rec_tilde^H j=0
iff
sum_(e in E)j_e/n_e is an integer.
```

Under the analogous local no-wrap hypothesis, a nonzero support hypergraph has
no vertex of support degree one.

This theorem is algebraic only. It supplies no source-uniform inverse-product
concentration for complete higher-uniformity prime-product families.

## 7. Inherited audited literal thin-sensor theorem

Theorems 7.1–7.3 are inherited audited providers and dependency statements from
the accepted one-anchor system. This packet records their exact hypotheses and
how the reciprocal-incidence algebra enters; it does not claim a self-contained
reproof of prime supply, divisor dispersion, target observability, Taylor
control, retained damping, quotient positivity, or no-wrap.

Let

```text
ell=log Z,
B_H={q prime:Z-H<=q<Z},
```

with `Z` tending to infinity. Let `D>=1` denote the bounded/subpower arithmetic
complexity parameter occurring in the accepted divisor-dispersion and
target-row system. Let the Bernoulli parameter stay in a fixed compact set
`Theta subset (0,1)`. Let `lambda` be fixed in `(0,1]`, or range over a compact
set `Lambda subset (0,1]` bounded away from `0`.

Assume the inherited providers from the accepted one-anchor system:

1. prime supply in the sensor and retained intervals;
2. pairwise-coprime prime moduli and exact CRT factorization;
3. the exact factor partition into sensor, row, and retained-skeleton factors;
4. target observability on the stated decoder range;
5. retained lower-lower damping on the minor lanes;
6. Taylor control on the major lane;
7. quotient positivity followed by deterministic no-wrap.

### Theorem 7.1 — inherited actual-kernel anchor theorem

Suppose

```text
H^2 >> Z D^3 ell^8.
```

Then the full literal weighted anchor partition and its energy-above-floor tail
obey the accepted polynomial/exponentially damped bounds. More precisely, the
decoder image is dominated by the full anchor partition; the positive Fourier
edge-current expansion majorizes every fractional-power modulus by the
three-point reciprocal-incidence model; source-uniform terminal concentration
and inherited nested dense-core elimination bound the logarithm of the
surviving joint-current family by

```text
O(D^2 ell^5);
```

and the reciprocal energy floor dominates that entropy under the displayed
condition.

The implicit constants may depend on `Theta` and `Lambda`; they are uniform
when both range over the fixed compact sets just stated.

### Theorem 7.2 — inherited source-uniform terminal row concentration

Let `p` be a prime row modulus and let `F` be `s` distinct sensor primes lying
in an interval of diameter `K`, with

```text
p notin F.
```

Assume the inherited divisor-dispersion provider in its exact usable form:
for every nonzero `d mod p`,

```text
sum_(q in F)||d q^(-1)/p||^2
 >>s^3/(K^2D^2),
```

where `D` is the divisor/multiplicity parameter of that provider. For
independent three-point currents whose activities range in a fixed compact set
bounded away from zero, uniformly in the affine source `t mod p`,

```text
sup_t Pr(
  sum_(q in F) J_q q^(-1)=t mod p
 )
 <=1/p+exp(-c_(Theta,Lambda)s^3/(K^2D^2)).
```

The statement survives conditioning on every already exposed edge because the
remaining row variables are the actual unexposed shared edge variables and the
target is allowed to be arbitrary.

### Theorem 7.3 — inherited row-specific decoding and global closure

For a row modulus `r`, the accepted absolute decoder range is

```text
|m| << Z min(r,H)/ell.
```

The corresponding row-distance providers may be written, up to fixed constants,
as

```text
D_r >> H/ell^3                 when r<=H,
D_r >> H^3/(r^2 ell^3)         when r>H.
```

Summing the absolute off-decoder tails over all rows closes whenever

```text
H^3 >> Z^2 ell^4.
```

Under the inherited major, retained-skeleton, quotient, and no-wrap providers,
this yields the complete literal terminal one-scale theorem.

Writing

```text
Gamma=log Z/log H,
H=Z^(1/Gamma),
```

the theorem covers every fixed

```text
Gamma<3/2.
```

The equality case `Gamma=3/2` is not included.

## 8. Logical status ledger

- Theorems 1.2, 1.5, 3.1, 4.1, 4.2, 5.1, and 6.2 are exact finite algebraic
  statements.
- Corollary 4.3 and Example 4.4 are exact immediate consequences with all
  stated alphabet, simplicity, odd-prime, and no-wrap qualifications.
- Corollary 5.2 is an exact maximum-atom/min-entropy consequence of separator
  elimination.
- Proposition 2.1 is an elementary positive Fourier majorant.
- Proposition 6.1 is an exact monotonicity statement; its application uses the
  separately verified injectivity of the decoder completion.
- Theorems 7.1–7.3 are inherited audited providers/dependency statements and
  retain every stated hypothesis and uniformity qualification.
- Finite Fourier/normal-factor-graph duality directly explains Theorem 1.2.
  MacWilliams and Wood supply comparator identities only for suitable
  additive/linear codes; no such identity is proved here for the actual
  alphabet-restricted reciprocal fibres.
- The graph algebra alone neither proves abundance of nonzero homogeneous
  assignments nor supplies any cycle-cover conclusion.
