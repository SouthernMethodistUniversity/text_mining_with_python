always_load("singularity/3.5.3")

local sif_hash = '8db0437ec0108b1b59be6416bcf632948c51169f091e48a4cf4cebc896bbb50a'
local sif_file = '/hpc/applications/singularity_containers/text_mining_with_python_sha256.' .. sif_hash .. '.sif'

function build_command(app, sif)
  local cmd        = 'singularity exec -B /scratch ' .. sif .. ' ' .. app
  local sh_ending  = ' "$@"'
  local csh_ending = ' $*'
  local sh_cmd     = cmd .. sh_ending
  local csh_cmd    = cmd .. csh_ending
  set_shell_function(app , sh_cmd, csh_cmd)
end

setenv("TMPDIR", "/dev/shm")
local memory = os.getenv("SLURM_MEM_PER_NODE") or capture("awk '/MemTotal/{print $2}' /proc/meminfo") / 1024^2
setenv("SINGULARITYENV_MEM_LIMIT", memory * 1024^2)

build_command('python3', sif_file)
build_command('jupyter', sif_file)

