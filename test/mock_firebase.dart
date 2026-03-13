import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

const MethodChannel _channel = MethodChannel(
  'plugins.flutter.io/firebase_core',
);

Future<void> setupFirebaseCoreMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(_channel, (call) async {
        if (call.method == 'Firebase#initializeCore') {
          return [
            {
              'name': '[DEFAULT]',
              'options': {
                'apiKey': '123',
                'appId': '1:123:web:123',
                'messagingSenderId': '123',
                'projectId': '123',
                'storageBucket': '123.appspot.com',
              },
              'pluginConstants': {},
            },
          ];
        }
        if (call.method == 'Firebase#initializeApp') {
          return {
            'name': call.arguments['appName'],
            'options': call.arguments['options'],
            'pluginConstants': {},
          };
        }
        return null;
      });
}
