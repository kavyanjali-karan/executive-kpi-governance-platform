install:
	pip install -r requirements.txt

test:
	pytest

format:
	black .

validate:
	pytest