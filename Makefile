.PHONY: build clean publish

init:
	pip install mkdocs mkdocs-material

build:
	mkdocs build --clean

clean:
	rm -rf site/*

publish:
	mkdocs gh-deploy --clean

build_deploy:
	bash deploy.sh
