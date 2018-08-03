# awesomewm-tagging

### append_or_move_tag()
checks, if there is a tag on the right of the currently selected one. If so, it moves to it. 
Otherwise it creates a new one and asks you to rename it. Then it moves to the newly created tag. 

### prepend_or_move_tag()
checks, if there the current tag is the leftmost tag. If so, it creates a new tag, renames it, and then swaps it through to the left. So the new tag will appear on the left end of the taglist.

### Usage:
copy the functions to your ```rc.lua```. Then assign them to keys you like. For me those are the tag navigation-keys. So if I am at the most-right tag and press move-right again, it will create a new tag for me. 

For making it work assign the functions to the desired key. 
