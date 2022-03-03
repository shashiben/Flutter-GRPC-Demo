///
//  Generated code. Do not modify.
//  source: students.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'students.pb.dart' as $0;
export 'students.pb.dart';

class StudentServiceClient extends $grpc.Client {
  static final _$createStudent =
      $grpc.ClientMethod<$0.Student, $0.ResponseMessage>(
          '/StudentService/createStudent',
          ($0.Student value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseMessage.fromBuffer(value));
  static final _$updateStudent =
      $grpc.ClientMethod<$0.Student, $0.ResponseMessage>(
          '/StudentService/updateStudent',
          ($0.Student value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseMessage.fromBuffer(value));
  static final _$getStudentById =
      $grpc.ClientMethod<$0.StudentId, $0.SerachStudentResult>(
          '/StudentService/getStudentById',
          ($0.StudentId value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SerachStudentResult.fromBuffer(value));
  static final _$deleteStudentById =
      $grpc.ClientMethod<$0.StudentId, $0.ResponseMessage>(
          '/StudentService/deleteStudentById',
          ($0.StudentId value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseMessage.fromBuffer(value));

  StudentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ResponseMessage> createStudent($0.Student request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createStudent, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseMessage> updateStudent($0.Student request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStudent, request, options: options);
  }

  $grpc.ResponseFuture<$0.SerachStudentResult> getStudentById(
      $0.StudentId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStudentById, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseMessage> deleteStudentById(
      $0.StudentId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteStudentById, request, options: options);
  }
}

abstract class StudentServiceBase extends $grpc.Service {
  $core.String get $name => 'StudentService';

  StudentServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Student, $0.ResponseMessage>(
        'createStudent',
        createStudent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Student.fromBuffer(value),
        ($0.ResponseMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Student, $0.ResponseMessage>(
        'updateStudent',
        updateStudent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Student.fromBuffer(value),
        ($0.ResponseMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StudentId, $0.SerachStudentResult>(
        'getStudentById',
        getStudentById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StudentId.fromBuffer(value),
        ($0.SerachStudentResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StudentId, $0.ResponseMessage>(
        'deleteStudentById',
        deleteStudentById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StudentId.fromBuffer(value),
        ($0.ResponseMessage value) => value.writeToBuffer()));
  }

  $async.Future<$0.ResponseMessage> createStudent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Student> request) async {
    return createStudent(call, await request);
  }

  $async.Future<$0.ResponseMessage> updateStudent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Student> request) async {
    return updateStudent(call, await request);
  }

  $async.Future<$0.SerachStudentResult> getStudentById_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StudentId> request) async {
    return getStudentById(call, await request);
  }

  $async.Future<$0.ResponseMessage> deleteStudentById_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StudentId> request) async {
    return deleteStudentById(call, await request);
  }

  $async.Future<$0.ResponseMessage> createStudent(
      $grpc.ServiceCall call, $0.Student request);
  $async.Future<$0.ResponseMessage> updateStudent(
      $grpc.ServiceCall call, $0.Student request);
  $async.Future<$0.SerachStudentResult> getStudentById(
      $grpc.ServiceCall call, $0.StudentId request);
  $async.Future<$0.ResponseMessage> deleteStudentById(
      $grpc.ServiceCall call, $0.StudentId request);
}
