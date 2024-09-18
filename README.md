## Willie's LilyPond Setup

This repo serves to demonstrate how I extend LilyPond to create and style Lead Sheets.

Shared styling and logic are found in `/templates`.

- `/modules` contains shared logic and styling.
- `init.ly` instantiates variables and includes `util.ly`.
- `lead_sheet.ly` includes modules and creates a single staff score.
- `lead_sheet_grand_staff.ly` includes modules and creates a staff group containing a Melody Staff and a Bass Staff.
- `util.ly` defines custom music functions.

Examples can be found in `/files`.

### File Format

To use a template 2 files must be included:

- `/templates/init.ly`
- `/templates/lead_sheet.ly` or `/template/lead_sheet_grand_staff.ly`

### Example

```
\version "2.24.4"
\language "english"

\include "../../../templates/init.ly"

title = "My Great Tune"
composer = "John Doe"
style = "Salsa Picante"
part_name = \markup { Kazoo in C\flat }

melody = {
  \relative c' {
    c1
  }
}

harmony =
\chordmode {
  c1
}

\include "../../../templates/lead_sheet.ly"
```
