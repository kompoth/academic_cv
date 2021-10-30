SOURCE=resume.tex
DOCNAME=negrebetskiy_cv

all:
	pdflatex -jobname=${DOCNAME} ${SOURCE}

clean:
	rm -f ${DOCNAME}.*
