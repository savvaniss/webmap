#!/bin/bash
set -x
doStart() {
   cd /var/www/html/sites/angular/front/
   nohup ng serve --host=192.168.1.200 &
   cd /var/www/html/sites/angular/backend/
   nohup npm start &
}
doStop(){
    kill $(ps aux | grep 'ng serve' | awk '{print $2}')
    kill $(ps aux | grep 'npm start' | awk '{print $2}')
}

case "$1" in
    start)
        doStart
        ;;
    stop)
        doStop
        ;;
esac