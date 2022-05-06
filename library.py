
from __future__ import print_function
from pathlib import Path
from datetime import date


import logging
import threading
import time
import os
import datetime

import grpc
import grpc._channel
import optimon_pb2
import optimon_pb2_grpc

pollingnodes=[]
names=[]
FIX_SIZE=100000
starttime=[]
def run(name, pos):
    if not os.path.isdir(name):
        os.mkdir(name)
    starttime.append(date.today())
    #x=threading.Thread(target=moveifbigsize, args=(name,))
    #x=threading.Thread(target=moveiftime, args=(name,))   
    #x.start()
    with grpc.insecure_channel(str(pollingnodes[pos])) as channel:
        stub = optimon_pb2_grpc.OptimonStub(channel)
        count=1
        for i in range(100):
            time.sleep(5)
            try:
                response = stub.HeartBeat(optimon_pb2.HeartBeatRequest(heartbeat='you'))
            except (grpc._channel._InactiveRpcError):
                print("No HeartBeat")
                count=count+1
                time.sleep(2)
                if count==4:
                    print("Polling Node is dead, returning")
                    return
                continue
            count=1
            print("Is pollingnode active: " + str(response.success))
            data=stub.GetData(optimon_pb2.GetDataRequest(name='you'))

            f=open(name+"/longstorage.txt","a+")
            f.write(str(data.data))
            f.close()
            print(data)

def fillpollingnodes():
    f=open("./nodesaddress/pollingnodes.txt","r+")
    count=1
    for node in f.readlines():
        print(str(count),node)
        pollingnodes.append(node)
        names.append("node"+str(count))
        count=count+1
    f.close()
    
def startpolling():
    threads=[]
    count=len(pollingnodes)
    for i in range(count):
        threads.append(threading.Thread(target=run, args=(names[i],i)))
    for i in range(count):
        threads[i].start()
    for i in range (count):
        threads[i].join()

def moveifbigsize(name):
    path=name+'/longstorage.txt'
    for i in range(5):
        time.sleep(1)
        file=Path(path).stat().st_size
        print("Size of file is :", file, "bytes")
        if(file>FIX_SIZE):
            os.system("mv longstorage.txt longstorage"+str(datetime.datetime.isoformat(datetime.datetime.now()))+".txt")
            os.system("rm -rf longstorage.txt")

def moveiftime(name):
    path=name+'/longstorage.txt'
    print(os.path.getmtime(path))
    print(time.time())
    if(1>FIX_SIZE):
        os.system("mv longstorage.txt longstorage"+str(datetime.datetime.isoformat(datetime.datetime.now()))+".txt")
        os.system("rm -rf longstorage.txt")
    

if __name__ == '__main__':
    fillpollingnodes()
    logging.basicConfig()
    startpolling()