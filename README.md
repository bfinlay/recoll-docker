
recoll-docker
===================

Uses the recoll project to implement full text search
includes webui

uses docker-compose

copy env.example to .env and configure the variables accordingly.  
In particular configure
* RECOLL_WEBUI_PORT to match desired port and
* HOST_PATH_TO_INDEX to point to the path to be indexed on the host machine

Configure recoll settings by modifying ./data/.recoll/recoll.conf.  The defaults should be fine for most uses.

run `docker-compose up -d` to run.




