# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

import optimon_pb2 as optimon__pb2


class OptimonStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.HeartBeat = channel.unary_unary(
                '/helloworld.Optimon/HeartBeat',
                request_serializer=optimon__pb2.HeartBeatRequest.SerializeToString,
                response_deserializer=optimon__pb2.HeartBeatResponse.FromString,
                )
        self.GetData = channel.unary_unary(
                '/helloworld.Optimon/GetData',
                request_serializer=optimon__pb2.GetDataRequest.SerializeToString,
                response_deserializer=optimon__pb2.GetDataResponse.FromString,
                )


class OptimonServicer(object):
    """Missing associated documentation comment in .proto file."""

    def HeartBeat(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetData(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_OptimonServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'HeartBeat': grpc.unary_unary_rpc_method_handler(
                    servicer.HeartBeat,
                    request_deserializer=optimon__pb2.HeartBeatRequest.FromString,
                    response_serializer=optimon__pb2.HeartBeatResponse.SerializeToString,
            ),
            'GetData': grpc.unary_unary_rpc_method_handler(
                    servicer.GetData,
                    request_deserializer=optimon__pb2.GetDataRequest.FromString,
                    response_serializer=optimon__pb2.GetDataResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'helloworld.Optimon', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class Optimon(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def HeartBeat(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/helloworld.Optimon/HeartBeat',
            optimon__pb2.HeartBeatRequest.SerializeToString,
            optimon__pb2.HeartBeatResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetData(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/helloworld.Optimon/GetData',
            optimon__pb2.GetDataRequest.SerializeToString,
            optimon__pb2.GetDataResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)