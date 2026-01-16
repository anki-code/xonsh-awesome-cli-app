# $XONSH_TRACE_SUBPROC = True
$XONSH_SHOW_TRACEBACK = True

docker = ['sudo', 'docker'] if not !(docker ps) else ['docker']
container_name = 'local/test_xonsh_awesome_cli_app'
curr_dir = @.imp.pathlib.Path(__file__).parent.resolve()
source_dir = curr_dir.parent

$RAISE_SUBPROC_ERROR = True

printx(f"Test config:\n  {docker=:}\n  {container_name=:}\n  {curr_dir=:}\n  {source_dir=:}", 'YELLOW')

printx(f'Build container: {container_name}', 'YELLOW')
@(docker) build -t @(container_name) @(curr_dir)

printx(f'Test install package', 'YELLOW')
with! @.imp.xonsh.contexts.Block() as b:
    cd /project
    pip install --break-system-packages .
    mycli --help

commands = b.macro_block
    
r = ![@(docker) run -it --rm -v $PWD:/project @(container_name) bash -c @(commands)]
assert r.rtn == 0

printx('DONE', 'GREEN')



