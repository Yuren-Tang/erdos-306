# Literature, Terminology, and Novelty

## 1. Controlling position

The correct description of this packet is:

> known graphical/Fourier framework with new arithmetic.

Finite-abelian character orthogonality, syndrome/coset enumeration, normal
factor-graph duality, complete weight enumerators, signed/bidirected incidence
language, and broad Potts/flow expansions are classical. They must be cited as
such.

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
of a product measure through a homomorphism. In coding language it is a
syndrome/coset enumerator. In normal-factor-graph language it is graphical
Fourier duality. Goodall, Forney, Mao--Kschischang, and
Forney--Vontobel provide the relevant classical frameworks.

No invention of finite-group Fourier duality or coding duality is claimed.

### Signed and bidirected sign skeleton

At the coefficient-forgetting level, a shared edge label entering both endpoint
equations with the same sign has the sign skeleton of an all-negative signed
edge, or a bidirected edge with matching half-edge orientations. Zaslavsky and
Bouchet provide the standard language.

This analogy is incomplete. Classical signed/bidirected incidence normally
uses one common coefficient group and endpoint multipliers `+/-1`. The present
operator has different vertex groups and endpoint-specific reciprocal units.

### Complete weight enumerators

The homogeneous kernel and affine fibres admit edge-symbol-resolved weighted
enumerators. MacWilliams and finite-ring duality explain the abstract
transform. They do not classify support-minimal current configurations and do
not improve the arithmetic source-uniform concentration estimate.

### Observability and separators

Codes-on-graphs observability and graphical-model separator elimination supply
the structural language for affine syndrome messages and local elimination.
The new work is the arithmetic estimate controlling those messages uniformly
in their incoming sources.

### Random currents and Potts/Tutte comparators

The positive Fourier edge-current expansion resembles classical spin-to-edge
expansions, but it is not the Ising random-current measure. Ising switching
uses nonnegative integer multiplicities, factorial weights, and parity sources.
No imported switching lemma applies here.

Likewise, an ordinary Tutte or flow polynomial generally loses the heterogeneous
moduli, reciprocal units, and symbol-sensitive edge weights.

## 3. Terminology dictionary

| Packet term | Literature-facing interpretation | Status |
|---|---|---|
| signless reciprocal incidence operator | mixed-modulus parity-check/incidence homomorphism with same-sign endpoint entries | exact |
| signless reciprocal incidence code | homogeneous kernel of that operator | exact |
| positive Fourier edge-current expansion | nonnegative edge-symbol Fourier expansion | exact |
| sourced reciprocal current | affine syndrome fibre | exact |
| component factorization | product factorization over connected components | exact |
| balanced reciprocal relation | homogeneous three-point codeword plus global no-wrap | exact |
| support-core consequence | leaf-stripping/minimum-degree-two result | exact under local no-wrap |
| sensor | cross-edge family observing an eliminated vertex syndrome | architectural term |
| conditional separator | retained core receiving an arbitrary affine source | exact |
| reciprocal-CRT geometry | opposite-modulus inverse coefficients tied to a shared edge label | descriptive exact specialization |
| signed circuit / frame circuit | classical support-minimal object after a fixed algebraic representation | not established here |
| ordinary oriented cycle code | common-group oriented incidence kernel | not this operator |

## 4. Novelty matrix

| Component | Classification | Reason |
|---|---|---|
| finite-character coefficient extraction | known | ordinary orthogonality / finite Poisson summation |
| arbitrary affine sources | known | syndrome/coset version |
| product edge transforms | known | normal-factor-graph and code duality |
| positive symmetric three-point law | specialization | elementary Bernoulli fractional-power majorant |
| same-sign endpoint sign skeleton | specialization | all-negative signed/bidirected edge |
| heterogeneous cyclic groups | known separately | mixed-alphabet and finite-ring coding |
| reciprocal endpoint units tied to one shared current | new combination | no exact prior construction located |
| exact E306 reciprocal-CRT identity | new combination | classical theorem on a distinctive arithmetic model |
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
3. **Even-subgraph expansion.** Minimum degree two is not even degree, and a
   homogeneous reciprocal support need not be Eulerian.
4. **Ising switching lemma.** The current alphabets and weights differ, so the
   convolution identity behind switching is unavailable.
5. **MacWilliams classifies circuits.** It transforms enumerators; minimal
   support needs additional algebra.
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
- MacWilliams on weight enumerators.

### Signed/bidirected and support comparators

- Zaslavsky on signed graphs, switching, and frame matroids;
- Bouchet on bidirected integral flows;
- Beck--Zaslavsky and the signed-flow survey;
- Fink--Moci on matroids over a ring.

These sources provide terminology and warnings. They do not supply a
signed-circuit classification for the actual reciprocal code.

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

Jaeger, Xie--Zhang, Liu--Hao--Luo--Zhang, and signed cycle-double-cover work
identify the much stronger ordinary/signed flow and coverage hypotheses needed
for CDC-type consequences. Those hypotheses are absent here.

## 7. Claim discipline

Permitted restrained statements:

- the exact identity is an arithmetic specialization of classical finite-group
  Fourier/coding duality;
- the reciprocal-CRT mixed-modulus coefficient geometry is a new combination
  relative to located literature;
- source-uniform inverse-residue concentration and dense-core entropy are the
  strongest plausible new theorems;
- the sensor/separator formulation gives a reusable architecture.

Prohibited or unsupported statements:

- invention of finite-group Fourier duality;
- a new general spin-flow duality;
- an available random-current switching lemma;
- an ordinary Tutte-polynomial classification;
- a signed-circuit or frame-circuit classification;
- a direct CDC, 5-CDC, or AffineCDC consequence;
- priority certainty based only on a negative search.

## 8. Bibliographic implementation

`references.bib` contains the primary sources and authoritative surveys used by
this matrix. The internal theorem and audit returns remain the governing
mathematical provenance; they are not substituted for external citations when
a framework is classical.
