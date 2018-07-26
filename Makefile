.PHONY: build clean publish build_deploy build_image build_in_docker serve_in_docker

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

build_image:
	docker build --rm --tag docs-build-env .

build_in_docker: build_image
	docker run --rm --volume $(shell pwd):/docs -w /docs docs-build-env make build

serve_in_docker: build_in_docker
	docker run --rm --volume $(shell pwd):/docs -w /docs -p 8000:8000 docs-build-env mkdocs serve -a 0.0.0.0:8000
