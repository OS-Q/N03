
if [ -n "${ZSH_VERSION:-}" ]; then
	dir="${(%):-%N}"
	if [ $options[posixargzero] != "on" ]; then
		setopt posixargzero
		name=$(basename -- "$0")
		unsetopt posixargzero
	else
		name=$(basename -- "$0")
	fi
else
	dir="${BASH_SOURCE[0]}"
	name=$(basename -- "$0")
fi

if [ "X$name" "==" "Xzephyr-env.sh" ]; then
    echo "Source this file (do NOT execute it!) to set the Zephyr Kernel environment."
    exit
fi

# You can further customize your environment by creating a bash script called
# .zephyrrc in your home directory. It will be automatically
# run (if it exists) by this script.

if uname | grep -q "MINGW"; then
    win_build=1
    pwd_opt="-W"
else
    win_build=0
    pwd_opt=""
fi

# identify OS source tree root directory
export ZEPHYR_BASE=$( builtin cd "$( dirname "$dir" )" > /dev/null && pwd ${pwd_opt})
unset pwd_opt

scripts_path=${ZEPHYR_BASE}/scripts
if [ "$win_build" -eq 1 ]; then
    scripts_path=$(echo "/$scripts_path" | sed 's/\\/\//g' | sed 's/://')
fi
unset win_build
if ! echo "${PATH}" | grep -q "${scripts_path}"; then
    export PATH=${scripts_path}:${PATH}
fi
unset scripts_path

# enable custom environment settings
zephyr_answer_file=~/zephyr-env_install.bash
[ -f ${zephyr_answer_file} ] && {
	echo "Warning: Please rename ~/zephyr-env_install.bash to ~/.zephyrrc"
	. ${zephyr_answer_file}
}
unset zephyr_answer_file
zephyr_answer_file=~/.zephyrrc
[ -f ${zephyr_answer_file} ] &&  . ${zephyr_answer_file}
unset zephyr_answer_file
