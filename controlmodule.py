import os
import configparser
hostname="kalpit12@c220g2-011122.wisc.cloudlab.us"

def makePolling():
    config = configparser.ConfigParser()
    config.read('pollingdefault.ini')
    config.read('polling.ini')
    fd=open("polling.conf","w+")
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
                fd.write("  "+option+" = "+config[section][option]+"\n")
    fd.close()
    os.system("scp -r polling.conf "+hostname+":")
    os.system("ssh "+hostname+" systemctl reload telegraf")

def makeLibrary():
    config = configparser.ConfigParser()
    config.read('librarydefault.ini')
    config.read('library.ini')
    fd=open("library.conf","w+")
    for section in config.sections():
        if(section[0]=='['):
            fd.write("["+section+"]]"+"\n")
        else:
            fd.write("["+section+"]"+"\n")
        for option in config.options(section):
            fd.write(" "+option+" = "+config[section][option]+"\n")
        fd.write("\n")
    fd.close()
    os.system("scp -r library.conf "+hostname+":")
    os.system("ssh "+hostname+" systemctl reload telegraf")
    os.system("ssh "+hostname+" sudo systemctl stop influxdb")
    os.system("ssh "+hostname+" sudo systemctl enable influxdb")
    os.system("ssh "+hostname+" sudo systemctl start influxdb")




if __name__ == "__main__":
    makePolling()
    makeLibrary()