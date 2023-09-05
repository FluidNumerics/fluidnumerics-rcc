# Available Software

Software is made available through environment modules. You can view what software is available using `module avail`

```
module avail
```

The environment modules are organized to only show modules available for the currently loaded compiler and mpi flavor. If you are looking for what modules are available for a specific package, use `module spider`, e.g.

```
module spider casacore
```

To load software into your environment, use `module load`, e.g.

```
module load gcc/12.1.0
```