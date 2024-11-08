# SOP template

## sop.cls

Provides `sop.cls` to manage grad school applications. Use the custom class as:

```tex
\documentclass[<options>]{sop}
```

Available options:
- `cmr`: The template uses Times as the default font. However, in noting that most people prefer Computer Modern Roman (the default LaTeX font) to Times, loading the class with `cmr` option forces the use of the default LaTeX font.
- `helvet`: Set the default font to Helvetica.
- `final`: The template compiles in a "draft" mode by default. All variables (e.g., college, program, etc.) are highlighted in red text in draft mode (for easy verification); in final mode, all variables are in black text.

Once you load the class, you can set program-specific variables as such (also see: `schools/README.md`):

```tex
\college{Massachusetts Institute of Technology}  %-TG: sets `\thecollege`
\collegeabbr{MIT}  %-TG: sets `\thecollegeabbr`
\dept{Electrical Engineering and Computer Science}  %-TG: sets `\thedept`
\deptabbr{EECS (CSAIL)}  %-TG: sets `\thedeptabbr`
\degree{PhD}  %-TG: sets `\thedegree`

%-TG: sets `\theprofs` to be "Prof. Yoon Kim and Prof. Jacob Andreas".
%-TG: individual profs can be accessed using `\prof{<idx>}` (e.g., `\prof{1}`).
\profs{Yoon~Kim, Jacob~Andreas}

%-TG: set college-specific info.
\collegespecificinfo{At \collegeabbr \deptabbr, I wish to [...]}
```

Once set, you can use the variables as `\thecollege`, `\thecollegeabbr`, `\thedept`, `\thedeptabbr`, `\thedegree`, `\theprofs` (and `\prof{<idx>}`), and `\thecollegespecificinfo`. If the abbreviations (e.g., `collegeabbr` and `deptabbr`) are unset, the associated variables default to their unabbreviated values.

Finally, use `\acks` to typeset acknowledgments: the command automatically ignores printing "Acknowledgments" section name when the input is empty.

## Additional commands

See `config/commands.tex`:
- `\furl{}`: footnote hyperlink.
