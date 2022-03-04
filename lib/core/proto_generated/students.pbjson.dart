///
//  Generated code. Do not modify.
//  source: students.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

// Dart imports:
import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use searchStudentResultDescriptor instead')
const SearchStudentResult$json = const {
  '1': 'SearchStudentResult',
  '2': const [
    const {
      '1': 'student',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Student',
      '9': 0,
      '10': 'student',
      '17': true
    },
    const {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'message',
      '17': true
    },
  ],
  '8': const [
    const {'1': '_student'},
    const {'1': '_message'},
  ],
};

/// Descriptor for `SearchStudentResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchStudentResultDescriptor = $convert.base64Decode(
    'ChNTZWFyY2hTdHVkZW50UmVzdWx0EicKB3N0dWRlbnQYASABKAsyCC5TdHVkZW50SABSB3N0dWRlbnSIAQESHQoHbWVzc2FnZRgCIAEoCUgBUgdtZXNzYWdliAEBQgoKCF9zdHVkZW50QgoKCF9tZXNzYWdl');
@$core.Deprecated('Use studentDescriptor instead')
const Student$json = const {
  '1': 'Student',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'dept', '3': 3, '4': 1, '5': 9, '10': 'dept'},
    const {'1': 'gender', '3': 4, '4': 1, '5': 9, '10': 'gender'},
  ],
};

/// Descriptor for `Student`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentDescriptor = $convert.base64Decode(
    'CgdTdHVkZW50Eg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBGRlcHQYAyABKAlSBGRlcHQSFgoGZ2VuZGVyGAQgASgJUgZnZW5kZXI=');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use responseMessageDescriptor instead')
const ResponseMessage$json = const {
  '1': 'ResponseMessage',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ResponseMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseMessageDescriptor = $convert.base64Decode(
    'Cg9SZXNwb25zZU1lc3NhZ2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');
@$core.Deprecated('Use studentIdDescriptor instead')
const StudentId$json = const {
  '1': 'StudentId',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `StudentId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentIdDescriptor =
    $convert.base64Decode('CglTdHVkZW50SWQSDgoCaWQYASABKAVSAmlk');
@$core.Deprecated('Use studentListDescriptor instead')
const StudentList$json = const {
  '1': 'StudentList',
  '2': const [
    const {
      '1': 'student',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Student',
      '10': 'student'
    },
  ],
};

/// Descriptor for `StudentList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentListDescriptor = $convert.base64Decode(
    'CgtTdHVkZW50TGlzdBIiCgdzdHVkZW50GAEgAygLMgguU3R1ZGVudFIHc3R1ZGVudA==');
