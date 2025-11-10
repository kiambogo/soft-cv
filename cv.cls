% cv.cls - Custom CV class with minipage-based sections
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2025/01/13 Custom CV Class]

% Base class
\LoadClass{article}

% Required packages
\RequirePackage[margin=0.78in, top=0.62in, bottom=0.75in]{geometry}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{setspace}

% Source Sans 3 - Adobe's elegant sans-serif, clean and professional
\setmainfont{Source Sans 3}[
  UprightFont = *,
  BoldFont = *,
  ItalicFont = *,
  BoldItalicFont = *,
  BoldFeatures = {FakeBold=3.5}
]

% Refined color palette - slightly deeper blue
\definecolor{primaryblue}{RGB}{18, 48, 95}
\definecolor{accentblue}{RGB}{38, 88, 175}
\definecolor{lightgray}{RGB}{108, 108, 108}
\definecolor{textgray}{RGB}{48, 48, 48}

% Page styling
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlist{nosep, leftmargin=1.5em}
\color{textgray}

\hypersetup{
  colorlinks=true,
  linkcolor=accentblue,
  urlcolor=accentblue
}

% Section styling - elegant proportions with left border
\titleformat{\section}
  {\LARGE\bfseries\color{primaryblue}}
  {}{0em}
  {\hspace*{-12pt}\textcolor{accentblue}{\rule[-0.2em]{0.5pt}{1.2em}}\hspace{10pt}}
\titlespacing*{\section}{0pt}{1.2em}{0.5em}

% Subsection for companies
\titleformat{\subsection}
  {\large\bfseries}
  {}{0em}{}
\titlespacing*{\subsection}{0pt}{0.75em}{0.35em}

% Header command
\newcommand{\cvheader}[3]{%
  \begin{tikzpicture}[remember picture, overlay]
    \fill[primaryblue] (current page.north west) rectangle ([yshift=-4.0cm]current page.north east);
  \end{tikzpicture}

  \vspace*{-0.4cm}
  {\color{white}\Huge\bfseries #1}\\[0.35em]
  {\color{white}\LARGE #2}\\[0.6em]
  {\color{white}\normalsize #3}

  \vspace{0.5cm}
}

% Minipage-based section environments
% Usage: \begin{cvsection}[width]{title} content \end{cvsection}

\newenvironment{cvsection}[2][1.0]{%
  \noindent\begin{minipage}[t]{#1\textwidth}
    \section*{#2}
}{%
  \end{minipage}
}

% About section with two columns
% Usage: \cvabout{about text}{skills content}
\newcommand{\cvabout}[2]{%
  \noindent\begin{minipage}[t]{0.68\textwidth}
    \vspace{0pt}
    {\LARGE\bfseries\color{primaryblue}\hspace*{-12pt}\textcolor{accentblue}{\rule[-0.2em]{0.5pt}{1.2em}}\hspace{10pt}About}\\[0.6em]
    \begin{minipage}[t]{0.95\textwidth}
      \setstretch{1.15}#1
    \end{minipage}
  \end{minipage}%
  \hfill
  \begin{minipage}[t]{0.29\textwidth}
    \vspace{0pt}
    {\LARGE\bfseries\color{primaryblue}\hspace*{-12pt}\textcolor{accentblue}{\rule[-0.2em]{0.5pt}{1.2em}}\hspace{10pt}Skills}\\[0.6em]
    #2
  \end{minipage}
}

% Skills line command for cleaner syntax
\newcommand{\skillline}[2]{\textbf{#1:} #2\\[0.3em]}

% Job entry command
% Usage: \cvjob{Company}{Location}{Title}{Dates}{bullet points}
\newcommand{\cvjob}[5]{%
  \subsection*{#1 \hfill {\normalfont\color{lightgray}#2}}
  \noindent\textbf{\textit{#3}} \hfill {\color{lightgray}\textit{#4}}
  \begin{itemize}[itemsep=0.42em, topsep=0.33em]
    #5
  \end{itemize}
}

% Education entry command
% Usage: \cveducation{Institution}{Location}{Degree}{Dates}
\newcommand{\cveducation}[4]{%
  \noindent\textbf{#1} \hfill {\color{lightgray}#2}\\
  #3 \hfill {\color{lightgray}#4}
}
