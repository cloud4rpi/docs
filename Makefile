.PHONY: build clean publish

init:
	pip install mkdocs

build:
	mkdocs build --clean

clean:
	rm -rf site/*

publish:
	mkdocs gh-deploy --clean
