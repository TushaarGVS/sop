# SOP

An example usage is as follows:

```tex
\documentclass[
    % final,%-TG: uncomment for "final" mode: removes draft comments, colored phrases, etc.
    boldauth,%-TG: bolds a specific author in bibliography (set author's lastname using `\boldauthlastname{}`)
    % cmr,%-TG: typeset in Computer Modern Roman (default LaTeX font)
    % helvet,%-TG: typeset in Helvetica
]{statement}

%-TG: custom imports and commands.
%-TG: this is commonly loaded for SOP and personal statement (but it doesn't have to be).
\input{config/imports}
\input{config/commands}

\title{\texttt{statement.cls}: A \LaTeX template for grad school applications}

\author{Firstname Lastname}
\email{lastname.firstname@email.edu}
\boldauthlastname{Lastname}  %-TG: for bibliography

%-TG: Include college-specific variables here.
%-TG: NOTE: class vars such as `\thecollege` aren't available before this point.
%-TG: load in preamble before `\begin{document}`.
%-TG:
\input{schools/specific_school_file}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{document}
\maketitle

%-TG: content before college-specific info.
\input{sop/files_before_college_specific_stuff}

%-TG: include college-specific info for SOP.
\thecollegespecificsop

%-TG: acks, references, endnotes, etc.
\clearpage
\input{sop/acks}
\bibliography{references}  %-TG: bibstyle pre-set in statement.cls

\end{document}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
```