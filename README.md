## Willie's LilyPond Setup

Big ups to [LilyPond](https://lilypond.org/), it's a lot of fun to play with.

---

This repo serves to demonstrate how I extend LilyPond to create and styled Lead Sheets.

Shared styling and logic are found in `/templates`.

- `/modules` contains shared logic and styling.
- `init.ly` instantiates variables and includes `util.ly`.
- `lead_sheet.ly` includes modules and creates a single staff score.
- `lead_sheet_grand_staff.ly` includes modules and creates a staff group containing a Melody Staff and a Bass Staff.
- `util.ly` defines custom music functions.

Examples can be found in `/examples`. (`/files` is a private submodule.)

### File Format

To use a template 2 files must be included:

- `/templates/init.ly` before the music
- `/templates/lead_sheet.ly` or `/template/lead_sheet_grand_staff.ly` after the music

### Example

```ly
\version "2.26.0"
\language "english"

\include "../../templates/init.ly"

title = "My Great Tune"
composer = "John Doe"
style = "Salsa Picante"
partName = \markup { Kazoo in C\flat }

melody = {
  \relative c' {
    c1
  }
}

harmony =
\chordmode {
  c1
}

\include "../../templates/lead_sheet.ly"
```

### Lead Sheets

- [A Fine Romance](/examples/standards/A%20Fine%20Romance.pdf)
- [A Flower Is a Lovesome thing](/examples/standards/A%20Flower%20is%20a%20Lovesome%20Thing.pdf)

### Requirements

- [LilyPond](https://lilypond.org/download.html) 2.26 or newer, on your `PATH` as `lilypond`.

### Fonts

The templates use the [LV GoldenAge](https://github.com/OpenLilyPondFonts/lv-goldenage) fonts,
bundled in `/templates/fonts` (SIL Open Font License).

- The **text font** loads automatically.
- The **music font** has to be on LilyPond's search path. Pass the folder with `-I`, from the repo root:

  ```
  lilypond -I templates/fonts/lv-goldenage examples/standards/A\ Fine\ Romance.ly
  ```

  If you also pass `-o`, give `-I` an absolute path (LilyPond changes into the output folder first).
  Or copy the `lv-goldenage-*.otf` files into your LilyPond install's `share/lilypond/<version>/fonts/otf/` folder once, and skip `-I`.

Without either, scores still compile, but with LilyPond's default music font (Emmentaler) and a warning.

### VS Code

`.vscode/settings.json` is set up for [VSLilyPond Plus](https://github.com/wwrinkle/VSLilyPond-Plus), which compiles on save, passes the `-I` above for you, formats with python-ly, and handles MIDI input/playback. Put machine-specific settings (LilyPond path, MIDI device) in your user settings.

---

More to come.
