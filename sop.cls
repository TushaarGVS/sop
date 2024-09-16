%-TG: sop.cls
%-TG: author: Tushaar Gangavarapu (not for distribution)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sop}[2024/09/14 LaTeX class for typesetting statements for college applications]

%-TG: "final" option removes debugging comments, colored phrases, etc.
\newif\ifdraft\drafttrue
\DeclareOption{final}{\draftfalse}

%-TG: default font is "times", but if you wish to force "cmr" or "helvet" as the default font, load the option "cmr"/"helvet" respectively.
\newif\ifcmr\cmrfalse
\DeclareOption{cmr}{\cmrtrue}
\newif\ifhelvet\helvetfalse
\DeclareOption{helvet}{\helvettrue}

\ProcessOptions\relax

%-TG: set the draft color to "red" when in draft mode.
\newcommand{\draftcolor}{black}
\ifdraft%
    \renewcommand{\draftcolor}{red}
\fi%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[12pt,onecolumn]{article}
\RequirePackage[%
    letterpaper,%
    margin=1in,%
    showframe=False,%
]{geometry}

%-TG: set default font to "times".
\ifcmr%
    %-TG: no-op; load "cmr".
\else%
    \ifhelvet%
        \RequirePackage{helvet}
        \renewcommand{\familydefault}{\sfdefault}
    \else%
        \RequirePackage{times}
    \fi%
\fi

%-TG: reduce the section fontsize.
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-1.5ex \@plus -1ex \@minus -.2ex}%-TG: spacing before sec title
  {1ex \@plus.2ex}%-TG: spacing after title
  {\normalfont\bfseries}%-TG: font style
}

%-TG: custom date format: mm/dd/yyyy ({hh}.{mm}am/pm).
%-TG: NOTE: set your timezone in the `latexmkrc` file.
\RequirePackage{datetime}
\renewcommand{\timeseparator}{.}

\RequirePackage[useregional]{datetime2}
\DTMnewdatestyle{datefmt}{%
  \renewcommand{\DTMdisplaydate}[4]{%
    \number##2/\number##3/\number##1%
  }%
}
\DTMsetdatestyle{datefmt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amssymb}
\RequirePackage[reqno]{amsmath}
\RequirePackage{amsthm}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{url}
\RequirePackage{titlesec}
\RequirePackage{subcaption}
\RequirePackage{xspace}
\RequirePackage{etoolbox}

%-TG: footnotes, headers, footers, etc.
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[bottom]{footmisc}

%-TG: bibliography.
\RequirePackage{multicol}
\RequirePackage{natbib}
\bibliographystyle{unsrtnat}
\RequirePackage{xurl}  %-TG: to break bib urls more gracefully

\RequirePackage{enumitem}
\setlist[enumerate,1]{label={(\alph*)}}

\RequirePackage{xcolor}
\definecolor{darkblue}{rgb}{0,0,0.5}
\definecolor{darkgreen}{rgb}{0,0.5,0}

\RequirePackage[
    colorlinks,
    linkcolor=darkblue,
    citecolor=darkblue,
    linkcolor=darkblue,
    urlcolor=darkblue
]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: reduce spacing before and after equations:
%-TG: https://www.reddit.com/r/LaTeX/comments/u17337/comment/i4beuql.
\expandafter\def\expandafter\normalsize\expandafter{%
    \normalsize%
    \setlength\abovedisplayskip{5pt}%
    \setlength\belowdisplayskip{5pt}%
    \setlength\abovedisplayshortskip{5pt}%
    \setlength\belowdisplayshortskip{5pt}%
}

