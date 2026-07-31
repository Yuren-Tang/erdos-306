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
K_e(t)=sum_(j in J_e)c_e(j)e(jt),
c_e(j)>=0,
C_e=sum_(j in J_e)c_e(j)>0.
```

Let the edge labels `J_e` be independent with

```text
Pr(J_e=j)=c_e(j)/C_e.
```

### Definition 1.1 — signless reciprocal incidence operator

Define

```text
partial_rec : product_(e in E) J_e
              -> product_(v in V) Z/n_v Z
```

by

```text
(partial_rec j)_v
 =sum_(e={v,w}) j_e n_w^(-1) mod n_v.
```

The same scalar edge label enters both endpoint equations with the same sign.
The endpoint coefficient is the inverse of the opposite modulus. This is the
signless reciprocal incidence operator; it is not obtained by choosing an
orientation of an ordinary incidence matrix.

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
  *product_(e in E)C_e
  *Pr(partial_rec J=beta).
```

The identity remains valid for absolutely summable nonnegative Fourier
coefficients by absolute convergence.

### Corollary 1.3 — syndrome cosets and homogeneous weighted enumerator

The contributing label set is the affine syndrome fibre

```text
partial_rec^(-1)(beta).
```

For `beta=0`, define the signless reciprocal incidence code

```text
C_rec(G,n,J)=ker(partial_rec).
```

Then

```text
Z_G(0)
 =product_v n_v
  *sum_(j in C_rec) product_e c_e(j_e).
```

Thus the zero-source coefficient is a complete edge-symbol weighted enumerator
of the homogeneous code. The arbitrary-source coefficient is the corresponding
affine coset enumerator.

### Corollary 1.4 — component factorization

If `G` is the disjoint union of components `G_1,...,G_s`, with source vector
`beta=(beta^(1),...,beta^(s))`, then

```text
Z_G(beta)=product_(i=1)^s Z_(G_i)(beta^(i)),
```

and

```text
Pr(partial_rec J=beta)
 =product_(i=1)^s
   Pr(partial_rec^(i) J^(i)=beta^(i)).
```

No source-balance condition is hidden across different components.

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

The right side is the characteristic function of the three-point law

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

are bounded below on the edges used for mixing. No uniform concentration
statement is asserted when `eta_e` tends to zero.

## 3. Reciprocal sums and homogeneous syndromes

Put

```text
N=product_(v in V)n_v,
R(j)=sum_(e={u,v}) j_e/(n_u n_v).
```

### Theorem 3.1 — syndrome/integer-reciprocal equivalence

For every integer edge-label vector `j`,

```text
partial_rec j=0
iff
R(j) is an integer.
```

### Corollary 3.2 — exact no-wrap relation

If

```text
j in ker(partial_rec)
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

## 4. Support-core consequence

### Theorem 4.1 — local-no-wrap support core

Let `j` be a nonzero homogeneous codeword. Assume the exact local no-wrap
condition

```text
j_e!=0 and v in e  ==>  n_v does not divide j_e.
```

Then the support graph

```text
supp(j)={e in E:j_e!=0}
```

has minimum degree at least `2`. Hence:

1. every nonzero support component contains a graph cycle;
2. the support is contained in the graph-theoretic `2`-core of `G`;
3. if `G` is simple, every nonzero support has at least the girth of its
   component;
4. a forest supports only the zero codeword.

For the three-point law, the local condition is automatic because
`j_e=+/-1` and every `n_v>=2`.

This theorem is a support-core consequence only. It does not say that the
support is Eulerian, a signed circuit, a frame circuit, a cycle cover, or a
minimal code support.

## 5. Sourced separator elimination

For a vertex set `W`, define the normalized maximal sourced mass

```text
P_G(W)=sup_beta Pr(partial_rec J=beta),
M_G(W)=product_(v in W)n_v * P_G(W),
```

with the graph and edge family understood from context.

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
Pr(partial_rec J=beta | J|_(E[O]))
 <=product_(p in O)rho_p
   *sup_(gamma in product_(q in C)Z/n_qZ)
      Pr(partial_rec^C J|_(E[C])=gamma),
```

