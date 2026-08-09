from __future__ import annotations

import re
from pathlib import Path

root = Path("paper/e306-anchor-fibre-v1/manuscript")
files = [root / "main.tex", *sorted((root / "sections").glob("*.tex"))]

for path in files:
    text = path.read_text(encoding="utf-8")
    text = re.sub(
        r"\\tag\{(\d+\.\d+)\}(?!\\label\{eq:\1\})",
        lambda m: f"\\tag{{{m.group(1)}}}\\label{{eq:{m.group(1)}}}",
        text,
    )
    text = re.sub(
        r"\\eqref\{(\d+\.\d+)\}",
        lambda m: f"\\eqref{{eq:{m.group(1)}}}",
        text,
    )
    path.write_text(text, encoding="utf-8")

main = root / "main.tex"
text = main.read_text(encoding="utf-8")
old_block = r"""% The reviewed source uses explicit numeric \tag keys throughout.  Keep those
% visible numbers and their matching in-text references fixed.  Equation
% references are therefore rendered directly from the same numeric keys rather
% than through a synthetic label layer; theorem/section references remain normal
% LaTeX/hyperref references.
\numberwithin{equation}{section}
\RenewDocumentCommand{\eqref}{m}{\textup{(#1)}}"""
new_block = r"""% Stable explicit equation numbers are retained for review continuity, while
% each tagged display carries a real semantic label of the form eq:section.number.
% Equation references therefore use ordinary LaTeX/hyperref navigation.
\numberwithin{equation}{section}"""
if old_block not in text:
    raise SystemExit("Expected legacy equation-reference block not found in main.tex")
text = text.replace(old_block, new_block)

old_font = r"""\IfFontExistsTF{EB Garamond}{%
  \newfontfamily\greekdedicationfont{EB Garamond}%
}{%
  \PackageError{e306}{EB Garamond not found}{The Owner-authorized dedication test requires EB Garamond.}%
}"""
new_font = r"""\IfFileExists{EBGaramond-Regular.otf}{%
  \newfontfamily\greekdedicationfont{EBGaramond-Regular.otf}%
}{%
  \PackageError{e306}{EBGaramond-Regular.otf not found}{The Owner-authorized dedication test requires the TeX Live EB Garamond OpenType file.}%
}"""
if old_font not in text:
    raise SystemExit("Expected EB Garamond test font block not found in main.tex")
text = text.replace(old_font, new_font)
main.write_text(text, encoding="utf-8")

corpus = "\n".join(p.read_text(encoding="utf-8") for p in files)
tags = re.findall(r"\\tag\{(\d+\.\d+)\}", corpus)
labels = re.findall(r"\\label\{eq:(\d+\.\d+)\}", corpus)
refs = re.findall(r"\\eqref\{eq:(\d+\.\d+)\}", corpus)
legacy_refs = re.findall(r"\\eqref\{(\d+\.\d+)\}", corpus)

if legacy_refs:
    raise SystemExit(f"Legacy numeric eqref keys remain: {sorted(set(legacy_refs))}")
if len(tags) != len(set(tags)):
    raise SystemExit("Duplicate explicit equation tags found")
if len(labels) != len(set(labels)):
    raise SystemExit("Duplicate semantic equation labels found")
if set(tags) != set(labels):
    raise SystemExit(
        f"Tag/label mismatch: missing labels={sorted(set(tags)-set(labels))}; "
        f"extra labels={sorted(set(labels)-set(tags))}"
    )
missing_targets = sorted(set(refs) - set(labels))
if missing_targets:
    raise SystemExit(f"Equation references without labels: {missing_targets}")

print(f"Migrated {len(tags)} explicit equation tags and {len(refs)} equation references.")
