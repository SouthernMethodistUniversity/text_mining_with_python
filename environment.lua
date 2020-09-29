always_load("singularity/3.5.3")

local sif_hash = '40b88131afd6462720fd48b4475f62783a46f1a8c69dc8376eb2f593be5c00f4'
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