where `partial_rec^C` is the reciprocal incidence operator of the induced core
graph on `C`.

After averaging over `J|_(E[O])`,

```text
P_G(V)
 <=product_(p in O)rho_p * P_(G[C])(C).
```

Equivalently,

```text
M_G(V)
 <=product_(p in O)(n_p rho_p) * M_(G[C])(C).
```

The induced source on `C` may depend on all exposed and eliminated labels. The
supremum over `gamma` makes the inequality source-uniform.

### Definition 5.2 — conditional sensor-separator architecture

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

## 6. Decoder image

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

## 7. Accepted literal thin-sensor theorem

Let

```text
ell=log Z,
B_H={q prime:Z-H<=q<Z},
```

with `Z` tending to infinity. Let `D>=1` denote the bounded/subpower arithmetic
complexity parameter occurring in the accepted divisor-dispersion and
target-row system. Let the Bernoulli parameter stay in a fixed compact
subinterval of `(0,1)`. Let `lambda in (0,1]` be fixed, or range over a compact
subinterval of `(0,1]` bounded away from `0`.

Assume the inherited providers from the accepted one-anchor system:

1. prime supply in the sensor and retained intervals;
2. pairwise-coprime prime moduli and exact CRT factorization;
3. the exact factor partition into sensor, row, and retained-skeleton factors;
4. target observability on the stated decoder range;
5. retained lower-lower damping on the minor lanes;
6. Taylor control on the major lane;
7. quotient positivity followed by deterministic no-wrap.

### Theorem 7.1 — actual-kernel anchor theorem

Suppose

```text
H^2 >> Z D^3 ell^8.
```

Then the full literal weighted anchor partition and its energy-above-floor tail
obey the accepted polynomial/exponentially damped bounds. More precisely, the
decoder image is dominated by the full anchor partition; the positive Fourier
edge-current expansion turns every fractional-power modulus into the
three-point reciprocal-incidence model; source-uniform terminal concentration
and nested dense-core elimination bound the logarithm of the surviving
joint-current family by

```text
O(D^2 ell^5);
```

and the reciprocal energy floor dominates that entropy under the displayed
condition.

The implicit constants may depend on the fixed Bernoulli compact set and on
fixed `lambda`; they are uniform when `lambda` ranges over a compact set bounded
away from `0`.

### Theorem 7.2 — source-uniform terminal row concentration

Let `p` be a prime row modulus, let `F` be `s` distinct sensor primes lying in
an interval of diameter `K`, and let the divisor/multiplicity parameter be at
most `D`. For independent three-point currents of fixed positive activity,

```text
sum_(q in F)||d q^(-1)/p||^2
 >> s^3/(K^2 D^2)
```

for every nonzero `d mod p`. Consequently, uniformly in the affine source
`t mod p`,

```text
sup_t Pr(
  sum_(q in F) J_q q^(-1)=t mod p
 )
 <=1/p+exp(-c_lambda s^3/(K^2D^2)).
```

The statement survives conditioning on every already exposed edge because the
remaining row variables are the actual unexposed shared edge variables and
the target is allowed to be arbitrary.

### Theorem 7.3 — row-specific decoding and global closure

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

- Theorems 1.2, 3.1, 4.1, and 5.1 are exact finite algebraic theorems.
- Proposition 2.1 is an elementary positive Fourier majorant.
- Proposition 6.1 is an exact monotonicity statement; its application uses the
  separately verified injectivity of the decoder completion.
- Theorems 7.1–7.3 are the accepted arithmetic thin-sensor package and retain
  every stated provider and uniformity qualification.
- The graph algebra alone neither proves abundance of nonzero codewords nor
  supplies any cycle-cover conclusion.
