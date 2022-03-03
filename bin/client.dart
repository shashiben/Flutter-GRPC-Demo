// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:grpc/grpc.dart';

// Project imports:
import 'package:grpcassign/core/proto_generated/students.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: ChannelOptions(
      credentials: const ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  final stub = StudentServiceClient(channel);

  final name = args.isNotEmpty ? args[0] : 'world';

  try {
    await stub.createStudent(Student(dept: "1", name: "Shashi", id: 1));
    await stub.createStudent(Student(dept: "2", name: "Ramu", id: 2));

    debugPrint('Greeter client received:');
  } catch (e) {
    debugPrint('Caught error: $e');
  }
  await channel.shutdown();
}