%-TG: adjust spacing after paragraph.
\setlength{\parskip}{0.5em}
\setlength{\parindent}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: \maketitle.
\newcommand{\email}[1]{\newcommand{\@email}{#1}}

\newcommand{\HRule}{\rule{\linewidth}{0.6mm}}
\newcommand{\Hrule}{\rule{\linewidth}{0.3mm}}

\renewcommand{\maketitle}{%
    \noindent%
    \textbf{\@title}%
    \\[2pt]
    \@author\,(\href{mailto:\@email}{\@email})
    \hfill%
    \\
    \Hrule%
    \vspace{0.7em}\par%
}

%-TG: college specifics.
\newcommand{\college}[1]{\newcommand{\@college}{#1}}
\newcommand{\thecollege}{%
    \textcolor{\draftcolor}{\@college}\xspace%
}
%-TG: abbreviation of college (e.g., MIT for Massachusetts Institute of Technology)
\newcommand{\collegeabbr}[1]{\newcommand{\@collegeabbr}{#1}}
\newcommand{\thecollegeabbr}{%
    \ifcsname @collegeabbr\endcsname%-TG: check if \@collegeabbr is defined
        \ifx\@collegeabbr\@empty%-TG: check if \@collegeabbr is empty
            \textcolor{\draftcolor}{\@college}\xspace%
        \else%
            \textcolor{\draftcolor}{\@collegeabbr}\xspace%
        \fi
    \else%-TG: \@collegeabbr is not defined
        \textcolor{\draftcolor}{\@college}\xspace%
    \fi%
}

%-TG: department specifics.
\newcommand{\dept}[1]{\newcommand{\@dept}{#1}}
\newcommand{\thedept}{%
    \textcolor{\draftcolor}{\@dept}\xspace%
}
%-TG: abbreviation of department (e.g., CS for Computer Science)
\newcommand{\deptabbr}[1]{\newcommand{\@deptabbr}{#1}}
\newcommand{\thedeptabbr}{%
    \ifcsname @deptabbr\endcsname%
        \ifx\@deptabbr\@empty%
            \textcolor{\draftcolor}{\@dept}\xspace%
        \else%
            \textcolor{\draftcolor}{\@deptabbr}\xspace%
        \fi
    \else
        \textcolor{\draftcolor}{\@dept}\xspace%
    \fi%
}

%-TG: degree specifics.
\newcommand{\degree}[1]{\newcommand{\@degree}{#1}}
\newcommand{\thedegree}{%
    \textcolor{\draftcolor}{\@degree}\xspace%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: page headers and footers
%-TG: adjust the head height and top margin.
\setlength{\headheight}{19.075pt}
\addtolength{\topmargin}{-7.075pt}

%-TG: first page: no header, only footer.
\pagestyle{fancy}
\fancyhf{}
\fancypagestyle{firstpage}
{
   \fancyhf{}
   \rfoot{\small{\thepage}/\pageref{LastPage}}
   \renewcommand{\headrulewidth}{0pt}
}

%-TG: other pages: custom header and footer.
\rhead{}
\lhead{%
    \small{\@author\,(\href{mailto:\@email}{\@email})}%
    \vspace{0.5em}%
}
\rfoot{\small{\thepage}/\pageref{LastPage}}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headsep}{25pt}

%-TG: first page doesn't need to include the header.
\AtBeginDocument{\thispagestyle{firstpage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: tt font style: pcr, cmvtt, cmtt.
\renewcommand\ttdefault{pcr}

%-TG: tt font < and > symbols.
\newcommand{\lt}{\scalebox{.7}[1.0]{<}}
\newcommand{\gt}{\scalebox{.7}[1.0]{>}}

%-TG: color fix for multiline comments.
\makeatletter
\long\def\@textcolor#1#2#3{\protect\leavevmode{\color#1{#2}#3}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: attributions
\newcommand{\acks}[1]{%
    \ifblank{#1}{%
        %-TG: no-op for blank/empty spaces
    }{%
        \paragraph{Acknowledgments.}{#1}%
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: two-col bibliography.
\makeatletter
\renewenvironment{thebibliography}[1]{%
    \clearpage%
    \begin{multicols}{2}[\section*{\refname}]%
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
        \list{\@biblabel{\@arabic\c@enumiv}}{%
            \settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}%
        }%
        \sloppy
        \clubpenalty4000
        \@clubpenalty \clubpenalty
        \widowpenalty4000%
        \sfcode`\.\@m%
    }{%
    \def\@noitemerr{%
        \@latex@warning{Empty `thebibliography' environment}%
    }%
    \endlist%
    \end{multicols}%
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: insert "last modified" at the end of the document.
\AtEndDocument{%
    \ifdraft%
        (Last compiled: \textcolor{\draftcolor}{\today,~\ampmtime})%
    \else%
        (Last compiled: \today)%
    \fi%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%