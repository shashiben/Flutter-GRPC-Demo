// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:grpcassign/core/services/grpc_service.dart';

// Project imports:
import '../../app/locator.dart';
import '../proto_generated/students.pbgrpc.dart';

class StudentRepo {
  final GRPCService _grpcService = locator<GRPCService>();
  Future createStudent(Student student) async {
    var res = await _grpcService.stub.createStudent(student);
    debugPrint("Result is:$res");
  }

  Future getStudentList() async {
    try {
      final updatedData = await _grpcService.stub.getAllStudent(Empty());
      debugPrint("Updated student list is:${updatedData.student}");
      return updatedData.student;
    } catch (e) {
      return "$e";
    }
  }

  Future updateStudent(Student student) async {
    debugPrint("Client Channel Created");

    var res = await _grpcService.stub.updateStudent(student);
    debugPrint("Result is:$res");
  }

  Future deleteStudent(int id) async {
    var res = await _grpcService.stub.deleteStudentById(
      StudentId(id: id),
    );
    debugPrint("Result is:$res");
  }
}
