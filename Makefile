# all the steps forming the lifecycle of a project - clearly articulates all the different things we need to do for the
# project
install:
	# install commands
	pip install --upgrade pip && \
		pip install -r requirements.txt
format:
	# format code
	black *.py mylib/*.py
lint:
	# flake8/pylint
	pylint --disable=R,C *.py mylib/*.py  # disable recommended and configuration warnings
test:
	# test
deploy:
	# deploy
all: install lint test deploy
	# convention for the place where you can run every single command together