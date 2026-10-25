.PHONY: all build html serve clean

all: build

# HTML and PDF for every topic into build/ (build/<topic>.pdf)
build:
	bin/build

# HTML only, skip the PDF
html:
	bin/build --html

# Live preview at http://localhost:4000/topics/<topic>.html
serve:
	jekyll serve

clean:
	rm -rf build _site .jekyll-cache .jekyll-metadata
