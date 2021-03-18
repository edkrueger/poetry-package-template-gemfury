# poetry-template

## Notes
When using this template and making poetry packages in general, it is easiest to have the name of the directory your package is in and the name in `pyproject.toml` match. Because Python imports do not like dashes and underscores are uncommon in package names, I'd recommend using neither.  

## Dev Instructions
Run `poetry install` to install the env.  
Run `poetry run pre-commit install` to initialize the git hooks.  
Run `poetry run pre-commit run --all-files` if there are file that were committed before adding the git hooks.  
Activate the shell with: `poetry shell`  
Lint with: `poetry run pylint resc/ tests/`  
Test with: `poetry run pytest --cov=resc`
