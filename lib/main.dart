import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pusher_client/pusher_client.dart';

import 'data/network/sqlite_client.dart';
import 'domain/storage_utils.dart';
import 'ui/app/app.dart';

// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0

PusherOptions options = PusherOptions(
  cluster: 'ap1',
);

PusherClient pusher =
    PusherClient("6c017fccd9d4fd328163", options, autoConnect: true);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtils.init();
  await SqliteClient.getInstance();
  await AndroidAlarmManager.initialize();
  runApp(
    Phoenix(
      child: App(
        pusher: pusher,
      ),
    ),
  );
}
