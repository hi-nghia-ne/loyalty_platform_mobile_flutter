import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loyalty_platform_mobile_flutter/object/promotion.dart';

class PromotionNewsDetailScreen extends StatelessWidget {
  const PromotionNewsDetailScreen({Key? key, required this.items})
      : super(key: key);
  final Promotion items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * .8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * .6,
                        child: Image.asset(
                          items.thumbNail,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        width: 40,
                        top: 10,
                        left: 10,
                        child: RawMaterialButton(
                            shape: const CircleBorder(),
                            fillColor: Colors.black.withOpacity(0.25),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          items.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        children: const [
                          Text(
                            'Nội Dung',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(items.description,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.clip,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}