# Venv Utils

This is a single script that began as some aliases to ease pain working with virtual environments when I decided to ditch Pycharm for Vim. Soon my needs became such that an aliased command was not enough and made them into functions. Later I discovered [virtualenvwrapper](https://bitbucket.org/dhellmann/virtualenvwrapper), thought about using it but my need were already satisfied with these functions (also making your own tools feel very very nice!).

# Installation

Clone the repo, call `sudo make` or `sudo make install` and the commands should be copied to your path. Additionally you should create an alias for `actenv` wherever you this way: `alias actenv='source actenv'` to make it work as intended.

# Contents

The commands included here are the following:

* `actenv`
* `createnv`
* `installreqs`
* `deletenv`

# Workflow

You can control where the virtual environments and the enviroment variables are stored using `$VENV_DIR` and `$VENV_ENVAR_DIR` respectively.
The default directories are `~/.venvs` and `~/.env_vars`.

1. Use `createnv` inside your project folder to create a virtualenv inside the directory specified in `$VENV_DIR`, this also will create onact and onexit files inside the `$VENV_ENVAR_DIR` folder (onact should contain declarations of project specific environment variables and onexit should unset them). 
  To select a custom python executable call it with the flag `-p`, it defaults to use `python3`. e.g. `createnv -p python36`,
  To create a virtual environment with a custom name (not the name of the current folder) call it with the flag `-d`. e.g. `createnv -d somenvironment`.
2. Use `actenv` to activate the virtualenv in `$VENV_DIR` with the name of the project. Passing it one argument will activate the virtual environment with that name instead.
3. Use `installreqs` to install `requirements.txt` if any on the current folder. It will not detect if an environment is active, be aware of that.
4. If needed use `deletenv` to remove a virtual environment and its environment variables.
