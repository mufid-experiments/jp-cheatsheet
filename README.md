# ムフィドの日本語学習早見表

Self-explanatory

## Building

Use Jekyll, render in PDF.

```
make                 # every topic -> build/<topic>.html + build/<topic>.pdf
bin/build sentence   # just topics/sentence.md
make html            # HTML only, skip the PDF
make serve           # live preview: http://localhost:4000/topics/<topic>.html
make clean
```

Needs Ruby with Jekyll (`bundle install`) and Chrome (or Brave/Chromium;
override with `CHROME=/path/to/chrome`).

A pull request that adds or changes `topics/<name>.md` gets a preview: its
"Preview cheatsheets" run has `<name>.pdf` and `<name>.html` as artifacts,
which open straight in the browser.

## Topics

Each file in `topics/` is one cheatsheet: `topics/<name>.md` -> `build/<name>.pdf`.

Furigana is plain HTML ruby: `<ruby>食<rt>た</rt></ruby>べる`.
Highlight a particle with `**bold**`; example tables use `{: .ex}`.

Cite Tae Kim's *A Guide to Japanese Grammar* by section number:
`{% taekim 3.2.3 4.1.4 %}` shows each section's number, title and page,
linked to the online guide. The sections are in `_data/taekim.yml`
(copied from passage-archiver); a number that is not there stops the build.
