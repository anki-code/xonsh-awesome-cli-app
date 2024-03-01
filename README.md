<p align="center">  
    Example of awesome CLI app template for xonsh. Just fork it and add your commands.
</p>

<p align="center">  
If you like the idea of bar theme click ⭐ on the repo and <a href="https://twitter.com/intent/tweet?text=Nice%20xontrib%20for%20the%20xonsh%20shell!&url=https://github.com/anki-code/xonsh-awesome-cli-app" target="_blank">tweet</a>.
</p>


## Features

* Based on power and sugar from [click](https://click.palletsprojects.com).
* Pip-installable as well as clone-and-run.
* Ability to grow your library.
* Ability to set up context and environment.
* Ability to set up context options and command arguments.
* Ability to use environment variables as replacement of options and arguments.
* Logging included.

## Usage

You can use this app as a template to your own apps.

```xsh
git clone https://github.com/anki-code/xonsh-awesome-cli-app
cd xonsh-awesome-cli-app
chmod +x myapp

./mycli
# Usage: mycli [OPTIONS] COMMAND [ARGS]...
# 
#   CLI management.
# 
# Options:
#   --name TEXT  Context option: name.
#   --debug      Context option: debug mode.
#   --help       Show this message and exit.
# 
# Commands:
#   hello    Say hello.
#   context  Show app context.

./mycli hello --help
# Usage: mycli hello [OPTIONS]
# 
#   Say hello.
# 
# Options:
#   --wait  Command argument: wait before print.
#   --help  Show this message and exit.

./mycli hello
# Hello Username

./mycli hello --wait
# Wait...
# Hello Username

./mycli --name Mike hello --wait
# Wait...
# Hello Mike

$MYCLI_NAME = 'Alex'
./mycli hello
# Hello Alex

./mycli context
# Environment:
# {'MYAPP_NAME': 'Alex'}
# Context:
# {'debug': False, 'log': <RootLogger root (INFO)>, 'name': 'Alex'}

./mycli --debug hello
# TRACE SUBPROC: (['echo', 'Hello', 'DefaultName'],)
# Hello DefaultName
# TRACE SUBPROC: (['echo', 'Here', 'is', 'debug', 'message', 'too', ''],)
# Here is debug message too
```

## See also
* [xonsh-cheatsheet](https://github.com/anki-code/xonsh-cheatsheet) - Cheat sheet for xonsh shell with copy-pastable examples. 
* [rc-awesome](https://github.com/anki-code/xontrib-rc-awesome) - Awesome snippets of code for xonshrc in xonsh shell.
* [macro](https://github.com/anki-code/xontrib-macro) - Library of the useful macro for the xonsh shell.
* [docker-xonsh-wrapper](https://github.com/anki-code/docker-xonsh-wrapper) - Wrap an app in docker container and catch the signals from docker using xonsh shell. 
* [xunter](https://github.com/anki-code/xunter) - Profiling the xonsh shell code using [hunter](https://github.com/ionelmc/python-hunter).
* [click: Shared options and flags between commands](https://stackoverflow.com/questions/40182157/shared-options-and-flags-between-commands)
