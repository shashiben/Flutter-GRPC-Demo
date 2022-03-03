// Package imports:
import 'package:grpc/grpc.dart';

// Project imports:
import 'package:grpcassign/core/proto_generated/students.pbgrpc.dart';

class StudentService extends StudentServiceBase {
  final List<Student> students = [];

  @override
  Future<ResponseMessage> createStudent(ServiceCall call, Student request) {
    try {
      if (students.indexWhere((element) => element.id == request.id) == -1) {
        students.add(request);
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
          students.indexWhere((element) => element.id == request.id);
      if (studentIndex != -1) {
        students.removeAt(studentIndex);
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
  Future<SerachStudentResult> getStudentById(
      ServiceCall call, StudentId request) {
    try {
      int studentIndex =
          students.indexWhere((element) => element.id == request.id);
      if (studentIndex == -1) {
        return Future.value(SerachStudentResult(
            message: "No student exist with id:${request.id}"));
      } else {
        return Future.value(
            SerachStudentResult(student: students.elementAt(studentIndex)));
      }
    } catch (e) {
      return Future.value(SerachStudentResult(message: "Error:$e"));
    }
  }

  @override
  Future<ResponseMessage> updateStudent(ServiceCall call, Student request) {
    try {
      int studentIndex =
          students.indexWhere((element) => element.id == request.id);
      if (studentIndex != -1) {
        students[studentIndex] = request;
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
}

Future<void> main() async {
  final server = Server([StudentService()], const <Interceptor>[],
      CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]));
  await server.serve(port: 5000);

  print("Server started running");
}
