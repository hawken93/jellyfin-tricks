# jellyfin-tricks

Just random scripts that can be useful with jellyfin development.


## rebase-crap.sh
This script is intended to help rebase your branch after jellyfin is minified. Make sure to edit the varibles
in the script before you run it, and that you also read and understand it. I can't make any guarantees, so take backups if you are
unsure.

Varibles it takes are:
* BRANCH - branch that you want to rebase
* NEWBRANCH - branch that this script will create which will be rebased
* OLDDEST - old dev branch, i.e. the big upstream branch
* NEWDEST - new dev branch, i.e. the small upstream branch

If I am to speculate, I think NEWDEST will become either origin/dev or origin/master.
OLDDEST is currently origin/dev but I think it will become origin/olddev or stay as dev if master is the new target. This assumes that your git remote origin points to git@github.com:jellyfin/jellyfin.git
