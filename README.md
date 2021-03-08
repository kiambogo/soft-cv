# SoftCV

[![Build](https://github.com/kiambogo/soft-cv/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/kiambogo/soft-cv/actions/workflows/build.yml)

### A LaTeX template for a [software engineer focused] curriculum vitae.

<img src="https://user-images.githubusercontent.com/4472397/110373020-dc0c8f80-8003-11eb-9d71-3cc6c753b7ad.png" width="800">

## Instructions

You will need a full Tex distribution installed to build.

Assuming you have `xelatex` in your PATH, simply modify `cv.tex` to your liking and compile to PDF with `xelatex cv.tex`.

### Customization

The following are the available commands used for customizing the template to make it yours. You can take a look at the original `cv.tex` as an example.

``` tex
\themeColor{cvDarkBlue} % Change the theme color
\name{Christopher Poenaru} % Your name, as it appears at the top of the document
\tagline{Computer Engineer {\hspace{5pt}--\hspace{5pt}}  Functional Programmer {\hspace{5pt}--\hspace{5pt}} Triathlete {\hspace{5pt}--\hspace{5pt}} Rock Climber} % Tagline displayed below your name
\email{kiambogo@gmail.com} % Your email, displayed in the Contact section
\web{chrispoenaru.com} % Your website, displayed in the Contact section
\linkedin{chrispoenaru} % Your linkedin alias, displayed in the Contact section
\github{kiambogo} % Your Github handle, displayed in the Contact section

\skills{...} % List of skillsItem, comprising the Skills section
\about{...} % Optional About section
\projects{...} % List of cvEntry, comprising the Projects section
\experience{...} % List of cvEntry, comprising the Experience section
\education{...} % List of cvEntry, comprising the Education section
```

### Theme Colours
The following colours are defined and ready for use.

``` tex
cvBlue
cvRed
cvGreen
cvDarkBlue
cvDarkRed
cvDarkGreen
```

#### Green:
<img src="https://user-images.githubusercontent.com/4472397/110373025-dca52600-8003-11eb-9951-f4cd153668fc.png" width="600">

#### Red:
<img src="https://user-images.githubusercontent.com/4472397/110373400-4d4c4280-8004-11eb-8364-aa05f4b67e18.png" width="600">

You can also sub in your own custom colours if you'd like.

> cv.tex
``` tex
\definecolor{aquamarine}{RGB}{127, 255, 212}
\themeColor{aquamarine}
```

