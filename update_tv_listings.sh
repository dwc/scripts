#!/bin/sh

FILENAME="${HOME}/.xmltv/listings.xml"

tv_grab_na_dd --days 14 > "${FILENAME}.tmp" && tv_sort < "${FILENAME}.tmp" > "${FILENAME}"
