

from concurrent import futures
import logging

import grpc
import optimon_pb2
import optimon_pb2_grpc


class Optimon(optimon_pb2_grpc.OptimonServicer):

    def HeartBeat(self, request, context):
        return optimon_pb2.HeartBeatResponse(success=True)
    def GetData(self, request, context):
        data=readfile()
        return optimon_pb2.GetDataResponse(data=data)


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    optimon_pb2_grpc.add_OptimonServicer_to_server(Optimon(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    server.wait_for_termination()

def readfile():
    f=open("/local/optimon/metrics/metrics.out",'r+')
    data=f.read()
    f.close()
    # f=open("/local/optimon/metrics",'w+')
    # f.close()
    return data

if __name__ == '__main__':
    logging.basicConfig()
    serve()
