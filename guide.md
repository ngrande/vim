# Tips and tricks for using vim
for vim beginners

## Exit
one of the first challenges when firing up vim is to close it properly.

### Close wihtout saving
:q (when no changes were made)

:q! (exclamation mark is used to force)

### Close and save
:qw (__q__uit and __w__rite)

## Save changes
:w (__w__rite changes to disk)

### Save changes to another file
:w [filename]

## Using tabs
### New tab
:tabnew

### Close tab
:close

### Switch tabs
:tabn (next tab)

:tabp (previous tab)

## Editing
### Create new file
:e (start editing - will not create a new file directly but a buffer and later you simply save it via :w)

## Restore / Reopen buffer
when creating new tabs (:tabnew) or new files (:e) it can happen that you mix something up and close a buffer which you did not intend. In this case simply call :buffers to list all avialable buffers and restore / reopen one with :buf [n]
