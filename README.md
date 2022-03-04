# Flutter with GRPC

A flutter project demonstrates how to handle basic `crud` operations with gRPC.

## Packages used

- GRPC
- Flutter Hooks (State Management)
- Get It(Dependency Injection)
- protobuf (For protobuf compiler and generation)

## Instructions

- First start server

```dart
 flutter bin/server.dart
```

-Then run the device either on web/desktop/linux or mobile

```dart
flutter run
```

- To change port number
  change in `bin/server.dart` and also at `lib/core/services/grpc_service.dart`
  or else create a file for constants and replace it with that.
