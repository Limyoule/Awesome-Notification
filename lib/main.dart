import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'firebase_options.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'notifications.dart';

void main() {
  AwesomeNotifications().initialize(
    'resource://drawable/res_ikun_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.yellow,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: "To test the effect of customize notifications",
      ),
      NotificationChannel(
        channelKey: 'scheduled',
        channelName: 'Scheduled Notification',
        defaultColor: Colors.orange,
        locked: true,
        importance: NotificationImportance.High,
        soundSource: 'resource://raw/res_didadididaodao',
        playSound: true,
        channelDescription:
            'Can push notification at the specified schedule automatily',
      ),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Notification Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Awesome Nofitication Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    cancelScheduledNotification();
    createScheduledNotification();

    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Allow Notifications"),
              content: Text("Our App would like to send you notifications"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Don't Allow",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    "Allow",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: createBasicNotification,
              child: Text("Basic Notification"),
            ),
            FilledButton(
              onPressed: createBigPictureNotification,
              child: Text("Big Picture Notification"),
            ),
            FilledButton(
              onPressed: createBigTextNotification,
              child: Text("Big Text Notification"),
            ),
            FilledButton(
              onPressed: createInboxNotification,
              child: Text("Indox Notification"),
            ),
            FilledButton(
              onPressed: createProgressBarNotification,
              child: Text("Progress Bar Notification"),
            ),
            FilledButton(
              onPressed: createMessagingNotification,
              child: Text("Messaging Notification"),
            ),
            FilledButton(
              onPressed: createMessagingGroupNotification,
              child: Text("Messaging Group Notification"),
            ),
            FilledButton(
              onPressed: createMeidaPlayerNotification,
              child: Text("Media Player Notification"),
            ),
            FilledButton(
              onPressed: createScheduledNotification,
              child: Text("Scheduled Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
