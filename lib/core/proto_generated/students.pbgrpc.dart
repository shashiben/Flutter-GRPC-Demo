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
  static final _$createStudent = $grpc.ClientMethod<$0.Student, $0.Student>(
      '/StudentService/createStudent',
      ($0.Student value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Student.fromBuffer(value));
  static final _$updateStudent = $grpc.ClientMethod<$0.Student, $0.Student>(
      '/StudentService/updateStudent',
      ($0.Student value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Student.fromBuffer(value));
  static final _$getStudentById = $grpc.ClientMethod<$0.Student, $0.Student>(
      '/StudentService/getStudentById',
      ($0.Student value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Student.fromBuffer(value));
  static final _$deleteStudentById = $grpc.ClientMethod<$0.Student, $0.Empty>(
      '/StudentService/deleteStudentById',
      ($0.Student value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  StudentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Student> createStudent($0.Student request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createStudent, request, options: options);
  }

  $grpc.ResponseFuture<$0.Student> updateStudent($0.Student request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStudent, request, options: options);
  }

  $grpc.ResponseFuture<$0.Student> getStudentById($0.Student request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStudentById, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteStudentById($0.Student request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteStudentById, request, options: options);
  }
}

abstract class StudentServiceBase extends $grpc.Service {
  $core.String get $name => 'StudentService';

  StudentServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Student, $0.Student>(
        'createStudent',
        createStudent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Student.fromBuffer(value),
        ($0.Student value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Student, $0.Student>(
        'updateStudent',
        updateStudent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Student.fromBuffer(value),
        ($0.Student value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Student, $0.Student>(
        'getStudentById',
        getStudentById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Student.fromBuffer(value),
        ($0.Student value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Student, $0.Empty>(
        'deleteStudentById',
        deleteStudentById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Student.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Student> createStudent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Student> request) async {
    return createStudent(call, await request);
  }

  $async.Future<$0.Student> updateStudent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Student> request) async {
    return updateStudent(call, await request);
  }

  $async.Future<$0.Student> getStudentById_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Student> request) async {
    return getStudentById(call, await request);
  }

  $async.Future<$0.Empty> deleteStudentById_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Student> request) async {
    return deleteStudentById(call, await request);
  }

  $async.Future<$0.Student> createStudent(
      $grpc.ServiceCall call, $0.Student request);
  $async.Future<$0.Student> updateStudent(
      $grpc.ServiceCall call, $0.Student request);
  $async.Future<$0.Student> getStudentById(
      $grpc.ServiceCall call, $0.Student request);
  $async.Future<$0.Empty> deleteStudentById(
      $grpc.ServiceCall call, $0.Student request);
}
