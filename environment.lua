always_load("singularity/3.5.3")

local sif_hash = '850582113e30ea2701d4c85b3bb441de861d8a4960cf9c11cdccc332eba63546'
local sif_file = '/hpc/applications/singularity_containers/text_mining_with_python_sha256.' .. sif_hash .. '.sif'

function build_command(app)
  local cmd        = 'singularity exec --writable-tmpfs -B /scratch,/work ' .. sif_file .. ' ' .. app
  local sh_cmd     = cmd .. ' "$@"'
  local csh_cmd    = cmd .. ' $*'
  set_shell_function(app , sh_cmd, csh_cmd)
end

setenv("TMPDIR", "/dev/shm")
local memory = os.getenv("SLURM_MEM_PER_NODE") or capture("awk '/MemTotal/{print $2}' /proc/meminfo") / 1024^2
setenv("SINGULARITYENV_MEM_LIMIT", memory * 1024^2)

build_command('python3')
build_command('jupyter')

