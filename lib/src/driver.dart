import 'package:appium_flutter_server/src/exceptions/no_driver_exception.dart';
import 'package:appium_flutter_server/src/models/session.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

class FlutterDriver {
  late WidgetTester _tester;
  late Widget _app;
  late Session? _session;

  FlutterDriver._();

  static final FlutterDriver _instance = FlutterDriver._();
  static FlutterDriver get instance => _instance;

  Widget get app => _app;
  WidgetTester get tester => _tester;

  void initialize({required WidgetTester tester, required Widget app}) async {
    _tester = tester;
    _app = app;
  }

  String initializeSession(Map<String, dynamic> capabilities) {
    _session = Session(const Uuid().v4(), capabilities);
    return _session!.sessionId;
  }

  Session? getSessionOrThrow() {
    if (_session == null) {
      throw NoSuchDriverException(
          "A session is either terminated or not started");
    }
    return _session;
  }

  void resetSession() {
    _session = null;
  }
}
