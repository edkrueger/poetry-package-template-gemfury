# poetry-template
How to push a Poetry package to a private Gemfury PyPI server

To see how to pull a package from a private Gemfury PyPI repository with Pipenv see: https://github.com/edkrueger/pipenv-consumer-example.  

## Notes
When using this template and making poetry packages in general, it is easiest to have the name of the directory your package is in and the name in `pyproject.toml` match. Because Python imports do not like dashes and underscores are uncommon in package names, I'd recommend using neither.  

## Pushing to Gemfury

### Environmental variables
Environmental variables are a good way to keep our tokens secret and our options configurable. To set them, copy `sample.envrc` to `.envrc` and change the values.  
To load `.envrc`, one could just run `.envrc` as a shell script, but direnv will make things easier by automatically loading the variable when you enter the directory, once allowed.  
To install direnv on a mac running zsh, use brew to install with `brew install direnv` and hook in into your shell by adding `eval "$(direnv hook zsh)"` to your `.zshrc` file. For other install instructions see: https://direnv.net/.  
To allow direnv to load `.envrc` in a directory run `direnv allow`.  

### Push to GemFury
Run `poetry config repositories.$PYPI_REPO_NAME $PYPI_REPO_URL` to set a reference to the Gemfury PyPI repository's URL for the given name.  Run `poetry config http-basic.$PYPI_REPO_NAME $PYPI_TOKEN $PYPI_TOKEN` to setup authentication to the PiPY repository for the same name. Then, run `poetry publish --build --repository $PYPI_REPO_NAME` to build and push the package to the Gemfury PyPI repository.


## Dev Instructions
Run `poetry install` to install the env.  
Run `poetry run pre-commit install` to initialize the git hooks.  
Run `poetry run pre-commit run --all-files` if there are file that were committed before adding the git hooks.  
Activate the shell with: `poetry shell`  
Lint with: `poetry run pylint poetrypackagetemplate/ tests/`  
Test with: `poetry run pytest --cov=poetrypackagetemplate`
