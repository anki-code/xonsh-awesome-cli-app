#!/usr/bin/env xonsh

"""

xonsh-awesome-cli-app

"""

import os
import click
import logging
import pprint
from pathlib import Path
from .lib.click import OrderCommands


# Set the prefix for environment variables. The app file name by default e.g. `./mycli` will be `MYCLI`.
# Usage: set `click.option(envvar)` and instead of passing `--name qwe` you can set `$MYCLI_NAME='qwe'`.
_PFX = ''.join(e for e in Path(__file__).stem.upper() if e.isalnum())


class CliCtx:
    """Class to prepare and store CLI context."""
    def __init__(self, name, debug):
        self.name = name
        self.debug = debug in [True, 'True', '1', 1]

        # Logging
        self.log = logging.getLogger()
        self.log.setLevel(logging.INFO)

        ch = logging.StreamHandler()
        log_format = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        ch.setFormatter(log_format)
        self.log.addHandler(ch)

        ## Setup logging in debug mode.
        # if self.debug:
        #    for logger in ['boto', 'botocore', 'urllib3']:
        #        logging.getLogger(logger).setLevel(logging.CRITICAL)


@click.group(cls=OrderCommands)
@click.option("--name", envvar=f'{_PFX}_NAME', default='Username', help="Context option: name.")
@click.option("--debug", default=False, is_flag=True, envvar=f'{_PFX}_DEBUG', help="Context option: debug mode.")
@click.pass_context
def cli(ctx, name, debug):
    """Xonsh CLI app."""

    # Setting context object.
    ctx.obj = CliCtx(name, debug)

    # Setting up the environment variables.
    $RAISE_SUBPROC_ERROR = True
    if debug:
        $XONSH_TRACE_SUBPROC = True
        $XONSH_SHOW_TRACEBACK = True


@cli.command()
@click.argument('text')
@click.option("--wait", default=False, is_flag=True, help="Command argument: wait before print.")
@click.pass_obj
def say(ctx, text, wait):
    """Say."""

    if wait:
        echo Wait...
        sleep 3

    echo @(ctx.name) say: @(text)

    # Use context.
    if ctx.debug:
        ctx.log.info('Additional log message.')
        echo Here is debug message too!


@cli.command()
@click.pass_obj
def context(ctx):
    """
    Show app context.
    """
    print('Environment:')
    pprint.pprint({k:v for k,v in os.environ.items() if k.startswith(_PFX+'_')})

    print('Context:')
    pprint.pprint(vars(ctx))


if __name__ == "__main__":
    cli()

