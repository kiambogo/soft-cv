# Resume/CV Update Skill

This skill helps you update Christopher's resume efficiently with visual feedback.

## How to Invoke

To use this skill, invoke it with:
```
/skill update-resume
```

Or simply say: "update my resume to..." and Claude will use this skill automatically.

## Overview

This skill automates the workflow for updating the LaTeX-based resume, including:
- Editing the .tex file
- Compiling to PDF
- Generating PNG for visual inspection
- Providing visual feedback on how changes look

## Resume Location

- **Main file:** `/Users/cpoenaru/dev/soft-cv/cv.tex`
- **Class file:** `/Users/cpoenaru/dev/soft-cv/cv.cls`
- **Output PDF:** `/Users/cpoenaru/dev/soft-cv/cv.pdf`
- **Preview PNG:** `/Users/cpoenaru/dev/soft-cv/cv_preview.png`

## Workflow

When updating the resume, follow this workflow:

### 1. Read Current Resume
First, read the current resume to understand what needs to be changed:
```
Read: /Users/cpoenaru/dev/soft-cv/cv.tex
```

### 2. Make Edits
Use the Edit tool to make changes to the .tex file. Be precise with the old_string to ensure exact matches.

### 3. Compile to PDF
After making edits, compile using tectonic:
```bash
cd /Users/cpoenaru/dev/soft-cv && tectonic cv.tex
```

### 4. Generate PNG Preview
Convert the PDF to PNG so you can visually inspect the changes using macOS's built-in sips tool.
```bash
cd /Users/cpoenaru/dev/soft-cv && sips -s format png cv.pdf --out cv_preview.png
```

### 5. Read and Show Preview
Read the PNG to visually inspect how the resume looks:
```
Read: /Users/cpoenaru/dev/soft-cv/cv_preview.png
```

Also read the PDF to see the text rendering:
```
Read: /Users/cpoenaru/dev/soft-cv/cv.pdf
```

### 6. Provide Feedback
After reading the preview, provide feedback on:
- How the changes look visually
- Any spacing issues
- Whether content fits on one page
- Overall readability and impact

## Best Practices

### Content Guidelines
- **About section:** Should be punchy, differentiated, show unique value proposition
- **Experience bullets:** Lead with outcomes/impact, not just activities
- **Metrics matter:** Include numbers, percentages, scale whenever possible
- **Staff-level work:** Show organizational impact, cross-functional leadership, technical depth
- **One page:** Resume must fit on a single page

### Writing Style
- Avoid buzzwords and generic phrases
- Lead with business impact, then explain technical how
- Use strong action verbs (Built, Architected, Led, Established)
- Be specific about scope (team size, number of services, customer scale)
- Show both technical depth AND business value

### Spacing Considerations
If content doesn't fit on one page, consider:
- Reducing `\vspace{}` values in cv.tex
- Adjusting spacing in cv.cls (section/subsection spacing)
- Condensing bullets (remove less impactful ones)
- Tightening language (remove unnecessary words)

### Visual Checks
When reviewing the PNG/PDF, check:
- All content fits on one page
- No awkward line breaks or orphaned words
- Consistent spacing between sections
- Professional appearance
- Easy to scan and read

## Common Tasks

### Update About Section
The About section should be concise and impactful. Current format:
```latex
\cvabout{%
  Text here describing value proposition and expertise
}{%
  \skillline{Core}{Languages}
  \skillline{Platform}{Tools}
  ...
}
```

### Add/Update Experience Bullets
Experience bullets use this format:
```latex
\cvjob{Company}{Location}{Title}{Dates}{%
  \item First bullet point
  \item Second bullet point
  \item Third bullet point
}
```

### Adjust Spacing
- Between sections: Modify `\vspace{}` commands in cv.tex
- Section titles: Modify `\titlespacing*{\section}` in cv.cls
- Job entries: Modify `\titlespacing*{\subsection}` in cv.cls

## Example Complete Workflow

```
1. Read /Users/cpoenaru/dev/soft-cv/cv.tex
2. Edit /Users/cpoenaru/dev/soft-cv/cv.tex (make changes)
3. Bash: cd /Users/cpoenaru/dev/soft-cv && tectonic cv.tex
4. Bash: cd /Users/cpoenaru/dev/soft-cv && convert -density 150 cv.pdf -quality 90 cv_preview.png
5. Read /Users/cpoenaru/dev/soft-cv/cv_preview.png
6. Read /Users/cpoenaru/dev/soft-cv/cv.pdf
7. Provide visual feedback and recommendations
```

## Troubleshooting

### PDF doesn't compile
- Check for LaTeX syntax errors in the tectonic output
- Ensure all `\item` entries are inside `\begin{itemize}...\end{itemize}` or job entry blocks
- Check for unmatched braces `{` `}`

### Content overflows to page 2
- Reduce spacing (see "Spacing Considerations" above)
- Condense bullets or remove less impactful content
- Consider combining related bullets

### PNG generation fails
- Try alternative command: `pdftoppm` instead of ImageMagick `convert`
- Check if tools are installed: `which convert` or `which pdftoppm`
- Fall back to reading PDF only if PNG generation is not possible

## Remember

Always compile and visually inspect changes before considering the task complete. The visual appearance matters as much as the content.
