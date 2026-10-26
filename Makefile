.PHONY: install test lint format format-check typecheck train serve check

install:
	uv sync --dev

test:
	uv run pytest

lint:
	uv run ruff check .

format:
	uv run ruff format .

format-check:
	uv run ruff format --check .

typecheck:
	uv run mypy src tests

train:
	uv run python -m ml_project_template.training.train

serve:
	uv run uvicorn ml_project_template.serving.app:app --host 0.0.0.0 --port 8000

check: lint format-check typecheck test