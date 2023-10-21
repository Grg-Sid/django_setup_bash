#!/bin/bash

# Check if the required number of arguments is provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <directory_path> <project_name> [app_name1 app_name2 ...]"
    exit 1
fi

directory_path="$1"
project_name="$2"
shift 2 # Shift the arguments to remove directory path and project name

# Check if the directory exists, and if not, create it
if [ ! -d "$directory_path" ]; then
    mkdir -p "$directory_path"
fi

# Change to the specified directory
cd "$directory_path"

# Check if Python is available
if ! [ -x "$(command -v python3)" ]; then
    echo "Python3 is not installed. Please install Python3 and try again."
    exit 1
fi

# Check if Python virtual environment is available
if ! [ -x "$(command -v python3 -m venv)" ]; then
    echo "Python virtual environment (python3 -m venv) is not installed. Please install it and try again."
    exit 1
fi

# Create a virtual environment and activate it
python3 -m venv .venv
source .venv/bin/activate

# Install Django and Django REST framework
pip install django djangorestframework
pip freeze > requirements.txt

# Define a function to create a Django project and optionally start apps
create_django_project() {
    # Check if django-admin is available
    if ! [ -x "$(command -v django-admin)" ]; then
        echo "Django is not installed. Please install Django and try again."
        exit 1
    fi

    # Create the Django project
    django-admin startproject "$project_name" .

    if [ $# -gt 0 ]; then
        while [ $# -gt 0 ]; do
            app_name="$1"
            shift 1 # Shift the argument to remove app name
            python3 manage.py startapp "$app_name"
        done
    fi
}

# Create the Django project and optional apps
create_django_project "$@"
