# Tips and tricks for using vim
for vim beginners

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
### Create new file
__:e__ (start editing - will not create a new file directly but a buffer and later you simply save it via __:w__)

## Restore / Reopen buffer
when creating new tabs (__:tabnew__) or new files (__:e__) it can happen that you mix something up and close a buffer which you did not intend. In this case simply call __:buffers__ to list all avialable buffers and restore / reopen one with __:buf__ _[n]_
