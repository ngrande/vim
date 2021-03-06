# Tips and tricks for using vim
for vim beginners

_TODO: this file needs more formatting - it does not look pleasant or very structured..._

## Exit
one of the first challenges when firing up vim is to close it properly.

### Close wihtout saving
__:q__ (when no changes were made)

__:q!__ (exclamation mark is used to force)

### Close and save
__:qw__ (**q**uit and **w**rite)

## Save changes
__:w__ (**w**rite changes to disk)

### Save changes to another file
__:w__ _[filename]_

## Using tabs
### New tab
__:tabnew__

### Close tab
__:close__

### Switch tabs
__:tabn__ (next tab)

__:tabp__ (previous tab)

## Editing
### Change indentation
__>%__ to indent a curly braces block

__<%__ to unindent a curly braces block

__Vjj>__ to indent a block

__Vjj<__ to unindent a block

### Create new file
__:e__ (start editing - will not create a new file directly but a buffer and later you simply save it via __:w__)

### Delete line
by simply pressing __dd__ (2x 'd' key) you delete a complete line

### Copy & Pase
press 2x __y__ for _yanking_ (copying) and then insert your buffer with a __p__ keystroke (_paste_)

#### Paste from clipboard
press __i__ (switch to _interactive_ mode) and then __SHIFT+V__

#### Visual
if you want to delete / cut out a whole block press __v__ first (visual edit) or (when __set mouse=a__ is active) by selecting via mouse and then press __c__ for _cutting_

go where you want to insert it and press __p__ for _pasintg_

#### Visual Block
press __ctrl+v__ to use visual block. This is very handy when you want to edit a specific column (or more) in more than one row.

## Split view
open a split view via __:sp__

or to open a vertical split view __:vsp__


## Restore / Reopen buffer
when creating new tabs (__:tabnew__) or new files (__:e__) it can happen that you mix something up and close a buffer which you did not intend. In this case simply call __:buffers__ to list all avialable buffers and restore / reopen one with __:buf__ _[n]_

# Macros
one powerful feature of vim is the ability to record and execute macros
## Record
q<letter><commands>...q
## Execute
@<letter> = execute your macro

@@ = execute your macro again

<number>@<letter> = execute your macro <number> times

## Diff (merging)
vim can also be used to show diffs between files and then merge those diffs.

vim -d <file> <file>

### Put change
put a diff from current file (window - where the cursor is) to the other file

dP

### Pull change
pull a diff from the other file (window - where the cursor is __not__) to the current file

dO

# Plugins
tips for usage of some plugins.

<leader> key is set to ","

## A
switch between .c and .h files

__:A__

## NERDTree
call it by __:NERDTree__

## Syntastic
call it by __:SyntasticCheck__

## NERDComment
__<leader> cc__ comment line

__<leader> c <space>__ toggle line comment

## CtrlP
bring up a fuzzy search by __CTRL+P__
