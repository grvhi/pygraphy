clean:
	rm -vf dist/*
	rm -rvf build/*

build: clean
	python setup.py bdist_wheel

pre_release: build
	twine upload --verbose --repository-url https://test.pypi.org/legacy/ dist/*

release: build
	twine upload dist/*

doc:
	mkdocs build

.PHONY: release
