always_load("singularity/3.5.3")

local sif_hash = '0c2aab9fd6547957f880eaee8ff1f56fcc315dd406fad1ae3a28fc944ab6cd1b'
local sif_file = '/hpc/applications/singularity_containers/text_mining_with_python_sha256.' .. sif_hash .. '.sif'

function build_command(app, sif)
  local cmd        = 'singularity exec -B /scratch -B ${RSTUDIO_TMPDIR:-$(pwd)}:/tmp ' .. sif .. ' ' .. app
  local sh_ending  = ' "$@"'
  local csh_ending = ' $*'
  local sh_cmd     = cmd .. sh_ending
  local csh_cmd    = cmd .. csh_ending
  set_shell_function(app , sh_cmd, csh_cmd)
end

setenv("TMPDIR", "/dev/shm")

build_command('python3', sif_file)
build_command('jupyter', sif_file)
build_command('R', sif_file)
build_command('RScript', sif_file)
build_command('rserver', sif_file)
build_command('rsession', sif_file)

