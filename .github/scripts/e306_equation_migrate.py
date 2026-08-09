from __future__ import annotations

import re
from pathlib import Path

root = Path("paper/e306-anchor-fibre-v1/manuscript")
files = [root / "main.tex", *sorted((root / "sections").glob("*.tex"))]

# Post-migration cleanup.  Every explicitly tagged display must carry exactly one
# equation label.  A pre-existing descriptive label wins over the generated
# numeric fallback eq:section.number; the visible \tag is never changed.
aliases: dict[str, str] = {}
block_re = re.compile(
    r"\\tag\{(?P<num>\d+\.\d+)\}"
    r"(?P<labels>(?:\\label\{eq:[^}]+\})+)"
)
label_re = re.compile(r"\\label\{(eq:[^}]+)\}")

for path in files:
    text = path.read_text(encoding="utf-8")

    def clean_block(match: re.Match[str]) -> str:
        num = match.group("num")
        labels = label_re.findall(match.group("labels"))
        if not labels:
            raise SystemExit(f"Tagged display {num} has no equation label in {path}")
        numeric = f"eq:{num}"
        descriptive = [label for label in labels if label != numeric]
        if len(descriptive) > 1:
            raise SystemExit(
                f"Tagged display {num} has multiple descriptive labels in {path}: {descriptive}"
            )
        chosen = descriptive[0] if descriptive else numeric
        if descriptive:
            aliases[numeric] = chosen
        return f"\\tag{{{num}}}\\label{{{chosen}}}"

    text = block_re.sub(clean_block, text)
    path.write_text(text, encoding="utf-8")

# Retarget references to any retained descriptive labels.
for path in files:
    text = path.read_text(encoding="utf-8")
    for numeric, descriptive in aliases.items():
        text = text.replace(
            f"\\eqref{{{numeric}}}",
            f"\\eqref{{{descriptive}}}",
        )
    path.write_text(text, encoding="utf-8")

# The amsart dedication machinery may enter an italic context before the
# dedication argument is expanded.  The inscription is deliberately upright,
# so map the family's italic request to the same Regular face and avoid a font
# substitution warning without changing the visible design.
main = root / "main.tex"
text = main.read_text(encoding="utf-8")
old_font = r"\newfontfamily\greekdedicationfont{EBGaramond-Regular.otf}"
new_font = (
    r"\newfontfamily\greekdedicationfont{EBGaramond-Regular.otf}["
    "\n  ItalicFont=EBGaramond-Regular.otf\n]"
)
if old_font in text:
    text = text.replace(old_font, new_font)
elif new_font not in text:
    raise SystemExit("Expected direct EB Garamond dedication declaration not found")
main.write_text(text, encoding="utf-8")

# Mechanical invariants of the final reference surface.
corpus = "\n".join(p.read_text(encoding="utf-8") for p in files)
tags = re.findall(r"\\tag\{(\d+\.\d+)\}", corpus)
eq_labels = re.findall(r"\\label\{(eq:[^}]+)\}", corpus)
refs = re.findall(r"\\eqref\{(eq:[^}]+)\}", corpus)
legacy_refs = re.findall(r"\\eqref\{(\d+\.\d+)\}", corpus)

if legacy_refs:
    raise SystemExit(f"Legacy numeric eqref keys remain: {sorted(set(legacy_refs))}")
if len(tags) != len(set(tags)):
    raise SystemExit("Duplicate explicit equation tags found")
if len(eq_labels) != len(set(eq_labels)):
    raise SystemExit("Duplicate equation labels found")
if len(tags) != len(eq_labels):
    raise SystemExit(
        f"Expected one equation label per tagged display; tags={len(tags)}, labels={len(eq_labels)}"
    )
missing_targets = sorted(set(refs) - set(eq_labels))
if missing_targets:
    raise SystemExit(f"Equation references without labels: {missing_targets}")
if "RenewDocumentCommand{\\eqref}" in corpus:
    raise SystemExit("Global eqref override remains")

print(
    f"Reference cleanup complete: {len(tags)} tagged displays, "
    f"{len(eq_labels)} unique equation labels, {len(refs)} references."
)
print("Descriptive equation labels retained:", aliases or "none")
