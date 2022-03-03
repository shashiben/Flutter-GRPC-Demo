import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../proto_generated/students.pbgrpc.dart';

class StudentRepo {
  Future createStudent(Student student) async {
    final channel = ClientChannel(
      'localhost',
      port: 4325,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    debugPrint("Client Channel Created");
    final stub = StudentServiceClient(channel);

    var res = await stub.createStudent(student);
    debugPrint("Result is:$res");
    await channel.shutdown();
    getStudentList();
  }

  getStudentList() async {
    debugPrint("Started Getting student list");
    final channel = ClientChannel(
      'localhost',
      port: 4325,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    debugPrint("Client Channel Created");
    final stub = StudentServiceClient(channel);
    try {
      final updatedData = await stub.getAllStudent(Empty());
      debugPrint("Updated student list is:${updatedData.student}");
    } catch (e) {
      debugPrint("Error in getting student list is:$e");
    }
  }
}
