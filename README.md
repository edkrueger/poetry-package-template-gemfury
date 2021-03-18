# poetry-template

## Notes
When using this template and making poetry packages in general, it is easiest to have the name of the directory your package is in and the name in `pyproject.toml` match. Because Python imports do not like dashes and underscores are uncommon in package names, I'd recommend using neither.  

## Pushing to PyPI

### Environmental variables
Environmental variables are a good way to keep our tokens secret and our options configurable. To set them, copy `sample.envrc` to `.envrc` and change the values.  
To load `.envrc`, one cloud just run `.envrc` as a shell script, but direnv will make things easier by automatically loading the variable when you enter the directory, once allowed.  
To install direnv on a mac running zsh, use brew to install with `brew install direnv` and hook in into your shell by adding `eval "$(direnv hook zsh)"` to your `.zshrc` file. For other install instructions see: https://direnv.net/.  
To allow direnv to load `.envrc` in a directory run `direnv allow`.  

## Dev Instructions
Run `poetry install` to install the env.  
Run `poetry run pre-commit install` to initialize the git hooks.  
Run `poetry run pre-commit run --all-files` if there are file that were committed before adding the git hooks.  
Activate the shell with: `poetry shell`  
Lint with: `poetry run pylint resc/ tests/`  
Test with: `poetry run pytest --cov=resc`
