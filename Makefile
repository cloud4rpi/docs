.PHONY: clean publish

build:
	mkdocs build --clean

clean:
	rm -rf site/*

publish:
	mkdocs gh-deploy --clean
