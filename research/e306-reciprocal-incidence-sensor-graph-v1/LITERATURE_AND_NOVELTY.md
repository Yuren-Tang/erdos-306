# Literature, Terminology, and Novelty

## 1. Controlling position

The correct description of this packet is:

> known graphical/Fourier framework with new arithmetic.

Finite-abelian character orthogonality, syndrome enumeration, normal
factor-graph duality, weight-enumerator methods for suitable additive codes,
signed/bidirected incidence language, and broad Potts/flow expansions are
classical. They must be cited as such.

The distinctive combination here is:

```text
prime-indexed heterogeneous vertex groups
+ one shared scalar three-point current on each unordered edge
+ reciprocal endpoint units q^(-1) mod p and p^(-1) mod q
+ source-uniform inverse-residue concentration
+ nested arithmetic dense-core elimination.
```

The source-uniform anti-concentration and `O(D^2 (log Z)^5)` dense-core entropy
theorem are the strongest plausible new components. A broad literature search
found no exact antecedent, but a negative search is not a proof of priority.

## 2. Framework map

### Finite Fourier and graphical duality

The exact coefficient identity is finite Fourier inversion for the push-forward
of a product measure through the ambient homomorphism

```text
partial_rec_tilde:Z^E->product_v Z/n_vZ.
```

After intersecting with arbitrary finite edge alphabets, the objects being
summed are alphabet-restricted homogeneous or affine fibres. In normal-factor-
graph language the coefficient identity is graphical Fourier duality. Goodall,
Forney, Mao--Kschischang, and Forney--Vontobel provide the relevant classical
frameworks.

No invention of finite-group Fourier duality or coding duality is claimed.

### Restricted fibres versus literal codes and cosets

For arbitrary finite alphabets `mathcal J_e subset Z`, the homogeneous fibre

```text
{j in product_e mathcal J_e:partial_rec_tilde j=0}
```

need not be a subgroup, and an affine fibre need not be a coset. Literal
kernel/coset, dimension, and linear-code language requires additive subgroup or
module hypotheses. The packet therefore uses alphabet-restricted fibre and
edge-symbol-resolved weighted enumerator terminology unless such structure is
explicitly assumed.

### Signed and bidirected sign skeleton

At the coefficient-forgetting level, a shared edge label entering both endpoint
equations with the same sign has the sign skeleton of an all-negative signed
edge, or a bidirected edge with matching half-edge orientations. Zaslavsky and
Bouchet provide the standard language.

This analogy is incomplete. Classical signed/bidirected incidence normally
uses one common coefficient group and endpoint multipliers `+/-1`. The present
operator has different vertex groups and endpoint-specific reciprocal units.

### Edge-symbol-resolved enumerators and MacWilliams comparators

The packet directly defines the polynomial

```text
W_beta(G;x)
 =sum_(j in F_beta)product_e x_(e,j_e).
```

The exact coefficient theorem evaluates this edge-symbol-resolved weighted
enumerator/partition function. Finite Fourier and normal-factor-graph duality
directly explain that identity.

MacWilliams and Wood provide comparator identities for suitable linear or
additive codes over finite fields, groups, rings, or modules. The packet proves
no MacWilliams identity for its generally nonlinear alphabet-restricted
reciprocal fibres, and those classical identities do not classify its minimal
supports or improve the arithmetic source-uniform concentration estimate.

### Observability and separators

Codes-on-graphs observability and graphical-model separator elimination supply
the structural language for affine syndrome messages and local elimination.
The new work is the arithmetic estimate controlling those messages uniformly
in their incoming sources. Lauritzen--Spiegelhalter, Pearl, and Forney--
Gluesing-Luerssen are structural comparators; no control-theoretic sensor-
placement theorem is used as a source for the packet's conditional separator.

### Random currents and Potts/Tutte comparators

The positive Fourier edge-current expansion resembles classical spin-to-edge
expansions, but it is not the Ising random-current measure. Ising switching
uses nonnegative integer multiplicities, factorial weights, and parity sources.
No imported switching lemma applies here. The exact source-convolution identity
does not preserve the three-point alphabet and is not a switching involution.

