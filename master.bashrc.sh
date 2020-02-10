# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/misc.bashrc.sh
source $DIR/git.bashrc.sh
source $DIR/ruby.bashrc.sh
source $DIR/go.bashrc.sh
source $DIR/python.bashrc.sh

sanitize_path
