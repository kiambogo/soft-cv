% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{soft-cv}[2021/03/03 SoftCV]

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
\newcommand*{\tagline}[1]{\def\cvTagline{#1}}
\newcommand*{\email}[1]{\def\cvEmail{#1}}
\newcommand*{\web}[1]{\def\cvWeb{#1}}
\newcommand*{\linkedin}[1]{\def\cvLinkedin{#1}}
\newcommand*{\github}[1]{\def\cvGithub{#1}}
\newcommand*{\skills}[1]{\def\cvSkills{#1\vspace{8pt}}}
\newcommand*{\projects}[1]{\def\cvProjects{#1}}
\newcommand*{\contact}[1]{\def\cvContact{#1}}
\newcommand{\about}[1]{\def\cvAbout{#1\vspace{8pt}\\}}
\newcommand*{\experience}[1]{\def\cvExperience{#1}}
\newcommand*{\education}[1]{\def\cvEducation{#1}}

% Style commands
\newcommand*{\headerNameStyle}[1]{{\color{darkgray}\fontsize{28pt}{1em}\MakeUppercase{\nameFont{#1}}}}
\newcommand*{\taglineStyle}[1]{{\color{\cvThemeColor!75}\fontsize{8pt}{1em}\MakeUppercase{\bodyfont{#1}}}}
\newcommand*{\sectionTitleStyle}[1]{{\color{\cvThemeColor}\fontsize{10pt}{1em}\MakeUppercase{\sectionTitleFont{#1}}}}
\newcommand*{\subsectionTitleStyle}[1]{{\color{darkgray}\fontsize{9pt}{1em}{\textbf{\MakeUppercase{\bodyfont{#1}}}}}}
\newcommand*{\subsubsectionTitleStyle}[1]{{\fontsize{8pt}{1em}\bodyfont\textbf{\scshape\color{gray} #1}}}
\newcommand*{\locationStyle}[1]{{\color{\cvThemeColor}\fontsize{8pt}{1em}\bodyfontlight\textit{#1}}}
\newcommand*{\datesStyle}[1]{{\color{darkgray}\fontsize{8pt}{1em}\bodyfontlight\textit{#1}}}
\newcommand*{\contactStyle}[1]{{\fontsize{8pt}{1em}\color{darkgray}\monoFont{#1}}}
\newcommand*{\bodyStyle}[1]{{\small\color{darkgray}{#1}}}

% a section within the cv (skills/education/experience/etc)
% args:
% #1: section title [skills]
% #2: section content
\newcommand*{\mkSection}[2]{
  \RaggedRight{
    \sectionTitleStyle{#1}
    \vspace{-5pt}\\
    {\hrulefill}
    \vspace{7pt}\\
    {#2}
    \vspace{7pt}
  }
}

% an entry within the contact section
% args:
% #1: URL to hyperlink to
% #2: value to display
% #3: icon (font awesome) to include
\newcommand*{\contactItem}[3]{
  \hspace{-11pt}
  \contactStyle{
    \href{#1}{\raisebox{-3.5pt}{
        \begin{tikzpicture}
          \node at (0,0) [draw,fill=\cvThemeColor!30] {\fontsize{9pt}{1em}{#3}};
        \end{tikzpicture}
      } \hspace{-10pt} #2}
    \vspace{6pt}
  }\\
}

% an entry within the skills section
% args:
% #1: skill to list [scala]
\newcommand*{\skillsItem}[1]{
  \bodyStyle{#1}\vspace{5pt}\\
}

% an entry within a section
% args:
% #1: title [company A]
% #2: location [vancouver]
% #3: cvSubEntries
\newcommand{\cvEntry}[3]{
  \subsectionTitleStyle{#1} \hfill \locationStyle{#2}\\
  {#3}
  \vspace{8pt}
}

% an subentry within a section
% args:
% #1: subtitle [software engineer]
% #2: date(s) of entry [Jan. 2019 - PRESENT]
% #3: body
\newcommand{\cvSubEntry}[3]{
  \vspace{3pt}
  \subsubsectionTitleStyle{#1} \hfill \datesStyle{#2}\\
  {#3}
}

% a list residing within a cvEntry
% args:
% #1: the set of \item entries for listing [\item A \\ \item B]
\newcommand{\entryItems}[1]{
  \bodyStyle{
  \begin{itemize}[leftmargin=*]
    {#1}
  \end{itemize}
  }
}

% constructs the contact section based on the defined contact items
\newcommand{\mkContact}{
  \ifthenelse{\equal{\cvEmail}{}}{}{\contactItem{mailto:\cvEmail}{\cvEmail}{\faEnvelope}}
  \ifthenelse{\equal{\cvWeb}{}}{}{\contactItem{https://\cvWeb}{\cvWeb}{\faHome}}
  \ifthenelse{\equal{\cvLinkedin}{}}{}{\contactItem{https://www.linkedin.com/in/\cvLinkedin}{\cvLinkedin}{\faLinkedin}}
  \ifthenelse{\equal{\cvGithub}{}}{}{\contactItem{https://github.com/\cvGithub}{\cvGithub}{\faGithub}}
}

% mkHeader will construct the header of the document
% this includes the name and the tagline
\newcommand*{\mkHeader}{
    \begin{minipage}[t]{\linewidth}
      \RaggedLeft{
        \headerNameStyle{\cvName}\\
        \taglineStyle{\cvTagline}
      }
    \end{minipage}
    \vspace{20pt}
}

% mkBody constructs the body of the cv
% this includes the left side, split, and right side
\newcommand{\mkBody}{
  \newcommand{\mkLeft}{
    \begin{minipage}[t]{0.25\linewidth}
      \mkSection{Skills}{{\cvSkills}}
      \mkSection{Projects}{{\cvProjects}}
      \mkSection{Contact}{{\mkContact}}
    \end{minipage}
  }
  \newcommand{\mkSplit}{
    \hspace{5pt}
    \color{\cvThemeColor!80!black}\vrule width 1pt
    \hspace{5pt}
  }
  \newcommand{\mkRight}{
    \begin{minipage}[t]{0.75\linewidth}
      \ifthenelse{\equal{\cvAbout}{}}{}{\mkSection{About}{{\bodyStyle{\cvAbout}}}}
      \mkSection{Experience}{{\cvExperience}}
      \mkSection{Education}{{\cvEducation}}
    \end{minipage}
  }

  {\mkLeft}
  {\mkSplit}
  {\mkRight}
}
