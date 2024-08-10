import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:web_lotus/assets/variable.dart';

class EQCQuoteList {
  String? eqcQuoteId;
  String? portDepot;
  String? quoteDate;
  String? quoteNo;
  String? quoteCcy;
  int? exRate;
  String? quoteStatus;
  String? quoteUser;
  String? approveUser;
  String? approveDate;
  bool? quoteOnline;
  bool? sendAlert;

  EQCQuoteList(
      {this.eqcQuoteId,
      this.portDepot,
      this.quoteDate,
      this.quoteNo,
      this.quoteCcy,
      this.exRate,
      this.quoteStatus,
      this.quoteUser,
      this.approveUser,
      this.approveDate,
      this.quoteOnline,
      this.sendAlert});

  EQCQuoteList.fromJson(Map<String, dynamic> json) {
    eqcQuoteId = json['eqcQuoteId'];
    portDepot = json['portDepot'];
    quoteDate = json['quoteDate'];
    quoteNo = json['quoteNo'];
    quoteCcy = json['quoteCcy'];
    exRate = json['exRate'];
    quoteStatus = json['quoteStatus'];
    quoteUser = json['quoteUser'];
    approveUser = json['approveUser'];
    approveDate = json['approveDate'];
    quoteOnline = json['quoteOnline'];
    sendAlert = json['sendAlert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eqcQuoteId'] = this.eqcQuoteId;
    data['portDepot'] = this.portDepot;
    data['quoteDate'] = this.quoteDate;
    data['quoteNo'] = this.quoteNo;
    data['quoteCcy'] = this.quoteCcy;
    data['exRate'] = this.exRate;
    data['quoteStatus'] = this.quoteStatus;
    data['quoteUser'] = this.quoteUser;
    data['approveUser'] = this.approveUser;
    data['approveDate'] = this.approveDate;
    data['quoteOnline'] = this.quoteOnline;
    data['sendAlert'] = this.sendAlert;
    return data;
  }

  Future<List<EQCQuoteList>> fetchQuoteList(
      String fromDate, String toDate) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
      var url =
          '$SERVER/EQCQuote/LoadEQCQuote?fromDate=$fromDate&toDate=$toDate';
      final response = await http.post(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });
      switch (response.statusCode) {
        case 200:
          EasyLoading.dismiss();
          var body = response.body;
          print('Data EQC Quote List');
          List dataQuoteList = json.decode(body);
          return dataQuoteList
              .map((data) => EQCQuoteList.fromJson(data))
              .toList();
        default:
          EasyLoading.dismiss();
          throw Exception('Error: EQC_QuoteList ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      EasyLoading.dismiss();
      throw Exception('Error: $e EQC_QuoteList');
    }
  }
}
