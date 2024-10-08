import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/screen/quote/quote_page.dart';
import 'package:web_lotus/screen/tracking/tracking_page.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/footer.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: WidgetAppBar(),
      backgroundColor: MyColor.backgroundColor,
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppbarWidget(),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.to(() => TrackingPage());
                        },
                        child: Text('Tracking')),
                    SizedBox(width: 30),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(() => QuoteListPage());
                        },
                        child: Text('Quote')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
