import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/screen/tracking/tracking_page.dart';

import 'model/model_init_quote.dart';
import 'resources/localization_service.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    fullSizeHeight = deviceHeight(context);
    fullSizeWidth = deviceWidth(context);
    InitEQCQuote().fetchInitQuote(eqcQuoteId_new);
    return GetMaterialApp(
      title: 'Lotus Link',
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: const TrackingPage(),
      builder: EasyLoading.init(),
    );
  }
}
