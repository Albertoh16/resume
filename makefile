include .env

all: Alberto_S_Hernandez_Resume.pdf resume.pdf
	@echo "PDFs generated."

Alberto_S_Hernandez_Resume.pdf: resume.typ
	typst compile --font-path ~/Library/Fonts --input EMAIL="$(EMAIL)" --input PHONE_NUMBER="$(PHONE_NUMBER)" --input LINKEDIN="$(LINKEDIN)" --input GITHUB="$(GITHUB)" resume.typ Alberto_S_Hernandez_Resume.pdf

resume.pdf: resume.typ
	typst compile --font-path ~/Library/Fonts resume.typ resume.pdf