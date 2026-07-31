# Recovered holistic manuscript source provenance

## Historical base

The recovered manuscript source was integrated over the historical branch head:

`ed4718df243d252669030c870ac22a11f1c73c1c`

## Verified recovery objects

- complete forensic-reconstruction package SHA-256:
  `6fe6437d3835deb797b3b1c6c6cba76147b1bc94688832c418cd4e4103c6bab8`;
- recovered source archive SHA-256:
  `5e684960e0ce02396071696404b2323db3b1631ea172979720942655aaa29174`;
- surviving and reconstructed evidence PDF SHA-256:
  `d0bc466283dc591b90e7039bb6461ecaa040d6a80b63d7270c1211e7377992c2`.

The source was recovered by the local-only role
`E306-MANUSCRIPT-PDF-FORENSIC-RECONSTRUCTION-01`, which returned:

`[RECOVERED-CANDIDATE E306-MANUSCRIPT-PDF-FORENSIC-RECONSTRUCTION-01]`

According to the verified recovery package, the recovered source rebuilds the surviving 42-page evidence PDF and matches it byte-for-byte when built with the recorded reproducible-build environment.

## Provenance limitation

This is a forensic reconstruction of the lost holistic manuscript source, not a claim that every invisible source detail is historically identical to the lost working tree. Comments not represented in the PDF, whitespace choices, and mathematically or typographically equivalent TeX syntax cannot be recovered from the surviving rendered evidence alone.

The exact integration commit SHA is intentionally not self-recorded in this file. It is recorded in controlling issue `#8`, draft PR `#9`, and the integration role's terminal return.

## Transport-only source segmentation

Because the integration connector imposes a per-object payload limit below the size of the recovered Section 10 source file, that file is stored as a two-line wrapper followed by two contiguous source fragments. Concatenating `10_quantitative_multiplicity_part1.tex` and `10_quantitative_multiplicity_part2.tex` reproduces the verified archive file byte-for-byte. The split is at a subsection boundary, changes no mathematical text, and the maintained build produces the same 42-page evidence PDF byte-for-byte under the recorded reproducible-build environment.
