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

## Topics

Each file in `topics/` is one cheatsheet: `topics/<name>.md` -> `build/<name>.pdf`.

| Topic | Source |
|-------|--------|
| Sentence conjunctions (から, それから ...) | `topics/sentence.md` |
| Rooms in the home | `topics/rooms-home.md` |

Furigana is plain HTML ruby: `<ruby>食<rt>た</rt></ruby>べる`.
Highlight a particle with `**bold**`; example tables use `{: .ex}`.
