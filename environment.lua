always_load("singularity/3.5.3")

local sif_hash = '995e52f7cf976eaefe2a3ac830c8b5f5116371027da62d0378a1c9b648eb02b0'
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

