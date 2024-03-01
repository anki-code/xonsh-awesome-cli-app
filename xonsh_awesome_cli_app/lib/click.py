import click

class OrderCommands(click.Group):
    """Class to show `click` commands in declaration order."""
    def list_commands(self, ctx: click.Context) -> list[str]:
        return list(self.commands)
