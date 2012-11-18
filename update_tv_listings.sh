#!/bin/sh

tv_grab_na_dd --days 14 | tv_sort > $HOME/.xmltv/listings.xml
