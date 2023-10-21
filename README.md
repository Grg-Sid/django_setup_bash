# Django Project Setup Script

This Bash script automates the process of setting up a Django project with optional app creation. It creates a virtual environment, installs Django and Django REST framework, and sets up the project structure.

## Usage

You can use this script by providing the following arguments:

```shell
./setup_django.sh <directory_path> <project_name> [app_name1 app_name2 ...]
```
- <directory_path>: The path where you want to create the Django project.

- <project_name>: The name of your Django project.

- You can also specify one or more optional [app_name1 app_name2 ...] arguments to create Django apps within the project.

## Prerequisites

Before running the script, make sure you have the following dependencies installed on your system:

- Python 3: You can download Python from the official website python.org.
- Python virtual environment (venv): You can create virtual environments using Python's venv module.

## Running the Script

- Clone this repository or copy the script (setup_django.sh) to your desired directory.

- Open your terminal and navigate to the directory where the script is located.

- Run the script with the appropriate arguments:

```shell
./setup_django.sh <directory_path> <project_name> [app_name1 app_name2 ...]
```

## Example

Here's an example of how to create a Django project named "myproject" with two apps "app1" and "app2" in a directory called "mydjangoprojects":

```shell
./setup_django.sh mydjangoprojects myproject app1 app2
```

This will set up the project and apps within a virtual environment.
## Notes

- This script assumes that you have Django and Django REST framework installed. If not, it will install them in your virtual environment.

- Make sure the script is executable. If it's not, you can make it executable using the following command:

```shell
chmod +x setup_django.sh
```

Please ensure that you have the necessary permissions to execute the script and install packages on your system.

## Happy Django development!
