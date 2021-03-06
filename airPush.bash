# Settings {
   # MANDATORY {
    SERVEO_PORT=4669 #TYPE A RANDOM NUMBER 4-5 DIGS
    #the port you want to request from serevos forwording service
   # }
    AIRMESSAGE_PORT=1359 #the port used by the mac Airmessage app. LEAVE AS IS If you dont know, or didnt change any setting.
    SERVER_ALIVE_INTERVAL=60 #the interval in seconds used to check if the connection is still alive. If disconnected, the script will bring it back up anyway.
# }

osascript -e "tell application \"AirMessage\" to activate"
osascript -e "tell application \"messages\" to activate"
osascript -e "tell application \"System Events\" to set visible of application process \"Messages\" to false"


echo "     _      _____           _
     /\   (_)    |  __ \         | |
    /  \   _ _ __| |__) |   _ ___| |__
   / /\ \ | | '__|  ___/ | | / __| '_
  / ____ \| | |  | |   | |_| \__ \ | | |
 /_/    \_\_|_|  |_|    \__,_|___/_| |_|
 All in one AitMessage script you can forget about!

 v1.0 stable  --Check for updates at: https://github.com/sethusenthil/AirPush

 By Sethu Senthil on 8/9/2019
   https://sethusenthil.com
 "

while :
    do
      ssh -R $SERVEO_PORT:localhost:$AIRMESSAGE_PORT serveo.net -o ServerAliveInterval=$SERVER_ALIVE_INTERVAL
      echo "AirPush: Reverse Proxy Disconnected...Reconnecting"
done