#! /bin/sh
APP="/usr/local/lib/Spine"
${APP}/launcher/jre/bin/java -server -DSpineJava -Xmx1024M -jar ${APP}/launcher/launcher-full.jar "${@}"
