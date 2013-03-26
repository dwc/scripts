#!/bin/bash

source $HOME/.bash_profile

INPUT_FILE=$HOME/.xmltv/listings.xml
OUTPUT_FILE=$HOME/.xmltv/TV.ics
USER=danieltwc
HOST=files.danieltwc.com
DIRECTORY=files.danieltwc.com/

tv_grep \
	--or --title "^Boardwalk\s+Empire$" \
		--and --channel "I10240\.labs\.zap2it\.com" \
	--or --title "^Bored\s+to\s+Death$" \
	--or --title "^Breaking\s+Bad$" \
	--or --title "^Dexter$" \
		--and --channel "I11117\.labs\.zap2it\.com" \
	--or --title "^How\s+I\s+Met\s+Your\s+Mother$" \
		--and --channel "I10520\.labs\.zap2it\.com" \
	--or --title "^Lie\s+to\s+Me$" \
		--and --channel "I10387\.labs\.zap2it\.com" \
	--or --title "^Louie$" \
		--and --not --channel "I14753\.labs\.zap2it\.com" \
	--or --title "^Mad\s+Men$" \
	--or --title "^Parks\s+and\s+Recreation$" \
		--and --channel "I10518\.labs\.zap2it\.com" \
	--or --title "^The\s+Walking\s+Dead$" \
		--and --not --channel "I59337\.labs\.zap2it\.com" \
	--or --title "^Top\s+Chef" \
		--and --not --channel "I31555\.labs\.zap2it\.com" \
	--or --title "^Top\s+Gear" \
		--and --not --channel "I18332\.labs\.zap2it\.com" \
$INPUT_FILE | $HOME/bin/tv_to_ical --no-old > $OUTPUT_FILE

scp $OUTPUT_FILE $USER@$HOST:$DIRECTORY
