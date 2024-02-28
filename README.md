# xonsh-awesome-cli-app

Example of awesome cli app template for xonsh.

## Features

* Based on [click](https://click.palletsprojects.com).
* Setting up context with logging and debugging levels.
* Setting up context arguments and command arguments.
* Ability to use environment variables as replacement of arguments.

## Usage

You can use this app as a template to your own apps.

```xsh
./myapp
# Usage: myapp [OPTIONS] COMMAND [ARGS]...
# 
#   CLI management.
# 
# Options:
#   --name TEXT  Context argument: name.
#   --debug      Context argument: debug mode.
#   --help       Show this message and exit.
# 
# Commands:
#   hello    Say hello.
#   context  Show app context.

./myapp hello --help
# Usage: myapp hello [OPTIONS]
# 
#   Say hello.
# 
# Options:
#   --wait  Command argument: wait before print.
#   --help  Show this message and exit.

./myapp hello
# Hello DefaultName

./myapp hello --wait
# Wait...
# Hello DefaultName

./myapp --name Mike hello --wait
# Wait...
# Hello Mike

$MYAPP_NAME = 'Alex'
./myapp hello
# Hello Alex
```

## Future

I'm going to transform this to pip-installable xonsh xontrib using [xontrib template](https://github.com/xonsh/xontrib-template).
