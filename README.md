# xonsh-awesome-cli-app

Example of awesome cli app template for xonsh. Just fork it and add your commands.

## Features

* Based on power and sugar from [click](https://click.palletsprojects.com).
* Setting up context with logging and debugging levels.
* Setting up context options and command arguments.
* Ability to use environment variables as replacement of options and arguments.
* Use `ctx.log` to different logging levels.

## Usage

You can use this app as a template to your own apps.

```xsh
git clone https://github.com/anki-code/xonsh-awesome-cli-app
cd xonsh-awesome-cli-app
chmod +x myapp

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

./myapp context
# Environment:
# {'MYAPP_NAME': 'Alex'}
# Context:
# {'debug': False, 'log': <RootLogger root (INFO)>, 'name': 'Alex'}

./myapp --debug hello
# TRACE SUBPROC: (['echo', 'Hello', 'DefaultName'],)
# Hello DefaultName
# TRACE SUBPROC: (['echo', 'Here', 'is', 'debug', 'message', 'too', ''],)
# Here is debug message too
```

## Future

I'm going to transform this to pip-installable xonsh xontrib using [xontrib template](https://github.com/xonsh/xontrib-template) e.g.
```xsh
pip install .
myapp hello
# Hello DefaultName
```
