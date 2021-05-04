% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{soft-cover}[2021/03/03 SoftCV]

% Class options
\LoadClass{article}
\ProcessOptions\relax

% Package definitions
\RequirePackage{xcolor}
\RequirePackage{ragged2e}
\RequirePackage{geometry}
\RequirePackage{ifthen}
\RequirePackage[hidelinks,unicode]{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{enumitem}
\RequirePackage{setspace}
\RequirePackage{tikz}
\RequirePackage[default,opentype]{sourcesanspro}

% Layout setup
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}
\thispagestyle{empty}
\setlength{\parindent}{0pt}

% Font setup
\newfontfamily\nameFont[Path=fonts/, LetterSpace=10]{ModerneSans}
\newfontfamily\sectionTitleFont[Path=fonts/, LetterSpace=10]{ModerneSans}
\newfontfamily\monoFont[Path=fonts/]{SpaceMono}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

% Colour definitions
\definecolor{cvBlue}{RGB}{7,82,242}
\definecolor{cvRed}{RGB}{214, 4, 4}
\definecolor{cvGreen}{RGB}{88,171,5}
\colorlet{cvDarkBlue}{cvBlue!70!black}
\colorlet{cvDarkRed}{cvRed!70!black}
\colorlet{cvDarkGreen}{cvGreen!70!black}

% Configuration commands
\def\cvThemeColor{blue}
\newcommand*{\themeColor}[1]{\def\cvThemeColor{#1}}
\newcommand*{\name}[1]{\def\cvName{#1}}
\newcommand*{\email}[1]{\def\cvEmail{#1}}
\newcommand*{\web}[1]{\def\cvWeb{#1}}
\newcommand*{\linkedin}[1]{\def\cvLinkedin{#1}}
\newcommand*{\github}[1]{\def\cvGithub{#1}}

\newcommand*{\companyName}[1]{\def\cvCompanyName{#1\vspace{8pt}}}
\newcommand{\companyAddress}[1]{\def\cvCompanyAddress{#1}}
\newcommand*{\position}[1]{\def\cvPosition{#1\vspace{8pt}}}
\newcommand{\body}[1]{\def\cvBody{#1}}

% Style commands
\newcommand*{\headerNameStyle}[1]{{\color{darkgray}\fontsize{28pt}{1em}\MakeUppercase{\nameFont{#1}}}}
\newcommand*{\contactStyle}[1]{{\fontsize{8pt}{1em}\color{darkgray}\monoFont{#1}}}

% an entry within the contact section
% args:
% #1: URL to hyperlink to
% #2: value to display
% #3: icon (font awesome) to include
\newcommand*{\contactItem}[3]{
  \contactStyle{
    \href{#1}{
      \fontsize{9pt}{1em}{#3}
      \hspace{-5pt} #2
    }
  }
}

% constructs the contact section based on the defined contact items
\newcommand{\mkContact}{
  \ifthenelse{\equal{\cvEmail}{}}{}{\contactItem{mailto:\cvEmail}{\cvEmail}{\faEnvelope}}
  \ifthenelse{\equal{\cvWeb}{}}{}{\contactItem{https://\cvWeb}{\cvWeb}{\faHome}}
  \ifthenelse{\equal{\cvLinkedin}{}}{}{\contactItem{https://www.linkedin.com/in/\cvLinkedin}{\cvLinkedin}{\faLinkedin}}
  \ifthenelse{\equal{\cvGithub}{}}{}{\contactItem{https://github.com/\cvGithub}{\cvGithub}{\faGithub}}
}

\newcommand{\mkCompany}{
  {\large\textbf{\cvCompanyName}}
  \hfill
  {\itshape{\today}}\\
  {\cvCompanyAddress}\\
}

% mkHeader will construct the header of the document
% this includes the name and the tagline
\newcommand*{\mkHeader}{
    \begin{minipage}[t]{\linewidth}
      \begin{center}
        \headerNameStyle{\cvName}\\
        \vspace{5pt}
        {\mkContact}\\
        {\hrulefill}
        \vspace{1cm}
      \end{center}
    \end{minipage}
}

% mkBody constructs the body of the cv
% this includes the left side, split, and right side
\newcommand{\mkBody}{
  \begin{minipage}[t]{\linewidth}
    {\mkCompany}


    \onehalfspacing
    {\cvBody}
    {\vspace{0.5cm}}

    Sincerely,\\
    {\includegraphics[height=1.5cm]{signature.png}}\\
    {\cvName}
  \end{minipage}
}
