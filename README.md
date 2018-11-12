# Venv Utils

This is a single script that began as some aliases to ease pain working with virtual environments when I decided to ditch Pycharm for Vim. Soon my needs became such that an aliased command was not enough and made them into functions. Later I discovered [virtualenvwrapper](https://bitbucket.org/dhellmann/virtualenvwrapper), thought about using it but my need were already satisfied with these functions (also making your own tools feel very very nice!).

# Installation

Source the script inside your .bash_aliases or wherever you put your aliases in, then use the functions as you wish.

# Contents

The script contains the following functions:

* `installreqs`
* `preparenv`
* `actenv`
* `createnv`

# Workflow

1. Use `createnv` inside your project folder to create a virtualenv inside the .venv folder on your `HOME` directory, this also will create onact and onexit files inside the ~/.env_vars folder (onact should contain declarations of project specific environment variables and onexit should unset them), then call `preparenv` to hook into the virtualenv activate script to source `onact` when activating the environment and `onexit` when deactivating. Call it with 1 argument to specify the name of the virtualenv, call it with another one to specify another python interpreter (defaults to 3.6 as of now).
2. Use `actenv` to activate the virtualenv in ~/.venvs with the name of the project. Call it with another virtualenv name to activate that instead.
3. Use `installreqs` to install `requirements.txt` if any on the current folder. It will not detect if an environment is active, be aware of that.
4. Use `preparenv` only if you didn't make the virtualenv to prepare with `createnv`, it currently isn't aware if it has been called before on a given virtualenv.
