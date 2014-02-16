.PHONY: watch test deploy

open:
	subl --project signals.sublime-project

watch:
	watchr Watch

p:
	. venv/bin/activate; python

test:
	. venv/bin/activate; python -m unittest discover -s tests

update:
	. venv/bin/activate; pip install -r requirements.txt --upgrade

venv:
	virtualenv venv
	. venv/bin/activate; pip install -r requirements.txt

deploy: tag upload

tag:
	git tag -a v$(shell python -c "import signals;print signals.version;") -m ""
	git push origin v$(shell python -c "import signals;print signals.version;")

upload:
	python setup.py sdist upload
