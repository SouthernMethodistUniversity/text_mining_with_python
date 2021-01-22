always_load("singularity/3.5.3")

function build_command(app)
  local container = 'docker://smuresearch/text_mining_with_python:latest '
  local cmd       = 'singularity exec --writable-tmpfs -B /scratch,/work,/run/user '
  local sh_cmd    = cmd .. container .. app .. ' "$@"'
  local csh_cmd   = cmd .. container .. app .. ' $*'
  set_shell_function(app , sh_cmd, csh_cmd)
end

setenv("TMPDIR", "/dev/shm")
local memory = os.getenv("SLURM_MEM_PER_NODE") or capture("awk '/MemTotal/{print $2}' /proc/meminfo") / 1024^2
setenv("SINGULARITYENV_MEM_LIMIT", memory * 1024^2)

build_command('python3')
build_command('ipython3')
build_command('jupyter')

