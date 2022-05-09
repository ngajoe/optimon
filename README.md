Optimon V1

ControlModule:- scripts lets the user add the config of telegraf as desired, Need to make changes in config/polling.ini and config/library.ini
A default ini is given with this which is used to create the default configuration
The file from default ini creates the fields which are needed for working of the nodes.
Add pollingnodes and librarynodes location in nodeaddresses, make sure that you are able to ssh in the machines from the controlmodule. 
Copy the telegraf.conf after running the script in nodes from root to the location where old conf files are places

Polling-Library :- Scripts uses GRPC backend, more details and working of grpc at this site	https://grpc.io/docs/languages/python/
The scripts are configurable to suit the sync time. Add pollingnodes location in pollingnodes.txt in IP and make sure IP are reachable.
The syncs makes files as many pollingnodes are there and store them in longstorage which could be used to post processing of data and move to influx db. 
Uncomment the line 27/28 in library.py to move the longstorage files according to the requirementsss
Uncomment the line 31/32 polling.py to clear out the metrics after reading the data
Polling nodes talk on 50051 port