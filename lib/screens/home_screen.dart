// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_platform_mobile_flutter/datas/promotion_news_json.dart';
import 'package:loyalty_platform_mobile_flutter/datas/promotion_point_json.dart';
import 'package:loyalty_platform_mobile_flutter/screens/promotion_news_detail_screen.dart';
import 'package:loyalty_platform_mobile_flutter/screens/promotion_point_voucher_detail_screen.dart';
import 'package:loyalty_platform_mobile_flutter/widgets/custom_promotion_news.dart';

import '../widgets/custom_functionbar.dart';
import '../widgets/custom_promotion_point.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final name = user?.displayName;
final avatarUrl = user?.photoURL;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Row(
                children: [
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(avatarUrl!),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.ltr,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          name!,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.purple[800],
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        width: 125,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Thành viên bạc ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 44, 33, 58),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                      width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.purple,
                            Color.fromARGB(255, 222, 159, 233),
                          ]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(17)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(10, 10),
                              blurRadius: 20,
                              color: const Color.fromARGB(255, 222, 159, 233)
                                  .withOpacity(0.3),
                            )
                          ]),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 17,
                          ),
                          const Text(
                            "2000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(left: 8, top: 4, bottom: 2),
                              child: Text(
                                'P',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: CustomFunctionBar(),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  Text(
                    "Ưu đãi cho bạn",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple[800],
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Row(
                  children:
                      List.generate(getPromotionPointVoucher().length, (index) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CustomPromotionPoint(
                          thumbNail:
                              getPromotionPointVoucher()[index].thumbNail,
                          title: getPromotionPointVoucher()[index].title,
                          duration: getPromotionPointVoucher()[index].duration,
                          point: getPromotionPointVoucher()[index].point,
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            builder: (context) =>
                                PromotionPointVoucherDetailScreen(
                                    items: getPromotionPointVoucher()[index]));
                      },
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  Text(
                    "Xem gì hôm nay",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple[800],
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(getPromotion().length, (index) {
                return GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: CustomPromotionNew(
                      thumbNail: getPromotion()[index].thumbNail,
                      title: getPromotion()[index].title,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PromotionNewsDetailScreen(
                              items: getPromotion()[index]),
                        ));
                  },
                );
              }),
            )
          ],
        ),
      ),
    ));
  }
}
