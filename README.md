# jellyfin-tricks

Just random scripts that can be useful with jellyfin development.


## rebase-crap.sh
This script is intended to help rebase your branch after jellyfin is minified. Make sure to edit the varibles
in the script before you run it, and that you also read and understand it. I can't make any guarantees, so take backups if you are
unsure.

quick backup snippet: `tar -cvf ../jellyfin-git-backup-2019-01.tar .git`. Wherever this resulting tar file is untarred, will become a git directory for jellyfin. So imagine if you come back later and need your backup: `mkdir jellyfin-old; tar -xvf jellyfin-git-backup-2019.01.tar -C jellyfin-old`

Varibles it takes are:
* BRANCH - branch that you want to rebase
* NEWBRANCH - branch that this script will create which will be rebased
* OLDDEST - old dev branch, i.e. the big upstream branch
* NEWDEST - new dev branch, i.e. the small upstream branch

NEWDEST is upstream/master.

OLDDEST is probably dev or origin/dev (the old dev branch).

OLDDEST is origin/dev since you probably didn't delete it yet. In an emergency, I have an olddev branch in [my fork](https://github.com/hawken93/jellyfin/tree/olddev) :)
