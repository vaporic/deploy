# Deploy Config

# Bugs
BugFix:
/bin/sh^M: bad interpreter:
Solve:
vim deploy.sh
:set fileformat=unix
:x! or :wq!
