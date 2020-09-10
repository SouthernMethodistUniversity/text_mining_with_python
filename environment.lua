always_load("singularity/3.5.3")

local sif_hash = '4a7c5cba7279d5611da1ac2846df09b4c211e6278ffbb310499b0d215f4fac3d'
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

build_command('python3', sif_file)
build_command('jupyter', sif_file)

