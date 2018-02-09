VENV=.venv

.DEFAULT: null
.PHONY: null
null:
	@echo No default target.

.PHONY: venv
venv: ${VENV}

${VENV}: requirements.txt
	@python3 -mvenv ${@}
	@${VENV}/bin/pip install --upgrade pip setuptools wheel
	@${VENV}/bin/pip install --upgrade --requirement requirements.txt

requirements.txt:
	@echo ${@} is missing.

.PHONY: flake8
flake8:
	@flake8

.PHONY: test
test:
	@${VENV}/bin/python setup.py test

.PHONY: isort
isort:
	@${VENV}/bin/isort --recursive .

.PHONY: auto
auto:
	@${VENV}/bin/isort

.PHONY: clean
clean:
	@git clean -xfd
