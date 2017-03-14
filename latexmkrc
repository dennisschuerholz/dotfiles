# LaTeXmk configuration file

# Usage example
# latexmk file.tex

# Main command line options
# -pdf : generate pdf using pdflatex
# -pv  : run file previewer
# -pvc : run file previewer and continually recompile on change
# -C   : clean up by removing all regeneratable files

# Generate pdf using pdflatex (-pdf)
$pdf_mode = 1;

# Use bibtex if a .bib file exists
$bibtex_use = 1;
