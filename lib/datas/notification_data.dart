import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:loyalty_platform_mobile_flutter/object/notification.dart';

List<Notification> getNotification() {
  List<Notification> items = <Notification>[];

  items.add(Notification(
      'assets/images/IconNotification.png',
      'Chào bạn mới ',
      'Bạn gì ơi nghỉ ngơi uống nước ăn bánh nha. Tặng bạn 50k để gọi món yêu thích. Mở liền app để nhận ngay ưu đãi này nào.',
      '05/09'));
  items.add(Notification(
      'assets/images/IconNotification.png',
      'Tặng bạn thân quý 50k',
      'Bạn gì ơi nghỉ ngơi uống nước ăn bánh nha. Tặng bạn 50k để gọi món yêu thích. Mở liền app để nhận ngay ưu đãi này nào.',
      '05/09'));
  items.add(Notification(
      'assets/images/IconNotification.png',
      'Tặng bạn thân quý 50k',
      'Bạn gì ơi nghỉ ngơi uống nước ăn bánh nha. Tặng bạn 50k để gọi món yêu thích. Mở liền app để nhận ngay ưu đãi này nào.',
      '05/09'));
  items.add(Notification(
      'assets/images/IconNotification.png',
      'Tặng bạn thân quý 50k',
      'Bạn gì ơi nghỉ ngơi uống nước ăn bánh nha. Tặng bạn 50k để gọi món yêu thích. Mở liền app để nhận ngay ưu đãi này nào.',
      '05/09'));
  items.add(Notification(
      'assets/images/IconNotification.png',
      'Tặng bạn thân quý 50k',
      'Bạn gì ơi nghỉ ngơi uống nước ăn bánh nha. Tặng bạn 50k để gọi món yêu thích. Mở liền app để nhận ngay ưu đãi này nào.',
      '05/09'));
  items.add(Notification(
      'assets/images/IconNotification.png',
      'Tặng bạn thân quý 50k',
      'Bạn gì ơi nghỉ ngơi uống nước ăn bánh nha. Tặng bạn 50k để gọi món yêu thích. Mở liền app để nhận ngay ưu đãi này nào.',
      '05/09'));

  return items;
}
