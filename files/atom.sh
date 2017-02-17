# Configure atom to run from the command line with --disable-gpu
if [[ -v PS1 ]]; then
  run_atom() {
    /usr/bin/atom $@ --disable-gpu
  }

  alias atom=run_atom "$@"
fi
