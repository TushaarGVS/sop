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
    a4paper,%
    top=0.92in,%
    left=0.8in,%
    right=0.8in,%
    bottom=0.75in,%
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

\RequirePackage[utf8]{inputenc}  %-TG: for accented chars
\RequirePackage[T1]{fontenc}

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
\RequirePackage{atbegshi}  %-TG: to change margins from page-2

%-TG: footnotes, headers, footers, etc.
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[bottom]{footmisc}

%-TG: bibliography.
\RequirePackage{multicol}
\RequirePackage[round]{natbib}  %-TG: load with "round" brackets
\bibliographystyle{abbrvnat}
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

%-TG: adjust spacing for \paragraph.
\titlespacing*{\paragraph}{0pt}{2pt}{\medskipamount}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: \maketitle.
\newcommand{\email}[1]{\newcommand{\@email}{#1}}

\newcommand{\HRule}{\rule{\linewidth}{0.6mm}}
\newcommand{\Hrule}{\rule{\linewidth}{0.3mm}}

\renewcommand{\maketitle}{%
    \noindent\textbf{\@title}%
    \\[2pt]
    \@author\,(\href{mailto:\@email}{\@email})
    \hfill%
    \\
    \Hrule%
    \vspace{0em}\par%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: college name.
\newcommand{\@college}{\texttt{\textbackslash college}}  %-TG: default
\newcommand{\college}[1]{\renewcommand{\@college}{#1}}
\newcommand{\thecollege}{%
    \textcolor{\draftcolor}{\@college}\xspace%
}
%-TG: abbreviation of college name (e.g., MIT for Massachusetts Institute of Technology).
\newcommand{\@collegeabbr}{\texttt{\textbackslash collegeabbr}}  %-TG: default
\newcommand{\collegeabbr}[1]{\renewcommand{\@collegeabbr}{#1}}
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

%-TG: department name.
\newcommand{\@dept}{\texttt{\textbackslash dept}}  %-TG: default
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}
\newcommand{\thedept}{%
    \textcolor{\draftcolor}{\@dept}\xspace%
}
%-TG: abbreviation of department name (e.g., CS for Computer Science)
\newcommand{\@deptabbr}{\texttt{\textbackslash deptabbr}}  %-TG: default
\newcommand{\deptabbr}[1]{\renewcommand{\@deptabbr}{#1}}
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

%-TG: degree title.
\newcommand{\@degree}{\texttt{\textbackslash degree}}  %-TG: default
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\thedegree}{%
    \textcolor{\draftcolor}{\@degree}\xspace%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-TG: command for professor names (works like \cite).
\newcommand{\@profs}{\texttt{\textbackslash profs}}
\newcounter{profindex}  %-TG: counter for indexing professors.
\newcommand{\profs}[1]{%
    \setcounter{profindex}{0}
    
    \def\profsep{, }%-TG: separator between profs
    \def\lastprofseptwo{\,and }%-TG: separator before the prof when only two profs are included
    \def\lastprofsep{, and }%-TG: separator before the prof in all other cases
    \def\profformat##1{%
        \expandafter\gdef\csname prof\theprofindex\endcsname{Prof.~\ignorespaces##1}%
        Prof.~\ignorespaces##1%
    }

    %-TG: counter to see how many profs. This is needed before reiterating again to ensure that we can use "and" before the last prof.
    \newcounter{total}
    \setcounter{total}{0}
    \@for\profname:=#1\do{%
        \stepcounter{total}%
    }
    
    \newcounter{count}
    \setcounter{count}{0}
    \def\proflist{}%-TG: initialize list
    \@for\profname:=#1\do{%
        \stepcounter{count}%
        \stepcounter{profindex}%
        \ifx\proflist\empty%
            \edef\proflist{\profformat{\profname}}%
        \else%
            \ifnum\value{count}=\value{total}%
                %-TG: Handle "and" before the last name.
                    \ifnum\value{total}=2%
                        \edef\proflist{\proflist\lastprofseptwo\profformat{\profname}}%
                    \else%
                        \edef\proflist{\proflist\lastprofsep\profformat{\profname}}%
                    \fi%
            \else%
                \edef\proflist{\proflist\profsep\profformat{\profname}}%
            \fi%
        \fi%
    }%
    \renewcommand{\@profs}{\emph{\proflist}}
}
\newcommand{\theprofs}{%
    \textcolor{\draftcolor}{\@profs}\xspace%
}
%-TG: Command to reference professors by index; e.g., `\prof{1}`.
\newcommand{\prof}[1]{\textcolor{\draftcolor}{\csname prof#1\endcsname}}

%-TG: school-specific details, often included after motivation/background.
\newcommand{\@collegespecificinfo}{%
    \ifdraft%
        \texttt{\textbackslash collegespecificinfo}%
    \fi
}  %-TG: default
\newcommand{\collegespecificinfo}[1]{\renewcommand{\@collegespecificinfo}{#1}}
\newcommand{\thecollegespecificinfo}{%
    \textcolor{\draftcolor}{
        \ifx\@collegespecificinfo\empty%
            \ifdraft%
                WARN: \texttt{\textbackslash collegespecificinfo} empty.%
            \fi
        \else%
            \@collegespecificinfo\par\xspace
        \fi
    }\xspace%
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
   \lhead{
        %-TG: Display a warning message if in draft mode.
        \ifdraft
            %-TG: delayed access to \thecollegeabbr and \thedeptabbr.
            \AfterEndPreamble{%
                \vspace{0.5em}
                \textcolor{\draftcolor}{%
                    \fbox{\parbox{\textwidth}{%
                        \centering
                        NOTE: This is a draft for \textbf{\thecollegeabbr} \textbf{\thedeptabbr}. Compile with \texttt{final} option for camera-ready copy.
                    }}%
                }%
            }%
        \fi
   }
   \rfoot{\small{\thepage}/\pageref{LastPage}}
   \renewcommand{\headrulewidth}{0pt}
}

%-TG: other pages: custom header and footer.
\rhead{}
\lhead{%
    \small{\@author\,(\href{mailto:\@email}{\@email})}%
    \vspace{0.2em}%
}
\rfoot{\small{\thepage}/\pageref{LastPage}}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headsep}{10pt}

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
    %-TG: Don't explicitly clear the page.
    % \clearpage%
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
        (Last compiled: \textcolor{\draftcolor}{\today,~\ampmtime}.)%
    \else%
        (Last compiled: \today.)%
    \fi%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
