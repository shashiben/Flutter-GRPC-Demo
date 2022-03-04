// Package imports:
import 'dart:async';
import 'dart:developer';

import 'package:grpc/grpc.dart';

// Project imports:
import 'package:grpcassign/core/proto_generated/students.pbgrpc.dart';

class StudentService extends StudentServiceBase {
  StudentList students = StudentList();

  @override
  Future<ResponseMessage> createStudent(ServiceCall call, Student request) {
    try {
      if (students.student.indexWhere((element) => element.id == request.id) ==
          -1) {
        students.student.add(request);

        return Future.value(
            ResponseMessage(message: "Student added successfully"));
      } else {
        return Future.value(
            ResponseMessage(message: "Student with id already exists"));
      }
    } catch (e) {
      return Future.value(ResponseMessage(message: "$e"));
    }
  }

  @override
  Future<ResponseMessage> deleteStudentById(
      ServiceCall call, StudentId request) {
    try {
      int studentIndex =
          students.student.indexWhere((element) => element.id == request.id);
      if (studentIndex != -1) {
        students.student.removeAt(studentIndex);

        return Future.value(
            ResponseMessage(message: "Student removed successfully"));
      } else {
        return Future.value(
            ResponseMessage(message: "Student with given id doesn't exist"));
      }
    } catch (e) {
      return Future.value(ResponseMessage(message: "$e"));
    }
  }

  @override
  Future<SearchStudentResult> getStudentById(
      ServiceCall call, StudentId request) {
    try {
      int studentIndex =
          students.student.indexWhere((element) => element.id == request.id);
      if (studentIndex == -1) {
        return Future.value(SearchStudentResult(
            message: "No student exist with id:${request.id}"));
      } else {
        return Future.value(SearchStudentResult(
            student: students.student.elementAt(studentIndex)));
      }
    } catch (e) {
      return Future.value(SearchStudentResult(message: "Error:$e"));
    }
  }

  @override
  Future<ResponseMessage> updateStudent(ServiceCall call, Student request) {
    try {
      int studentIndex =
          students.student.indexWhere((element) => element.id == request.id);
      if (studentIndex != -1) {
        students.student[studentIndex] = request;
        return Future.value(
            ResponseMessage(message: "Updated student successfully"));
      } else {
        return Future.value(
            ResponseMessage(message: "No student exist with id:${request.id}"));
      }
    } catch (e) {
      return Future.value(ResponseMessage(message: "Error:$e"));
    }
  }

  @override
  Future<StudentList> getAllStudent(ServiceCall call, Empty request) async {
    return students;
  }
}

Future<void> main() async {
  final server = Server([StudentService()], const <Interceptor>[],
      CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]));
  await server.serve(port: 4325);
  log('✅ Server listening on port ${server.port}...');
}
