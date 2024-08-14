import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_input_quote_detail.dart';

Future<void> PostNewQuote(
    {required String eqcQuoteId,
    required String portDepotId,
    required String quoteNo,
    required String quoteCcy,
    required String exRate,
    required String quoteUser,
    required String edit}) async {
  try {
    Map<String, dynamic> data = {
      "eqcQuoteId": eqcQuoteId,
      "portDepotId": portDepotId,
      "quoteNo": quoteNo,
      "quoteCcy": quoteCcy,
      "exRate": exRate,
      "quoteUser": quoteUser,
      "edit": "I",
    };
    var body = json.encode(data);
    // print(body);
    final response = await http.post(Uri.parse('$SERVER/EQCQuote/InputQuote'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
        body: body);
    switch (response.statusCode) {
      case 200:
        print('Post quote success');
        PostNewQuoteDetail(
            listQuoteDetail: quoteController.listInputQuoteDetail);
      default:
        print('Error post quote: ${response.statusCode}');
    }
  } catch (e) {
    print('Error post quote : $e');
  }
}

Future<void> PostNewQuoteDetail(
    {required List<InputQuoteDetail> listQuoteDetail}) async {
  try {
    var body = json.encode(listQuoteDetail);
    // print(body);
    final response =
        await http.post(Uri.parse('$SERVER/EQCQuote/InputQuoteDetail'),
            headers: {
              "Access-Control-Allow-Origin": "*",
              "Content-Type": "application/json",
            },
            body: body);
    switch (response.statusCode) {
      case 200:
        // controller.selectWidget.value = quoteList;
        print('Post quote detail success');
      default:
        print('Error post quote detail: ${response.statusCode}');
    }
  } catch (e) {
    print('Error post quote detail: $e');
  }
}
