% !TEX TS-program = lualatex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vsureport}[2024/04/03 1.0.0 The class with report presents for Voronezh state university]

% Passtrow all options for class to vsubase class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{vsubase}}
\ProcessOptions\relax

% Load base class
\LoadClass[14pt]{vsubase}

% Set line 1.5pt line spacing
\RequirePackage{setspace}
\onehalfspacing

% Set section styles
\titleformat{\subsection}{\normalfont\normalsize\centering\bfseries\itshape}{\thesubsection. }{0pt}{}
\titleformat{\subsubsection}{\normalfont\normalsize\centering\itshape}{\thesubsubsection. }{0pt}{}
\let\sectionbreak\clearpage

% Set the page numbers in the footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{31pt}
\fancyhead[C]{\thepage}
\renewcommand\headrulewidth{0pt}

% Make plain pages (like ToC) use fancy style
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% Set toc styles
\RequirePackage{titletoc}
\titlecontents{section}[0pt]{\normalfont\normalsize}{\thecontentslabel. }{}{\dotfill\contentspage}
\titlecontents{subsection}[0pt]{\normalfont\normalsize}{\thecontentslabel. }{}{\dotfill\contentspage}
\titlecontents{subsubsection}[0pt]{\normalfont\normalsize}{\thecontentslabel. }{}{\dotfill\contentspage}

% Set bibliography title
\bibtitle{Список используемых источников}

% Set list styles
\RequirePackage{enumitem}
\setlist{leftmargin=0pt,itemindent=\dimexpr\parindent + \@listdepth\labelsep,labelwidth=0pt,align=left}

% Set title style
\RequirePackage{titling}
\makeatletter

% Set head of department
\newcommand{\headdep}[1]{\newcommand{\@headdep}{#1}}

% Set head of department grade
\newcommand{\@headdepgrade}[0]{\hspace{3cm}}
\newcommand{\headdepgrade}[1]{\renewcommand{\@headdepgrade}{#1}}

% Set scientific adviser
\newcommand{\sciadv}[1]{\newcommand{\@sciadv}{#1}}

% Set scientific adviser grade
\newcommand{\@sciadvgrade}[0]{\hspace{3cm}}
\newcommand{\sciadvgrade}[1]{\renewcommand{\@sciadvgrade}{#1}}

% Set department
\newcommand{\@department}[0]{\PackageError{vsureport}{Set department before the using maketitle}{}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}

% Set title description
\newcommand{\@titledesc}[0]{\PackageError{vsureport}{Set titledesc before the using maketitle}{}}
\newcommand{\titledesc}[1]{\renewcommand{\@titledesc}{#1}}

% Set direction
\newcommand{\@direction}[0]{\PackageError{vsureport}{Set direction before the using maketitle}{}}
\newcommand{\direction}[1]{\renewcommand{\@direction}{#1}}

% Set profile
\newcommand{\@profile}[0]{\PackageError{vsureport}{Set profile before the using maketitle}{}}
\newcommand{\profile}[1]{\renewcommand{\@profile}{#1}}

% Set author grade
\newcommand{\@authorgrade}[0]{\hspace{3cm}}
\newcommand{\authorgrade}[1]{\renewcommand{\@authorgrade}{#1}}

% Patch maketitle command and ignore hbox
\long\def\@maketitle{%
    \let\@oldhfuzz\hfuzz
    \hfuzz 10000pt
    \begin{titlingpage}
        \begin{center}
            МИНОБРНАУКИ  РОССИИ \\
            ФЕДЕРАЛЬНОЕ  ГОСУДАРСТВЕННОЕ  БЮДЖЕТНОЕ \\
            ОБРАЗОВАТЕЛЬНОЕ  УЧРЕЖДЕНИЕ  ВЫСШЕГО  ОБРАЗОВАНИЯ \\
            <<ВОРОНЕЖСКИЙ  ГОСУДАРСТВЕННЫЙ  УНИВЕРСИТЕТ>> \\
            (ФГБОУ ВО <<ВГУ>>) \vspace{1em}

            Факультет прикладной математики, информатики и механики \vspace{1em}

            \@department\vfill

            \begin{doublespace}
                \textbf{\@title}\vspace{1em}
            \end{doublespace}

            \@titledesc\vspace{1em}

            \@direction\vspace{1em}

            \@profile\vfill

            \renewcommand{\arraystretch}{1.5}%
            \setlength\tabcolsep{0.4cm}
            \begin{tabular}{c c c c}
                \ifdefined\@headdep
                Зав. кафедрой & \underline{\hspace{3cm}} & \@headdepgrade{} & \@headdep \\
                \fi
                Обучающийся   & \underline{\hspace{3cm}} & \@authorgrade{}  & \@author  \\
                \ifdefined\@sciadv
                Руководитель  & \underline{\hspace{3cm}} & \@sciadvgrade{}  & \@sciadv  \\
                \fi
            \end{tabular}\vfill

            Воронеж, \@date
        \end{center}
    \end{titlingpage}
    \setcounter{page}{2}
    \let\hfuzz\@oldhfuzz
    \let\@oldhfuzz\undefine
}
\makeatother
