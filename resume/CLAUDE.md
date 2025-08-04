# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Typst Commands
- `typst compile cv.typ` - Compile the resume to PDF
- `typst watch cv.typ` - Watch for changes and recompile automatically
- `typst compile cv.typ --output resume.pdf` - Compile with custom output name

## Architecture

This is a resume project built with Typst, a modern markup-based typesetting system. The project structure includes:

- `cv.typ` - Main Typst resume file with custom styling and functions
- `simon_resume_markdown.md` - Source resume content in Markdown format
- `cv.pdf` - Generated PDF output

### Typst Resume Structure

The `cv.typ` file implements a custom resume template with the following architecture:

**Color System:**
- Uses Nord theme color palette (https://www.nordtheme.com/docs/colors-and-palettes)
- `nord_blue` (#5e81ac) - Nord10 for links
- `nord_secondary` (#3b4252) - Nord1 for secondary text like dates and technologies
- `nord0` (#2e3440) - Nord0 for headers and job titles

**Typography:**
- Main text: Inter font at 11pt
- Headers (h1, h2): Inter font with nord0 color
- Job titles and company names: JetBrains Mono font with extrabold weight
- Contact links: 10pt text size

**Reusable Functions:**
- `space_lg()` - Large vertical spacing (8pt)
- `space_md()` - Medium vertical spacing (6pt)
- `job_title(title)` - Formats job titles in JetBrains Mono italic bold
- `company_info(company, dates)` - Formats company name (bold) and dates (secondary color)
- `job_header(title, company, dates)` - Combines job title and company info on one line
- `technologies(tech_list)` - Formats technology arrays as comma-separated italic text in secondary color
- `chiline()` - Creates horizontal lines under section headers

**Content Structure:**
- Name and contact information with Nord blue links
- Summary paragraph
- Experience section with job entries using `job_header()` function
- Each job includes description, bullet points, and `technologies()` array
- Education section at the bottom

**FontAwesome Integration:**
- FontAwesome package import is commented out (icons don't work in PDF)
- Icon placeholders remain for future implementation

### Data Flow

The resume content flows from the Markdown file (`simon_resume_markdown.md`) which contains the source information, to the structured Typst file (`cv.typ`) which applies consistent formatting and generates the PDF output.