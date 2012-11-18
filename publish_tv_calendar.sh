#!/bin/sh

source $HOME/.bash_profile

INPUT_FILE=$HOME/.xmltv/listings.xml
OUTPUT_FILE=$HOME/.xmltv/TV.ics
USER=danieltwc
HOST=files.danieltwc.com
DIRECTORY=files.danieltwc.com/

tv_grep \
	--title "^30 Rock$" \
		--and --not --channel "I21647\.labs\.zap2it\.com" \
		--and --not --channel "I33992\.labs\.zap2it\.com" \
		--and --not --channel "I62476\.labs\.zap2it\.com" \
	--or --title "^Boardwalk\s+Empire$" \
		--and --channel "I10240\.labs\.zap2it\.com" \
	--or --title "^Bored\s+to\s+Death$" \
		--and --channel "I10240\.labs\.zap2it\.com" \
	--or --title "^Bones$" \
		--and --channel "I11752\.labs\.zap2it\.com" \
	--or --title "^Californication$" \
		--and --not --channel "I21868\.labs\.zap2it\.com" \
	--or --title "^Dexter$" \
		--and --not --channel "I21868\.labs\.zap2it\.com" \
	--or --title "^Fringe$" \
		--and --not --channel "I32622\.labs\.zap2it\.com" \
	--or --title "^House$" \
		--and --not --channel "I32622\.labs\.zap2it\.com" \
	--or --title "^Lie\s+to\s+Me$" \
		--and --not --channel "I32622\.labs\.zap2it\.com" \
	--or --title "^Louie$" \
		--and --channel "I14321\.labs\.zap2it\.com" \
	--or --title "^Mad\s+Men$" \
		--and --not --channel "I59337\.labs\.zap2it\.com" \
	--or --title "^NHL\s+Hockey$" \
		--and --not --channel "I21647\.labs\.zap2it\.com" \
		--and --not --channel "I26197\.labs\.zap2it\.com" \
		--and --not --channel "I26198\.labs\.zap2it\.com" \
		--and --not --channel "I26199\.labs\.zap2it\.com" \
		--and --not --channel "I26200\.labs\.zap2it\.com" \
		--and --not --channel "I26201\.labs\.zap2it\.com" \
		--and --not --channel "I26202\.labs\.zap2it\.com" \
		--and --not --channel "I26203\.labs\.zap2it\.com" \
		--and --not --channel "I26204\.labs\.zap2it\.com" \
		--and --not --channel "I29093\.labs\.zap2it\.com" \
		--and --not --channel "I31250\.labs\.zap2it\.com" \
		--and --not --channel "I43763\.labs\.zap2it\.com" \
		--and --not --channel "I48639\.labs\.zap2it\.com" \
		--and --not --channel "I50234\.labs\.zap2it\.com" \
		--and --not --channel "I53701\.labs\.zap2it\.com" \
		--and --not --channel "I53704\.labs\.zap2it\.com" \
		--and --not --channel "I53705\.labs\.zap2it\.com" \
		--and --not --channel "I53708\.labs\.zap2it\.com" \
		--and --not --channel "I54212\.labs\.zap2it\.com" \
		--and --not --channel "I58570\.labs\.zap2it\.com" \
		--and --not --channel "I54994\.labs\.zap2it\.com" \
	--or --title "^The\s+Increasingly\s+Poor\s+Decisions\s+of\s+Todd\s+Margaret$" \
	--or --title "^The\s+Walking\s+Dead$" \
		--and --not --channel "I59337\.labs\.zap2it\.com" \
	--or --title "^Top\s+Chef$" \
		--and --not --channel "I58625\.labs\.zap2it\.com" \
	--or --title "^Weeds$" \
		--and --not --channel "I21868\.labs\.zap2it\.com" \
$INPUT_FILE | $HOME/bin/tv_to_ical --no-old > $OUTPUT_FILE

scp $OUTPUT_FILE $USER@$HOST:$DIRECTORY
