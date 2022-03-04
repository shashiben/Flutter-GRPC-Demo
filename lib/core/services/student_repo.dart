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
      return updatedData.student;
    } catch (e) {
      return "$e";
    }
  }

  Future updateStudent(Student student) async {
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

    var res = await stub.updateStudent(student);
    debugPrint("Result is:$res");
  }

  Future deleteStudent(int id) async {
    final channel = ClientChannel(
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
    debugPrint("Client Channel Created");
    final stub = StudentServiceClient(channel);

    var res = await stub.deleteStudentById(
      StudentId(id: id),
    );
    debugPrint("Result is:$res");
  }
}
