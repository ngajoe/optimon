import os
import configparser
polling=[]
library=[]

def makePolling():
    config = configparser.ConfigParser()
    config.read('./config/pollingdefault.ini')
    config.read('./config/polling.ini')
    fd=open("telegraf.conf","w+")
    for section in config.sections():
        if section.find("inputs.snmp.field") == -1:
            if(section[0]=='['):
                fd.write("["+section+"]]"+"\n")
            else:
                fd.write("["+section+"]"+"\n")
            for option in config.options(section):
                fd.write(" "+option+" = "+config[section][option]+"\n")
            if section.find("inputs.snmp") == -1:
                fd.write("\n")
        else:
            fd.write(" ["+section+"]]"+"\n")
            for option in config.options(section):
                fd.write(" "+option+" = "+config[section][option]+"\n")
    fd.close()
    for nodes in polling:
        os.system("scp -r telegraf.conf "+nodes+":")
        os.system("ssh "+nodes+" sudo systemctl reload telegraf")

def makeLibrary():
    config = configparser.ConfigParser()
    config.read('./config/librarydefault.ini')
    config.read('./config/library.ini')
    fd=open("telegraf.conf","w+")
    for section in config.sections():
        if(section[0]=='['):
            fd.write("["+section+"]]"+"\u00A0"+"\n")
            for option in config.options(section):
                fd.write("\u00A0 "+option+" = "+config[section][option]+"\u00A0"+"\n")
        else:
            fd.write("["+section+"]"+"\u00A0"+"\n")
            for option in config.options(section):
                fd.write("\u00A0"+option+" = "+config[section][option]+"\u00A0"+"\n")
        fd.write("\n")
    fd.close()
    for nodes in library:
        os.system("scp -r telegraf.conf "+nodes+":")
        os.system("ssh "+nodes+" sudo systemctl reload telegraf")
        os.system("ssh "+nodes+" sudo systemctl stop influxdb")
        os.system("ssh "+nodes+" sudo systemctl enable influxdb")
        os.system("ssh "+nodes+" sudo systemctl start influxdb")


def fillnodes():
    f=open("./nodesaddress/polling.txt","r+")
    for node in f.readlines():
        polling.append(node)
    f.close()
    f=open("./nodesaddress/library.txt","r+")
    for node in f.readlines():
        library.append(node)
    f.close()

if __name__ == "__main__":
    fillnodes()
    makePolling()
    makeLibrary()
