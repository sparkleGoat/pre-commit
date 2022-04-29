#!/usr/bin/env bash

set -e
export PATH=$PATH:/usr/local/bin

exit_status=0
enable_list=""

parse_arguments() {
	while (($# > 0)); do
		# Grab param and value splitting on " " or "=" with parameter expansion
		local PARAMETER="${1%[ =]*}"
		local VALUE="${1#*[ =]}"
		if [[ "$PARAMETER" == "$VALUE" ]]; then VALUE="$2"; fi
		shift
			enable_list="$enable_list $VALUE"

	done
	enable_list="${enable_list## }" # remove preceeding space
}

parse_arguments "$@"


if which helm &> /dev/null $? != 0 ; then
    echo "HELM must be installed"
    exit 1
fi

helm unittest ${enable_list:+ --enable="$enable_list"}

exit $exit_status
