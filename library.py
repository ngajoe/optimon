
from __future__ import print_function
from pathlib import Path
from datetime import date


import logging
import threading
import time
import os

import grpc
import optimon_pb2
import optimon_pb2_grpc

pollingnodes=[]
names=[]
FIX_SIZE=100000
starttime=[]
def run(name, pos):
    if not os.path.isdir("mkdir "+name):
        os.system("mkdir "+name)
    starttime.append(date.today())
    # x=threading.Thread(target=moveifbigsize, args=(name,))
    x=threading.Thread(target=moveiftime, args=(name,))   
    x.start()
    with grpc.insecure_channel(pollingnodes[pos]+':50051') as channel:
        stub = optimon_pb2_grpc.OptimonStub(channel)
        for i in range(5):
            time.sleep(1)
            response = stub.HeartBeat(optimon_pb2.HeartBeatRequest(heartbeat='you'))
            print("Is pollingnode active: " + str(response.success))
            data=stub.GetData(optimon_pb2.GetDataRequest(name='you'))
            f=open(name+"/longstorage.txt","a+")
            f.write(str(data.data))
            f.close()
            print(data)

def fillpollingnodes():
    f=open("pollingnodes.txt","r+")
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
            os.system("mv longstorage.txt longstorage"+str(date.today())+".txt")
            os.system("rm -rf longstorage.txt")

def moveiftime(name):
    path=name+'/longstorage.txt'
    print(os.path.getmtime(path))
    print(time.time())
    if(1>FIX_SIZE):
        os.system("mv longstorage.txt longstorage"+str(date.today())+".txt")
        os.system("rm -rf longstorage.txt")
    

if __name__ == '__main__':
    fillpollingnodes()
    logging.basicConfig()
    startpolling()