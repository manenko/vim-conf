vim9script

setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

setlocal cindent

# Whitesmith style.
#
# f1s    place the first opening brace of a function or other block in column of
#        a single shiftwidth.
#
# {1s    place opening braces a single shiftwidth characters from the prevailing
#        indent.
#        This applies only for opening braces that are inside other braces.
setlocal cinoptions=f1s,{1s

