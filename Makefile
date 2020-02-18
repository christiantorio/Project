## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	py -m venv f/Coding/Python/pipeline-project/.devops

install:
	# This should be run from inside a virtualenv
	 pip install --user -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python3 -m pytest -vv --cov=myrepolib tests/*.py
	#python3 -m pytest --nbval notebook.ipynb

lint:
	# S his is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

all: install lint test
