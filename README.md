# Deploy Config

### Bugs Fix
```/bin/sh^M: bad interpreter:```

### Solve:

```
vim deploy.sh
```
```
:set fileformat=unix
```
```
:x! or :wq!
```
