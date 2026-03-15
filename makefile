include .env

all: unredacted.pdf resume.pdf
	@echo "PDFs generated."

unredacted.pdf: resume.typ
	typst compile --font-path ~/Library/Fonts --input EMAIL="$(EMAIL)" --input PHONE_NUMBER="$(PHONE_NUMBER)" --input LINKEDIN="$(LINKEDIN)" --input GITHUB="$(GITHUB)" resume.typ unredacted.pdf

resume.pdf: resume.typ
	typst compile --font-path ~/Library/Fonts resume.typ resume.pdf