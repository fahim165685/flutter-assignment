// Blue text
import 'package:flutter/foundation.dart';

void logInfo(Object? msg) {
  if (kDebugMode) {
    print('\x1B[34m===> $msg\x1B[0m');
  }
}

// Green text
void logSuccess(Object? msg) {
  if (kDebugMode) {
    print('\x1B[32m===> $msg\x1B[0m');
  }
}

// Yellow text
void logWarning(Object? msg) {
  if (kDebugMode) {
    print('\x1B[33m===> $msg\x1B[0m');
  }
}

// Yellow text
void logData(Object? msg) {
  if (kDebugMode) {
    print('\x1B[36m===> $msg\x1B[0m');
  }
}

// Red text
void logError(Object? msg) {
  if (kDebugMode) {
    print('\x1B[31m===> $msg\x1B[0m');
  }
}
