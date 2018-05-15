#!/bin/bash

# by Andre Ruiz <andre.ruiz@gmail.com> 2018
# You may redistribute and do whatever you want, just give credits.

# DANGER WILL ROBINSON
# this is a hack. you have been warned. don't complain about programming best practices
# please, fix it instead. thanks.

host="tp002.lab.token:80"
apikey="EEBD3CFD8BBC4525B01401B0067A57B1"

api_call() {
	local "$@"
	url="http://${host}/api"
	curlcmd="curl -o - -H 'X-Api-Key: ${apikey}'"
	[ -n "$json" ] && \
		curlcmd="$curlcmd -X POST -d '$json' -H 'Content-Type: application/json'"
	curlcmd="$curlcmd '$url/$resource'"
	#echo -en "\n>>> COMMAND LINE: $curlcmd\n\n"
	eval $curlcmd
}

case "$1" in
	"--connection")
		api_call \
			resource="connection"
		;;
	"--move-x")
		api_call \
			resource="printer/printhead" \
			json='{ "command": "jog", "x": '$2' }'
		;;
	"--move-y")
		api_call \
			resource="printer/printhead" \
			json='{ "command": "jog", "y": '$2' }'
		;;
	"--move-z")
		api_call \
			resource="printer/printhead" \
			json='{ "command": "jog", "z": '$2' }'
		;;
	"--home")
		api_call \
			resource="printer/printhead" \
			json='{ "command": "home", "axes": [ "x", "y", "z" ] }'
		;;
	"--extrude")
		amount=$2
		api_call \
			resource="printer/tool" \
			json='{ "command": "extrude", "amount": '$amount' }'
		;;
	"--get-hotend-temp")
		api_call \
			resource="printer/tool" \
		;;
	"--set-hotend-temp")
		api_call \
			resource="printer/tool" \
			json='{ "command": "target", "targets": { "tool0": '$2' } }'
		;;
	"--get-bed-temp")
		api_call \
			resource="printer/bed" \
		;;
	"--set-bed-temp")
		api_call \
			resource="printer/bed" \
			json='{ "command": "target", "target": '$2' }'
		;;
	"--command")
		api_call \
			resource="printer/command" \
			json='{ "command": "'"$2"'" }'
		;;
	*)
		echo "ERROR: invalid option."
esac

