#! /bin/bash 
#	get wallpaper randomly from unsplash, apply it, and using pywal build a matching colorscheme

# API DOC --  https://source.unsplash.com  {{{
# https://source.unsplash.com/random/{SIZE}
# https://source.unsplash.com/user/{USERNAME}/{SIZE}
# https://source.unsplash.com/user/{USERNAME}/likes/{SIZE}
# https://source.unsplash.com/collection/{COLLECTION ID}/{SIZE}
# https://source.unsplash.com/category/{CATEGORY}/?{SEARCH,TERM}
# https://source.unsplash.com/?{KEYWORD}
# https://source.unsplash.com/daily|weekly
# https://source.unsplash.com/featured/?{KEYWORD},{KEYWORD}
# https://source.unsplash.com/1600x900/{?SEARCH,TERM}
# https://source.unsplash.com/{PHOTO ID}/1600x900
# }}}

# Settings
PARAMS=$*
COLLECTION_NUMBER="1912959"
COLLECTION_NUMBER="629911"
COLLECTION_NUMBER="198884"

# Grabbing wallpaper from unsplash
rm $HOME/img
wget -O $HOME/img "https://source.unsplash.com/collection/$COLLECTION_NUMBER/1600x900"


# Do we have pywal installed?
if [[ -x $HOME/.local/bin/wal ]]; then
    # I3 and terminal theming
    /home/vic/.local/bin/wal $PARAMS -c -i $HOME/img
else
    # We don't :(
    feh --bg-scale $HOME/img
fi

# Theme notification
bash $HOME/Dotfiles/script/start-dunst.sh

# vim: fdm=marker
