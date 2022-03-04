import 'package:get_it/get_it.dart';
import 'package:grpcassign/core/services/grpc_service.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton<GRPCService>(GRPCService());
}
