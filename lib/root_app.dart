import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loyalty_platform_mobile_flutter/screens/home_screen.dart';
import 'package:loyalty_platform_mobile_flutter/screens/notification_screen.dart';
import 'package:loyalty_platform_mobile_flutter/services/local_notification_service.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  @override
  void initState() {
    super.initState();

    LocalNotificationService.initialize(context);

    ///gives you the message on which user tap
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        // ignore: avoid_print
        print(message.notification!.body);
        // ignore: avoid_print
        print(message.notification!.title);
      }

      LocalNotificationService.display(message);
    });

    ///when the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        const HomeScreen(),
        const NotificationScreen(),
      ],
    );
  }

  Widget getFooter() {
    return SalomonBottomBar(
      currentIndex: pageIndex,
      onTap: (i) => setState(() => pageIndex = i),
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Trang chủ"),
          selectedColor: Colors.purple,
        ),

        /// Wallet
        SalomonBottomBarItem(
          icon: const Icon(Icons.account_balance_wallet),
          title: const Text("Ví tiền"),
          selectedColor: Colors.purple,
        ),

        ///Notification
        SalomonBottomBarItem(
          icon: const Icon(Icons.notifications),
          title: const Text("Thông báo"),
          selectedColor: Colors.purple,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text("Tài khoản"),
          selectedColor: Colors.purple,
        ),
      ],
    );
  }
}
