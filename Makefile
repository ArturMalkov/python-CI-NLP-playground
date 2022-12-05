# all the steps forming the lifecycle of a project - clearly articulates all the different things we need to do for the
# project
install:
	# install commands
	pip install --upgrade pip && \
		pip install -r requirements.txt && \
			  python -m textblob.download_corpora
format:
	# format code
	black *.py mylib/*.py
lint:
	# flake8/pylint
	pylint --disable=R,C *.py mylib/*.py  # disable recommended and configuration warnings (too verbose for dev process)
test:
	# test
	pytest -vv --cov=mylib --cov=main  # to indicate how much test coverage share inside mylib/ and main.py is
build:
	# build Docker container
	docker build -t fastapi-wiki-textblob .
run:
	# run Docker container
	docker run -p 8000:8000 fastapi-wiki-textblob
deploy:
	# deploy
all: install lint test deploy
	# convention for the place where you can run every single command together