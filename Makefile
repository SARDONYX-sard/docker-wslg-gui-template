default: start

# --------------------------------------------------------------------------------------------------
# Docker compose settings
# --------------------------------------------------------------------------------------------------
# For Windows11 + WSL + WSLg(https://github.com/microsoft/wslg)
compose-conf:
				bash './scripts/set-wslg.sh'
				cd ./docker	&& docker-compose config

compose:
				cd ./docker	&& docker-compose -f docker-compose.yml up -d --build
				docker exec -it docker-python-gui-1 bash

compose-rebuild:
				docker compose -f "docker/docker-compose.yml" down
				make compose

.PHONY: compose-conf compose compose-rebuild

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

ci:
				rm -rf .venv && make install-dev

clean:
				rm -rf  **/__pycache__ .pytest_cache .mypy_cache

.PHONY: start lint lint-fix test install-dev install clean test
