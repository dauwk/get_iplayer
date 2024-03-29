/* Rexx */
trace o
say getproxy()



parse arg show .
if show="" then show="news"

x = './get_iplayer.pl --force '
/*
 --subdir, -s                     Put Recorded files into Programme name subdirectory
 --subdir-format <format>         The format to be used for the subdirectory naming using formatting fields. e.g. '<nameshort>-<seriesnum>'
*/
x = x || ' --verbose '
/* x = x || ' --showopts ' */
x = x || ' --subdir '
x = x || ' --subdir-format="<nameshort><seriesnum>"'
x = x || ' --type=itv '
x = x || ' --output="/Users/john/tv" '
x = x || ' --subtitles '
x = x || ' --proxy="http://' || line ||'"'  
x = x || ' --modes=best '
x = x || ' --flvstreamer="/Users/john/get_iplayer/flvstreamer" '
x = x || '"' || show || '"'
x = x || ' --get '

x 
exit 

getproxy:  /* Get the proxy from Get iP Automator */
'wget http://tom-tech.com/get_iplayer/proxy.txt'
fn="proxy.txt"
do while lines(fn)
	line = linein(fn)
	say line
end
return line


/* 
./get_iplayer --longhelp
get_iplayer v2.82, Copyright (C) 2008-2010 Phil Lewis
  This program comes with ABSOLUTELY NO WARRANTY; for details use --warranty.
  This is free software, and you are welcome to redistribute it under certain
  conditions; use --conditions for details.

Usage ( Also see http://linuxcentre.net/getiplayer/documentation ):
 List All Programmes:            get_iplayer [--type=<TYPE>]
 Search Programmes:              get_iplayer <REGEX>
 Record Programmes by Search:    get_iplayer <REGEX> --get
 Record Programmes by Index:     get_iplayer <INDEX> --get
 Record Programmes by URL:       get_iplayer [--type=<TYPE>] "<URL>"
 Record Programmes by PID:       get_iplayer [--type=<TYPE>] --pid=<PID>
 Stream Programme to Player:     get_iplayer --stream <INDEX> | mplayer -cache 3072 -
 Stream BBC Embedded Media URL:  get_iplayer --stream --type=<TYPE> "<URL>" | mplayer -cache 128 -
 Stream Live iPlayer Programme:  get_iplayer --stream --type=livetv,liveradio <REGEX|INDEX> --player="mplayer -cache 128 -"

 Update get_iplayer cache:       get_iplayer --refresh [--force]

 Basic Help:                     get_iplayer --basic-help

Search Options:
 --before                         Limit search to programmes added to the cache before N hours ago
 --category <string>              Narrow search to matched categories (regex or comma separated values)
 --channel <string>               Narrow search to matched channel(s) (regex or comma separated values)
 --exclude <string>               Narrow search to exclude matched programme names (regex or comma separated values)
 --exclude-category <string>      Narrow search to exclude matched categories (regex or comma separated values)
 --exclude-channel <string>       Narrow search to exclude matched channel(s) (regex or comma separated values)
 --fields <field1>,<field2>,..    Searches only in the specified comma separated fields
 --future                         Search future programme schedule if it has been indexed (refresh cache with: --refresh --refresh-future).
 --history                        Search/show recordings history
 --long, -l                       Additionally search in programme descriptions and episode names (same as --fields=name,episode,desc )
 --search <search term>           GetOpt compliant way of specifying search args
 --since                          Limit search to programmes added to the cache in the last N hours
 --type <type>                    Only search in these types of programmes: livetv,tv,liveradio,radio,all (tv is default)
 --versions <versions>            Version of programme to search or record.  List is processed from left to right and first version found is downloaded.  Example: '--versions signed,audiodescribed,default' will prefer signed and audiodescribed programmes if available.  Default: 'default'

Display Options:
 --conditions                     Shows GPLv3 conditions
 --debug                          Debug output
 --dump-options                   Dumps all options with their internal option key names
 --help, -h                       Intermediate help text
 --helpbasic, --usage             Basic help text
 --helplong                       Advanced help text
 --hide                           Hide previously recorded programmes
 --info, -i                       Show full programme metadata and availability of modes and subtitles (max 50 matches)
 --list <categories|channel>      Show a list of available categories/channels for the selected type and exit
 --listformat <format>            Display programme data based on a user-defined format string (such as <pid>, <name> etc)
 --listplugins                    Display a list of currently available plugins or programme types
 --long, -l                       Show long programme info
 --manpage <file>                 Create man page based on current help text
 --nocopyright                    Don't display copyright header
 --page <number>                  Page number to display for multipage output
 --pagesize <number>              Number of matches displayed on a page for multipage output
 --quiet, -q                      No logging output
 --series                         Display Programme series names only with number of episodes
 --show-cache-age                 Displays the age of the selected programme caches then exit
 --show-options                   Shows options which are set and where they are defined
 --sort <fieldname>               Field to use to sort displayed matches
 --sortreverse                    Reverse order of sorted matches
 --streaminfo                     Returns all of the media stream urls of the programme(s)
 --terse                          Only show terse programme info (does not affect searching)
 --tree                           Display Programme listings in a tree view
 --verbose, -v                    Verbose
 --warranty                       Displays warranty section of GPLv3
 -V                               Show get_iplayer version and exit.

Recording Options:
 --aactomp3                       Transcode AAC audio to MP3 with ffmpeg (CBR 128k unless --mp3vbr is specified)
 --attempts <number>              Number of attempts to make or resume a failed connection
 --bandwidth                      In radio realaudio mode specify the link bandwidth in bps for rtsp streaming (default 512000)
 --force                          Ignore programme history (unsets --hide option also). Forces a script update if used with -u
 --get, -g                        Start recording matching programmes. Search terms required unless --pid specified. Use  --search=.* to force download of all available programmes.
 --hash                           Show recording progress as hashes
 --itvnothread                    Disable parallel threaded recording for itv
 --liveradiomode <mode>,<mode>,.. Live Radio Recording modes: flashaac,realaudio,wma. Use --liveradiomode=best to automatically select highest quality available.
 --livetvmode <mode>,<mode>,...   Live TV Recoding modes: flashhd,flashvhigh,flashhigh,flashstd,flashnormal (default: flashhd,flashvhigh,flashhigh,flashstd,flashnormal). Use --livetvmode=best to automatically select highest quality available.
 --metadata-only                  Create specified metadata info file without any recording or streaming (can also be used with thumbnail option).
 --mmsnothread                    Disable parallel threaded recording for mms
 --modes <mode>,<mode>,...        Recording modes: flashhd,flashvhigh,flashhigh,flashstd,flashnormal,flashlow,n95_wifi,flashaac,flashaachigh,flashaacstd,flashaaclow,flashaudio,realaudio,wma.  Use --modes=best to automatically select highest quality available.
 --mp3vbr                         Set LAME VBR mode to N (0 to 9) for AAC transcoding. 0 = target bitrate 245 Kbit/s, 9 = target bitrate 65 Kbit/s (requires --aactomp3)
 --multimode                      Allow the recording of more than one mode for the same programme - WARNING: will record all specified/default modes!!
 --overwrite                      Overwrite recordings if they already exist
 --partial-proxy                  Only uses web proxy where absolutely required (try this extra option if your proxy fails)
 --pid <pid>                      Record an arbitrary pid that does not necessarily appear in the index.
 --pid-recursive                  When used with --pid record all the embedded pids if the pid is a series or brand pid.
 --proxy, -p <url>                Web proxy URL e.g. 'http://USERNAME:PASSWORD@SERVER:PORT' or 'http://SERVER:PORT'
 --radiomode <mode>,<mode>,...    Radio Recording mode(s): flashaac,flashaachigh,flashaacstd,flashaaclow,flashaudio,realaudio,wma (default: flashaachigh,flashaacstd,flashaudio,realaudio,flashaaclow). Use --radiomode=best to automatically select highest quality available.
 --raw                            Don't transcode or change the recording/stream in any way (i.e. radio/realaudio, rtmp/flv)
 --rtmp-ch4-opts <options>        Add custom options to rtmpdump for ch4
 --rtmp-liveradio-opts <options>  Add custom options to flvstreamer for liveradio
 --rtmp-livetv-opts <options>     Add custom options to flvstreamer for livetv
 --rtmp-radio-opts <options>      Add custom options to flvstreamer for radio
 --rtmp-tv-opts <options>         Add custom options to flvstreamer for tv
 --rtmpport <port>                Override the RTMP port (e.g. 443)
 --start <secs>                   Recording/streaming start offset (rtmp and realaudio only)
 --stop <secs>                    Recording/streaming stop offset (can be used to limit live rtmp recording length) rtmp and realaudio only
 --suboffset <offset>             Offset the subtitle timestamps by the specified number of milliseconds
 --subsraw                        Additionally save the raw subtitles file
 --subtitles                      Download subtitles into srt/SubRip format if available and supported
 --subtitles-only                 Only download the subtitles, not the programme
 --tag-only                       Only update the programme tag and not download the programme (can also be used with --history)
 --test, -t                       Test only - no recording (will show programme type)
 --thumb                          Download Thumbnail image if available
 --thumbnail-only                 Only Download Thumbnail image if available, not the programme
 --tvmode <mode>,<mode>,...       TV Recoding modes: rtmp,flashhd,flashvhigh,flashhigh,flashstd,flashnormal,flashlow,n95_wifi (default: flashhigh,flashstd,flashnormal). Use --tvmode=best to automatically select highest quality available.
 --url "<url>"                    Record the embedded media player in the specified URL. Use with --type=<type>.
 --wav                            In radio realaudio mode output as wav and don't transcode to mp3

Output Options:
 --command, -c <command>          Run user command after successful recording using args such as <pid>, <name> etc
 --email <address>                Email HTML index of matching programmes to specified address
 --email-sender <address>         Optional email sender address
 --email-smtp <hostname>          SMTP server IP address to use to send email (default: localhost)
 --fatfilename                    Omit characters forbidden by FAT filesystems from filenames but keep whitespace
 --file-prefix <format>           The filename prefix (excluding dir and extension) using formatting fields. e.g. '<name>-<episode>-<pid>'
 --fxd <file>                     Create Freevo FXD XML of matching programmes in specified file
 --html <file>                    Create basic HTML index of matching programmes in specified file
 --isodate                        Use ISO8601 dates (YYYY-MM-DD) in filenames
 --metadata <type>                Create metadata info file after recording. Valid types are: xbmc, xbmc_movie, freevo, generic
 --mkv                            Output video in MKV container instead of MP4. Currently no tagging supported from get_iplayer for MKV output
 --mythtv <file>                  Create Mythtv streams XML of matching programmes in specified file
 --nowrite, -n                    No writing of file to disk (use with -x to prevent a copy being stored on disk)
 --output, -o <dir>               Recording output directory
 --outputch4 <dir>                Output directory for ch4 recordings
 --outputitv <dir>                Output directory for itv recordings
 --outputliveradio <dir>          Output directory for live radio recordings
 --outputlivetv <dir>             Output directory for live tv recordings
 --outputlocalfiles <dir>         Output directory for localfiles recordings
 --outputpodcast <dir>            Output directory for podcast recordings
 --outputradio <dir>              Output directory for radio recordings
 --outputtv <dir>                 Output directory for tv recordings
 --player '<command> <options>'   Use specified command to directly play the stream
 --stdout, -x                     Additionally stream to STDOUT (so you can pipe output to a player)
 --stream                         Stream to STDOUT (so you can pipe output to a player)
 --subdir, -s                     Put Recorded files into Programme name subdirectory
 --subdir-format <format>         The format to be used for the subdirectory naming using formatting fields. e.g. '<nameshort>-<seriesnum>'
 --symlink <file>                 Create symlink to <file> once we have the header of the recording
 --thumb-ext <ext>                Thumbnail filename extension to use
 --thumbsize <index|width>        Default thumbnail size/index to use for the current recording and metadata (see --info for thumbnailN: to get size/index)
 --thumbsizecache <index|width>   Default thumbnail size/index to use when building cache and index (see --info for thumbnailN: to get size/index)
 --whitespace, -w                 Keep whitespace (and escape chars) in filenames
 --xml-alpha                      Create freevo/Mythtv menu sorted alphabetically by programme name
 --xml-channels                   Create freevo/Mythtv menu of channels -> programme names -> episodes
 --xml-names                      Create freevo/Mythtv menu of programme names -> episodes

PVR Options:
 --comment <string>               Adds a comment to a PVR search
 --pvr [pvr search name]          Runs the PVR using all saved PVR searches (intended to be run every hour from cron etc). The list can be limited by adding a regex to the command. Synonyms: --pvrrun, --pvr-run
 --pvr-add <search name>          Save the named PVR search with the specified search terms.  Search terms required. Use --search=.* to force download of all available programmes. Synonyms: --pvradd
 --pvr-del <search name>          Remove the named search from the PVR searches. Synonyms: --pvrdel
 --pvr-disable <search name>      Disable (not delete) a named PVR search. Synonyms: --pvrdisable
 --pvr-enable <search name>       Enable a previously disabled named PVR search. Synonyms: --pvrenable
 --pvr-exclude <string>           Exclude the PVR searches to run by search name (regex or comma separated values). Synonyms: --pvrexclude
 --pvr-list                       Show the PVR search list. Synonyms: --pvrlist
 --pvr-queue                      Add currently matched programmes to queue for later one-off recording using the --pvr option. Search terms required unless --pid specified. Use --search=.* to force download of all available programmes. Synonyms: --pvrqueue
 --pvr-scheduler <seconds>        Runs the PVR using all saved PVR searches every <seconds>. Synonyms: --pvrscheduler
 --pvr-single <search name>       Runs a named PVR search. Synonyms: --pvrsingle

Config Options:
 --expiry, -e <secs>              Cache expiry in seconds (default 4hrs)
 --limit-matches <number>         Limits the number of matching results for any search (and for every PVR search)
 --localfilesdirs <dir>[,dir,]    Directories/Folders to scan for new files
 --nopurge                        Don't ask to delete programmes recorded over 30 days ago
 --packagemanager <string>        Tell the updater that we were installed using a package manager and don't update (use either: apt,rpm,deb,yum,disable)
 --plugins-update                 Update get_iplayer plugins to the latest
 --prefs-add                      Add/Change specified saved user or preset options
 --prefs-clear                    Remove *ALL* saved user or preset options
 --prefs-del                      Remove specified saved user or preset options
 --prefs-show                     Show saved user or preset options
 --preset, -z <name>              Use specified user options preset
 --preset-list                    Show all valid presets
 --profile-dir <dir>              Override the user profile directory/folder
 --refresh, --flush, -f           Refresh cache
 --refresh-exclude <string>       Exclude matched channel(s) when refreshing cache (regex or comma separated values)
 --refresh-future                 Obtain future programme schedule when refreshing cache (between 7-14 days)
 --refresh-include <string>       Include matched channel(s) when refreshing cache (regex or comma separated values)
 --skipdeleted                    Skip the download of metadata/thumbs/subs if the media file no longer exists. Use with --history & --metadataonly/subsonly/thumbonly.
 --update, -u                     Update get_iplayer if a newer one exists
 --webrequest <urlencoded string> Specify all options as a urlencoded string of "name=val&name=val&..."

External Program Options:
 --atomicparsley <path>           Location of AtomicParsley tagger binary
 --ffmpeg <path>                  Location of ffmpeg binary
 --flvstreamer <path>             Location of flvstreamer binary
 --id3v2 <path>                   Location of id3v2 or id3tag binary
 --lame <path>                    Location of lame binary
 --mplayer <path>                 Location of mplayer binary
 --vlc <path>                     Location of vlc or cvlc binary

Tagging Options:
 --no-tag                         Do not tag downloaded programmes
 --tag-cnid                       AtomicParsley supports --cnID argument to add catalog ID used for combining HD and SD versions in iTunes
 --tag-fulltitle                  Use complete title (including series) instead of shorter episode title
 --tag-hdvideo                    AtomicParsley supports --hdvideo argument for HD video flag
 --tag-longdesc                   AtomicParsley supports --longdesc argument for long description text
 --tag-longdescription            AtomicParsley supports --longDescription argument for long description text
 --tag-podcast                    Tag downloaded radio and tv programmes as iTunes podcasts (requires MP3::Tag module for AAC/MP3 files)
 --tag-podcast-radio              Tag only downloaded radio programmes as iTunes podcasts (requires MP3::Tag module for AAC/MP3 files)
 --tag-podcast-tv                 Tag only downloaded tv programmes as iTunes podcasts
 --tag-utf8                       AtomicParsley accepts UTF-8 input

*/