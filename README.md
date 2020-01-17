# MuseScore Automated Builds.

This repo exists to give a (somewhat) automated set of tools for reliably and repeatably building MuseScore, without worrying about dependencies etc. 

Ideally, this should make it possible to easily build MuseScore without needing to install Qt (etc), which should make using it for *other* automated tooling much easier.

To use this, all you should need to do is call `run.sh`, and point it to a musescore source directory (or clone musescore into a directory called `MuseScore` adjacent to `run.sh`). Of course, you'll need docker, bash, etc as well.