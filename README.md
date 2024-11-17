# Grad school statements LaTeX template

## Custom `statement.cls`

Provides `statement.cls` to manage grad school applications. Use the custom class as:

```tex
\documentclass[<options>]{statement}
```

Available options:

- `cmr`: The template uses Times as the default font. However, in noting that most people prefer Computer Modern Roman (the default LaTeX font) to Times, loading the class with `cmr` option forces the use of the default LaTeX font.
- `helvet`: Set the default font to Helvetica.
- `final`: The template compiles in a "draft" mode by default. All variables (e.g., college, program, etc.) are highlighted in red text in draft mode (for easy verification); in final mode, all variables are in black text.
- `boldauth`: bolds the author name whose lastname is as set in `\boldauthlastname{}` in bibliography (useful in distinguishing one's own publications from related work). 

### Setting school-specific variables

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

%-TG: set college-specific info for *SOP*.
\collegespecificsop{
    At \collegeabbr \deptabbr, I wish to work with \theprofs. \prof{1} does [...].
}

%-TG: set college-specific info for *personal statement*.
\collegespecificpersonal{}
```

Once set, you can use the variables as `\thecollege`, `\thecollegeabbr`, `\thedept`, `\thedeptabbr`, `\thedegree`, `\theprofs` (and `\prof{<idx>}`), and `\thecollegespecificinfo`. If the abbreviations (e.g., `collegeabbr` and `deptabbr`) are unset, the associated variables default to their unabbreviated values.

### Setting acknowledgments

Finally, use `\acks` to typeset acknowledgments: the command automatically ignores printing "Acknowledgments" section name when the input is empty.

## Additional commands

See `config/commands.tex`:
- `\furl{}`: footnote hyperlink.
- `\rrule`: right rule (similar to footnoterule, but to the right of the page).

## Citation

```bib
@misc{tushaar2024grad,
  author    = {Gangavarapu, Tushaar},
  title     = {{Grad school statements LaTeX template)}},
  month     = {November},
  year      = {2024},
  publisher = {GitHub},
  url       = {https://github.com/TushaarGVS/sop},
  note      = {published 11/20/2024}
}
```
