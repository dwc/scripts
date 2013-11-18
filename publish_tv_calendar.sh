#!/bin/bash

source $HOME/.bash_profile

INPUT_FILE=$HOME/.xmltv/listings.xml
OUTPUT_FILE=$HOME/.xmltv/TV.ics
USER=danieltwc
HOST=files.danieltwc.com
DIRECTORY=files.danieltwc.com/

tv_grep \
	--title "^Boardwalk\s+Empire$" \
		--and --channel "I10240\.labs\.zap2it\.com" \
	--or --title "^Bored\s+to\s+Death$" \
	--or --title "^Continuum$" \
		--and --not --channel "I65626\.labs\.zap2it\.com" \
	--or --title "^How\s+I\s+Met\s+Your\s+Mother$" \
		--and --channel "I10520\.labs\.zap2it\.com" \
	--or --title "^Lie\s+to\s+Me$" \
		--and --channel "I10387\.labs\.zap2it\.com" \
	--or --title "^Louie$" \
		--and --not --channel "I14753\.labs\.zap2it\.com" \
	--or --title "^Mad\s+Men$" \
		--and --not --channel "I31556\.labs\.zap2it\.com" \
	--or --title "^Parks\s+and\s+Recreation$" \
		--and --channel "I10518\.labs\.zap2it\.com" \
	--or --title "^The\s+Blacklist$" \
		--and --not --channel "I19630\.labs\.zap2it\.com" \
	--or --title "^The\s+Layover\s+With\s+Anthony\s+Bourdain$" \
	--or --title "^The\s+Walking\s+Dead$" \
		--and --not --channel "I59337\.labs\.zap2it\.com" \
	--or --title "^Top\s+Chef" \
		--and --not --channel "I31555\.labs\.zap2it\.com" \
$INPUT_FILE | $HOME/bin/tv_to_ical --no-old > $OUTPUT_FILE

scp $OUTPUT_FILE $USER@$HOST:$DIRECTORY
