set auto-load safe-path /
source ~/.gdb-dashbord.py
set history save
set verbose off
set print pretty on
set print array off
set print array-indexes on

python Dashboard.start()
dashboard -layout assembly source stack memory expressions

