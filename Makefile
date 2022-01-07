default: start

# --------------------------------------------------------------------------------------------------
# Docker compose settings
# --------------------------------------------------------------------------------------------------
# For Windows11 + WSL + WSLg(https://github.com/microsoft/wslg)
compose-conf:
				bash './scripts/set-wslg.sh'
				cd ./docker	&& docker-compose config

compose-up:
				bash docker-compose -f docker-compose.yml up -d --build

# --------------------------------------------------------------------------------------------------
# In container command
# --------------------------------------------------------------------------------------------------
start:
				poetry run python src/main.py

install-dev:
				poetry config virtualenvs.in-project true
				poetry install

install:
				poetry config virtualenvs.in-project true
				poetry install --no-dev

lint:
				poetry run pysen run lint

lint-fix:
				poetry run pysen run format && \
				poetry run pysen run lint

test:
				poetry run pytest

clean:
				rm -rf  **/__pycache__ **/**/__pycache__ .venv

.PHONY: start lint lint-fix test install-dev install clean test
