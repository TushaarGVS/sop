# Schools

File naming convention (not mandatory, recommended):
```txt
<deadline-day>_<school-name>.tex
```

## Commands

The following commands set `\the<cmd>` (e.g., `\theprofs`) variables:
- `\college{}`
- `\collegeabbr{}`
- `\dept{}`
- `\deptabbr{}`
- `\degree{}`
- `\profs{}`: accepts multiple entries, works similar to `\citep{}`; once set, allows to access individual profs by index as `\prof{1}`.

## School-specific info

* Set SOP school-specific info using `\collegespecificsop{}`.
* Set personal statement school-specific info using `\collegespecificpersonal{}`.
