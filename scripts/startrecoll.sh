#!/bin/bash
/bin/bash /home/docker/scripts/bgindex.sh &
/usr/bin/python3 /home/docker/recoll-webui/webui-standalone.py -a 0.0.0.0
