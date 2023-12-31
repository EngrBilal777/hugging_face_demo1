install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vvv --cov=hello --cov=greeting \
		--cov=smath --cov=web tests
	python -m pytest --nbval notebook.ipynb #tests on jupyter notebook
	#python -m pytest -v tests/test_web.py # just want to test web

debug:
	python -m pytest -vv --pdb #debugger is invoked

one-test:
	python -m pytest -vv tests/test_greeting.py::test_my_name4

debugthree:
	#not working the way I report
	python -m pytest  -vv --pdb --maxfail=4  # drop to pdb for the first three failures

format:
	black *.py

lint:
	pylint --disable=R,C *.py

all: install lint test format 