% CV template
%
% Author: Vasily Negrebetskiy

\ProvidesClass{cv}[2021/10/28 CV Style]
\LoadClass[11pt]{article} % Font size and paper type

%--------------------------------------------------------------------------------
%   Packages and general settings
%--------------------------------------------------------------------------------

% Encodings, locales
\usepackage[utf8x]{inputenc}
\usepackage[T2A]{fontenc}
\usepackage[english,russian]{babel}

% Symbols
\usepackage{fontawesome}
\usepackage{amssymb}

\usepackage{parskip} % Remove paragraph indentation
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{geometry}
\geometry{a4paper, top=1.5cm, bottom=1.5cm, left=2cm, right=2cm}
\usepackage{enumitem} % Used for itemize setup
\setlist[itemize]{leftmargin=*, nosep}

% Links
\usepackage{hyperref}
\hypersetup{colorlinks=true, urlcolor=blue}
\newcommand*{\doi}[1]{doi:\href{http://dx.doi.org/#1}{#1}}
\newcommand*{\email}[1]{\href{mailto:#1}{#1}}
\newcommand*{\github}[1]{\faGithub~\href{https://github.com/#1}{#1}}

\pagestyle{empty} % Suppress page numbers

% Custom date
\def\mydate{\leavevmode\hbox{\twodigits\day.\twodigits\month.\the\year}}
\def\twodigits#1{\ifnum#1<10 0\fi\the#1}

%--------------------------------------------------------------------------------
%   Heading style
%--------------------------------------------------------------------------------

\def \name #1 {\def \@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default
\let \@leftpanel \relax
\def \leftpanel #1 {\def \@leftpanel{#1}}
\let \@rightpanel \relax
\def \rightpanel #1 {\def \@rightpanel{#1}}

% CV title
\newcommand{\createtitle} {
  \begingroup
    \hfil{\LARGE\bf \@name}\hfil
    \par
  \endgroup
  \begin{minipage}{0.49\textwidth}
    \@leftpanel
    \hfill
  \end{minipage}
  \hfill
  \begin{minipage}{0.49\textwidth}
    \hfill
    \raggedleft
    \@rightpanel
  \end{minipage}
  \par
}

% Create title automaticaly
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document 
  \createtitle
  \bigskip
}

%--------------------------------------------------------------------------------
%   Sections style
%--------------------------------------------------------------------------------

\newenvironment{cvSection}[1]{ % section name
  \MakeUppercase{\bf #1} 
  \smallskip
  \hrule % Horizontal line
  \smallskip
}{
  \bigskip
}

\newenvironment{cvSubsection}[1]{ % subsection name
  {\bf #1} \par 
}{
  \medskip
}

%--------------------------------------------------------------------------------
%   Entries
%--------------------------------------------------------------------------------

\newlength{\smallertextwidth}
\setlength{\smallertextwidth}{\textwidth}
\addtolength{\smallertextwidth}{-2.5cm}

% Base function; all the rest are its wrappers
\newcommand{\entry}[2] { % data, main body
  \begin{minipage}[t]{2.5cm}
    {\em #1} 
  \end{minipage}% This must go next to `\end{minipage}`
  \begin{minipage}[t]{\smallertextwidth}
    #2
  \end{minipage}
  \par
}

% For education, jobs, etc
\newcommand{\appointment}[3] {
  \entry{#1}{\textbf{#2} \par #3}
}

% For publications
\newcommand{\paper}[6] {
  \entry{#4}{#1 \\ {\em #2} \\ #3 (#4) #5 
    \ifthenelse{\equal{#6}{}}{}{\\ \doi{#6}}}
}

%--------------------------------------------------------------------------------
%   Date and github repo link
%--------------------------------------------------------------------------------

\AtEndDocument{
  \vfill
  \center
  \hrule % Horizontal line
  
  Last update: \mydate~$\bullet$~\github{Negrebetskiy}
}
