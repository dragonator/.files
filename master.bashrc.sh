# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/misc.bashrc.sh
source $DIR/aliases.bashrc.sh
source $DIR/git.bashrc.sh
source $DIR/ruby.bashrc.sh
source $DIR/go.bashrc.sh
source $DIR/python.bashrc.sh

source <(jump shell bash)
source <(kubectl completion bash)
sanitize_path
