import 'package:grpc/grpc.dart';

import '../proto_generated/students.pbgrpc.dart';

class GRPCService {
  late ClientChannel channel;
  late StudentServiceClient stub;
  Future disposeChannel() async {
    await channel.shutdown();
  }

  Future createChannel() async {
    channel = ClientChannel(
      'localhost',
      port: 4325,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(codecs: const [
          GzipCodec(),
          IdentityCodec(),
        ]),
      ),
    );
    stub = StudentServiceClient(channel);
  }
}
