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

I think how this will look is that NEWDEST will be upstream/dev or master. Time will tell. OLDDEST will be origin/dev since your own fork is assumed to not track upstream after the change. Otherwise I'll make an olddev branch in hawken93/jellyfin.git. Talk to me if you need help with this, I'm on jellyfin's matrix chat. :)
