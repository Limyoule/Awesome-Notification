import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createBasicNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'basic_channel',
      title: 'Sing Jump Rap Basketball',
      body:
          'Hello, I am an individual trainee who had trained two and half years.',
      notificationLayout: NotificationLayout.Default,
    ),
  );
}

Future<void> createBigPictureNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 2,
      channelKey: 'basic_channel',
      title: 'Sing Jump Rap Basketball',
      body:
          'Hello, I am an individual trainee who had trained two and half years.',
      bigPicture: 'asset://assets/two_and_half_years.png',
      notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}

Future<void> createBigTextNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 3,
      channelKey: 'basic_channel',
      title: 'Sing Jump Rap Basketball',
      body:
          'Hello, I am an individual trainee who had trained two and half years.',
      notificationLayout: NotificationLayout.BigText,
    ),
  );
}

Future<void> createInboxNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 4,
      channelKey: 'basic_channel',
      title: 'Sing Jump Rap Basketball',
      body:
          'Hello, I am an individual trainee who had trained two and half years.',
      notificationLayout: NotificationLayout.Inbox,
    ),
  );
}

Future<void> createProgressBarNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 5,
      channelKey: 'basic_channel',
      title: 'Sing Jump Rap Basketball',
      body:
          'Hello, I am an individual trainee who had trained two and half years.',
      bigPicture: 'asset://assets/two_and_half_years.png',
      notificationLayout: NotificationLayout.ProgressBar,
    ),
  );
}

Future<void> createMessagingNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 6,
      channelKey: 'basic_channel',
      title: 'Sing Jump Rap Basketball',
      body:
          'Hello, I am an individual trainee who had trained two and half years.',
      notificationLayout: NotificationLayout.Messaging,
    ),
  );
}

Future<void> createMessagingGroupNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 7,
      channelKey: 'basic_channel',
      title: 'Sing Jump Rap Basketball',
      body:
          'Hello, I am an individual trainee who had trained two and half years.',
      notificationLayout: NotificationLayout.MessagingGroup,
    ),
  );
}

Future<void> createMeidaPlayerNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 8,
      channelKey: 'basic_channel',
      title: 'Sing Jump Rap Basketball',
      body:
          'Hello, I am an individual trainee who had trained two and half years.',
      notificationLayout: NotificationLayout.MediaPlayer,
    ),
  );
}

Future<void> createScheduledNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 9,
      channelKey: 'scheduled',
      title: 'Two and half years',
      body: 'Chicken Ni Tai Mei',
      notificationLayout: NotificationLayout.Default,
    ),
    schedule: NotificationInterval(
      interval: Duration(seconds: 10),
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
    )
  );
}

Future<void> cancelScheduledNotification() async {
  await AwesomeNotifications().cancelSchedule(9);
}