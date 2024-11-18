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
\college{Cornell University}    %-TG: sets `\thecollege`
\collegeabbr{Cornell}           %-TG: sets `\thecollegeabbr`
\dept{Computer Science}         %-TG: sets `\thedept`
\deptabbr{CS}                   %-TG: sets `\thedeptabbr`
\degree{PhD}                    %-TG: sets `\thedegree`

%-TG: Sets `\theprofs` to be "Prof. Sasha~Rush and Prof. Cristian~Danescu-Niculescu-Mizil".
%-TG: Individual profs can be accessed using `\prof{<idx>}` (e.g., `\prof{1}` for "Prof. Sasha Rush").
\profs{Sasha~Rush, Cristian~Danescu-Niculescu-Mizil}

%-TG: Set college-specific info for *SOP*.
\collegespecificsop{
    At \thecollegeabbr \thedeptabbr, I wish to work with \theprofs.
    \prof{1} works on alternate-attention models.
    \prof{2} works on conversational forecasting.
}

%-TG: set college-specific info for *personal statement*.
\collegespecificpersonal{
    My teaching experiences shaped my research agenda and vice versa.
}
```

Once set, you can use the variables using:

- `\thecollege` (and `\thecollegeabbr`),
- `\thedept` (and `\thedeptabbr`),
- `\thedegree`,
- `\theprofs` (and `\prof{<idx>}`), and
- `\thecollegespecificinfo`.

When the abbreviations (`\collegeabbr{}` and `\deptabbr{}`) are unset, the associated variables default to their unabbreviated values (i.e., `\thecollegeabbr = \thecollege` and `\thedeptabbr = \thedept`).

### Setting acknowledgments

Finally, use `\acks{}` to typeset acknowledgments: the command automatically ignores printing "Acknowledgments" section name when the input is empty.

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
