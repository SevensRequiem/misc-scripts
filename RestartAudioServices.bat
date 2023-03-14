@echo off
net stop Audiosrv
net stop AudioEndpointBuilder
net start Audiosrv
exit
