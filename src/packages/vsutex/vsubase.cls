% !TEX TS-program = lualatex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vsubase}[2024/04/03 1.0.0 The base class with presets for Voronezh state university]

% Passtrow all options for class to extarticle class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

% Set A4 paper
\LoadClass[a4paper]{extarticle}

% Set Russian as main document language
\RequirePackage[english, russian]{babel}

% Set page padding
\RequirePackage[left=3cm, right=1.5cm, top=2cm, bottom=2cm]{geometry}

% Set Times New Roman font
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% Set 0pt space after paragraphs
\RequirePackage{parskip}
\setlength{\parskip}{0pt}

% Set first line 1.25cm indent
\RequirePackage{indentfirst}
\setlength{\parindent}{1.25cm}

% Set left indent for list items
\RequirePackage{enumitem}
\setlist{left=\parindent}

% Replace bullet to dashes in lists
\let\labelitemi\labelitemii

% Set dynamic spaces between words
\sloppy

% Set section styles
\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\normalsize\centering\bfseries}{\thesection. }{0pt}{}

% Add hyperrefs to the document
\RequirePackage[hidelinks]{hyperref}

% Replace : to . in captions
\RequirePackage[labelsep=period]{caption}

% Set gost style for bibliography
\RequirePackage[backend=biber, style=gost-numeric, sorting=none]{biblatex}
\RequirePackage{csquotes}
\addbibresource{sources.bib}

% Add bibliography to toc and ignore hbadness
\makeatletter

\newcommand{\@bibtitle}{\PackageError{vsureport}{Set bibtitle before using printbibliography}{}}
\newcommand{\bibtitle}[1]{\renewcommand{\@bibtitle}{#1}}

\let\@oldprintbibliography\printbibliography
\renewcommand{\printbibliography}[1][]{%
  \clearpage
  \phantomsection
  \begingroup
    \let\@oldhbadness\hbadness
    \hbadness=10000
    \@oldprintbibliography[
      heading=bibintoc,
      title={\@bibtitle},
      #1
    ]
    \let\hbadness\@oldhbadness
  \endgroup
}
\makeatother

% Add ability to use & in equations properly
\RequirePackage{amsmath}

% Internal packages
\RequirePackage{environ}
\RequirePackage{vsutex}

% Set current year by default
\makeatletter
\renewcommand{\@date}{\the\year}
\makeatother

% Add algorithms and translate it to Russian
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\makeatletter

\renewcommand{\ALG@name}{Алгоритм}
\algrenewcommand\algorithmicend{\textbf{конец}}
\algrenewcommand\algorithmicdo{\textbf{делать}}
\algrenewcommand\algorithmicwhile{\textbf{пока}}
\algrenewcommand\algorithmicfor{\textbf{для}}
\algrenewcommand\algorithmicforall{\textbf{для всех}}
\algrenewcommand\algorithmicloop{\textbf{цикл}}
\algrenewcommand\algorithmicrepeat{\textbf{повторить}}
\algrenewcommand\algorithmicuntil{\textbf{пока не}}
\algrenewcommand\algorithmicprocedure{\textbf{процедура}}
\algrenewcommand\algorithmicfunction{\textbf{функция}}
\algrenewcommand\algorithmicif{\textbf{если}}
\algrenewcommand\algorithmicthen{\textbf{то}}
\algrenewcommand\algorithmicelse{\textbf{иначе}}
\algrenewcommand\algorithmicrequire{\textbf{Вход:}}
\algrenewcommand\algorithmicensure{\textbf{Выход:}}
\algrenewcommand\algorithmicreturn{\textbf{возврат}}

\makeatother
