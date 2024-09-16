# Grad school application templates

## Statement of purpose

Provides `sop.cls` to manage grad school applications. Use the custom class as:

```tex
\documentclass[<options>]{sop}
```

Available options:
- `cmr`: The template uses Times as the default font. However, in noting that most people prefer Computer Modern Roman (the default LaTeX font) to Times, loading the class with `cmr` option forces the use of the default LaTeX font.
- `helvet`: Set the default font to Helvetica.
- `final`: The template compiles in a "draft" mode by default. All variables (e.g., college, program, etc.) are highlighted in red text in draft mode (for easy verification); in final mode, all variables are in black text.

Once you load the class, you can set program-specific variables as such:

```tex
\college{Massachusetts Institute of Technology}  %-TG: sets `\thecollege`
\collegeabbr{MIT}  %-TG: sets `\thecollegeabbr`
\dept{Electrical Engineering and Computer Science}  %-TG: sets `\thedept`
\deptabbr{EECS}  %-TG: sets `\thedeptabbr`
\degree{PhD}  %-TG: sets `\thedegree`
```

Once set, you can use the variables as `\thecollege`, `\thecollegeabbr`, `\thedept`, `\thedeptabbr`, and `\thedegree`. If the abbreviations (e.g., `collegeabbr` and `deptabbr`) are unset, the associated variables default to their unabbreviated values. 

Finally, use `\acks` to typeset acknowledgments: the command automatically ignores printing "Acknowledgments" section name when the input is empty.