Likewise, an ordinary Tutte or flow polynomial generally loses the heterogeneous
moduli, reciprocal units, and symbol-sensitive edge weights. Arithmetic-Tutte
and matroids-over-rings sources are comparators, not reductions of this operator
to a standard invariant.

## 3. Terminology dictionary

| Packet term | Literature-facing interpretation | Status |
|---|---|---|
| ambient signless reciprocal incidence homomorphism | additive mixed-modulus incidence map on `Z^E` with same-sign reciprocal endpoint entries | exact |
| alphabet-restricted homogeneous fibre | intersection of the ambient kernel with the product edge alphabet | exact; not necessarily linear |
| alphabet-restricted affine fibre | prescribed-syndrome intersection with the product edge alphabet | exact; not necessarily a coset |
| reciprocal incidence code | permitted only with an additive/module hypothesis, or as explicitly qualified nonlinear shorthand | conditional terminology |
| positive Fourier edge-current expansion | nonnegative edge-symbol Fourier majorant | exact |
| edge-symbol-resolved weighted enumerator | directly defined fibre polynomial/partition function | exact |
| component factorization | product factorization over connected components | exact |
| balanced reciprocal relation | homogeneous three-point assignment plus global no-wrap | exact |
| support graph | graph on vertices incident to nonzero support edges | exact |
| support-core consequence | leaf-stripping/minimum-degree-two result | exact under local no-wrap |
| `2`-core restriction/zero-extension | bijection of restricted homogeneous fibres when every alphabet contains zero | exact under stated hypotheses |
| sensor | cross-edge family observing an eliminated vertex syndrome | architectural term |
| conditional separator | retained core receiving an arbitrary affine source | exact |
| reciprocal-CRT geometry | opposite-modulus inverse coefficients tied to a shared edge label | descriptive exact specialization |
| signed circuit / frame circuit | classical support-minimal object after a fixed algebraic representation | not established here |
| ordinary oriented cycle code | common-group oriented incidence kernel | not this operator |

## 4. Novelty matrix

| Component | Classification | Reason |
|---|---|---|
| finite-character coefficient extraction | known | ordinary orthogonality / finite Poisson summation |
| arbitrary affine sources | known | prescribed-syndrome version |
| product edge transforms | known | normal-factor-graph and code duality |
| positive symmetric three-point law | specialization | elementary Bernoulli fractional-power majorant |
| same-sign endpoint sign skeleton | specialization | all-negative signed/bidirected edge |
| heterogeneous cyclic groups | known separately | mixed-alphabet and finite-ring coding |
| reciprocal endpoint units tied to one shared current | new combination | no exact prior construction located |
| exact E306 reciprocal-CRT identity | new combination | classical theorem on a distinctive arithmetic model |
| exact source-convolution identity | immediate algebraic corollary | additivity of the ambient homomorphism |
| `2`-core restriction and enumerator factorization | immediate algebraic corollary | leaf stripping plus admissible zero-extension |
| odd-prime three-point distance at least four | immediate arithmetic/coding corollary | support core, no-wrap, and parity |
| separator min-entropy certificate | immediate probabilistic corollary | largest-atom bound from sourced elimination |
| exact hypergraph identity | immediate algebraic extension | the same CRT character factorization |
| decoder-image domination | known monotonicity | injective weighted subpartition |
| source-uniform terminal inverse-residue concentration | plausibly new | no matching arithmetic theorem located |
| nested dense-core elimination and joint entropy | plausibly new | principal new arithmetic theorem chain |
| minimum-degree-two support | known | local-check leaf stripping |
| signed/frame-circuit classification | not established | coefficient data and restricted edge law remain |
| direct CDC/5-CDC consequence | unsupported | required cover/decomposition theorems absent |

## 5. False analogies

1. **Ordinary oriented flow.** Replacing one endpoint sign by its negative
   changes the operator. It is not an orientation convention.
2. **Switching removes the arithmetic.** Signed switching can alter row signs;
   it cannot erase reciprocal units or heterogeneous groups.
3. **Even-subgraph expansion.** Minimum degree two is not even degree. The
   explicit `K_4` witness has support degree three everywhere.
