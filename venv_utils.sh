#!/usr/bin/env bash


# Install the requirements if requirements.txt exists in current working directory.
installreqs () {
    if [ -e $PWD/requirements.txt ]; then
        pip install -r requirements.txt
    fi
}

# Make the virtual environment source the project virtual environment on activate and unset them on deactivate
preparenv () {
    DIR=${PWD##*/}

    echo -e '\n# Source the project environment variables when the venv is activated'>> ~/.venvs/$DIR/bin/activate
    echo 'source ~/.env_vars/'"$DIR"'/onact' >> ~/.venvs/$DIR/bin/activate
    sed -i '
        /deactivate ()/,/^}$/ {
        /^}$/ i\
    \n    # Unset the environment variables when deactivating the venv\
    \source ~/.env_vars/'"$DIR"'/onexit
    }
    ' ~/.venvs/${DIR}/bin/activate
}

# Activate the current project's virtual environment or an arbitrary one
actenv () {
    DIR=${PWD##*/}

    source ~/.venvs/${1-$DIR}/bin/activate
}

# Create a virtual environment
createnv () {
    ENVDIR=~/.env_vars/
    DIR=${PWD##*/}
    PY=python3.6

    virtualenv --python=${2-$PY} ~/.venvs/${1-$DIR}

    if [ ! -d $ENVDIR/$DIR ]; then
        mkdir $ENVDIR/$DIR
        touch $ENVDIR/$DIR/onact
        touch $ENVDIR/$DIR/onexit
    fi

    preparenv
    actenv

    if [ ${1-$DIR} == $DIR ]; then
        installreqs
    fi
}

