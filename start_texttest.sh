#!/bin/sh

# Check if virtual environment directory exists, and if not, create one using Python 3
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment
. venv/bin/activate

# Check if texttest is installed in the virtual environment
if ! venv/bin/pip show texttest > /dev/null 2>&1; then
    echo "texttest is not installed. Installing texttest..."
    # Install texttest if it's not already installed
    pip install git+https://github.com/texttest/texttest.git
else
    echo "texttest is already installed."
fi

# Run texttest
venv/bin/texttest -d . -con "$@"

# Deactivate virtual environment
deactivate
