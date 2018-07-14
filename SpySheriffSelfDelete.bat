@echo off
title SpySheriff SelfDelete
md SpySheriff ReMove
echo Welcome To SpySheriff SelfDelete!
start SpySheriff ReMove.zip
echo now drag the apps you want to be deleted onto the spysheriff remove folder.
echo Once You're Done,Click A Key.
pause
/taskkill SpySheriff ReMove.zip
del SpySheriff ReMove.zip
echo Deleteion Complete. Exiting In 2 Seconds..
timeout 2
exit