4. **Ising switching lemma.** The current alphabets and weights differ, and
   source convolution leaves the original three-point family.
5. **MacWilliams applies automatically.** The actual restricted fibres need not
   be additive codes; no MacWilliams identity or circuit classification is
   proved for them.
6. **Two-core means cycle cover.** A two-core merely contains cycles. It need
   not decompose into edge-disjoint cycles or cover host edges.
7. **Observability implies anti-concentration.** Injectivity is qualitative;
   the theorem needs quantitative inverse-residue dispersion.
8. **CRT decouples the endpoints.** One scalar edge variable feeds both
   endpoints. Splitting it into independent endpoint labels changes the model.
9. **Positive Fourier coefficients imply FKG.** Positivity alone does not
   provide the lattice condition or ferromagnetic monotonicity.
10. **The graph identity creates many codewords.** Enumeration abundance comes
    from the separate representation-entropy theorem.

## 6. Citation groups

### Essential algebraic and graphical sources

- Tutte on common-group flows;
- Goodall on finite-abelian Fourier graphical applications;
- Kschischang--Frey--Loeliger on factor graphs;
- Forney on normal graph realizations and graphical duality;
- Mao--Kschischang on factor graphs and Fourier transform;
- Wood on finite-ring duality;
- MacWilliams on weight enumerators for linear codes.

### Signed/bidirected and support comparators

- Zaslavsky on signed graphs, switching, and frame matroids;
- Bouchet on bidirected integral flows;
- Beck--Zaslavsky and Kaiser--Rollová--Lukot'ka on signed flows;
- Fink--Moci on matroids over a ring;
- Chen, Lu--Luo--Zhang--Zhang, and Ren--Qian as modern signed-flow/frame-
  matroid comparators only.

These sources provide terminology and boundary comparisons. They do not supply
a signed-circuit classification for the reciprocal fibres.

### Probabilistic and separator comparators

- Griffiths--Hurst--Sherman, Aizenman, and Duminil-Copin for the distinct Ising
  random-current framework;
- Lauritzen--Spiegelhalter and Pearl for exact separator computation;
- Forney--Gluesing-Luerssen for observability and local reducibility.

### CRT and mixed-alphabet comparators

- Spiegel;
- Goldreich--Ron--Sudan;
- Borges and collaborators.

These show that CRT and unequal alphabets are known separately. They do not
contain the reciprocal graph coupling.

### Flow-cover boundary sources

Jaeger, Dezheng Xie--Cun-Quan Zhang, Siyan Liu--Rong-Xia Hao--Rong Luo--
Cun-Quan Zhang, and Lingsheng Shi--Zhang Zhang identify the much stronger
ordinary/signed flow and coverage hypotheses needed for CDC-type consequences.
Those hypotheses are absent here.

## 7. Claim discipline

Permitted restrained statements:

- the exact identity is an arithmetic specialization of classical finite-group
  Fourier and normal-factor-graph duality;
- the reciprocal-CRT mixed-modulus coefficient geometry is a new combination
  relative to located literature;
- source-uniform inverse-residue concentration and dense-core entropy are the
  strongest plausible new theorems;
- the sensor/separator formulation gives a reusable architecture;
- the listed `2`-core, low-weight, min-entropy, source-convolution, and
  hypergraph statements are immediate corollaries with their exact hypotheses.

Prohibited or unsupported statements:

- invention of finite-group Fourier duality;
- a MacWilliams identity for the actual reciprocal fibres;
- a new general spin-flow duality;
- an available random-current switching lemma;
- an ordinary Tutte-polynomial classification;
- a signed-circuit or frame-circuit classification;
- a direct CDC, 5-CDC, or AffineCDC consequence;
- priority certainty based only on a negative search.

## 8. Bibliographic implementation

`references.bib` contains the primary sources and authoritative surveys used by
this matrix. The Kaiser--Rollová--Lukot'ka item is recorded as its published
2017 survey. Duminil-Copin and Jaeger carry complete publication data. The
unrelated strategic-sensor-placement paper has been removed rather than used as
a source for the packet's conditional separator.

The internal theorem, application, audit, and disposition returns remain the
governing mathematical provenance; they are not substituted for external
citations when a framework is classical.
