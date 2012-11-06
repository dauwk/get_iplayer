#!/usr/bin/rexx
fn="rtmpdump.log"

parse arg line rest
newcommand = "/usr/local/bin/rtmpdump-2.4" line rest
say "Command is" newcommand
rc=lineout(fn,newcommand)
newcommand