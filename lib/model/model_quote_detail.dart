import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_lotus/assets/variable.dart';

class EQCQuoteDetail {
  String? chargeType;
  String? component;
  String? category;
  String? damageCode;
  String? container;
  String? damageDetail;
  double? quantity;
  String? dimension;
  double? length;
  double? width;
  String? location;
  double? laborCost;
  double? mrCost;
  double? totalCost;
  String? estimateDate;
  String? payer;
  String? approveCode;
  String? isImgUpload;

  EQCQuoteDetail(
      {this.chargeType,
      this.component,
      this.category,
      this.damageCode,
      this.container,
      this.damageDetail,
      this.quantity,
      this.dimension,
      this.length,
      this.width,
      this.location,
      this.laborCost,
      this.mrCost,
      this.totalCost,
      this.estimateDate,
      this.payer,
      this.approveCode,
      this.isImgUpload});

  EQCQuoteDetail.fromJson(Map<String, dynamic> json) {
    chargeType = json['chargeType'];
    component = json['component'];
    category = json['category'];
    damageCode = json['damageCode'];
    container = json['container'];
    damageDetail = json['damageDetail'];
    quantity = json['quantity'];
    dimension = json['dimension'];
    length = json['length'];
    width = json['width'];
    location = json['location'];
    laborCost = json['laborCost'];
    mrCost = json['mrCost'];
    totalCost = json['totalCost'];
    estimateDate = json['estimateDate'];
    payer = json['payer'];
    approveCode = json['approveCode'];
    isImgUpload = json['isImgUpload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chargeType'] = this.chargeType;
    data['component'] = this.component;
    data['category'] = this.category;
    data['damageCode'] = this.damageCode;
    data['container'] = this.container;
    data['damageDetail'] = this.damageDetail;
    data['quantity'] = this.quantity;
    data['dimension'] = this.dimension;
    data['length'] = this.length;
    data['width'] = this.width;
    data['location'] = this.location;
    data['laborCost'] = this.laborCost;
    data['mrCost'] = this.mrCost;
    data['totalCost'] = this.totalCost;
    data['estimateDate'] = this.estimateDate;
    data['payer'] = this.payer;
    data['approveCode'] = this.approveCode;
    data['isImgUpload'] = this.isImgUpload;
    return data;
  }

  Future<List<EQCQuoteDetail>> fetchQuoteDetails(String quoteId) async {
    try {
      var url = '$SERVER/EQCQuote/LoadEQCQuoteDetail?EQCQuoteId=$quoteId';
      final response = await http.post(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data EQC Quote Detail');
          List dataQuoteList = json.decode(body);
          return dataQuoteList
              .map((data) => EQCQuoteDetail.fromJson(data))
              .toList();
        default:
          throw Exception('Error: EQC_QuoteList ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      throw Exception('Error: $e EQC_QuoteList');
    }
  }

  // Future<void> downloadImageQuote() async {
  //   String ftpAddress="ftpcms.haiants.vn";
  //   String username="MLA";
  //   String password="Haian@2024";
  //   int port=2124;
  //   String remotePathImage="/MLASHIPPING/HACT/2024/07/24/BEAU5406448/BEAU5406448_IMG_20231229_161315.jpg";
  //   FTPConnect ftpConnect = FTPConnect(ftpAddress,
  //   user: username,
  //   pass: password,
  //   port: port,
  //   showLog: true);
  //   try {
  //     await ftpConnect.connect();
  //     // await ftpConnect.downloadFile(remotePathImage, File('abc.jpg'));
  //     // await ftpConnect.disconnect();
  //   } catch (e) {
  //     debugPrint('Error download Image Quote: ' + e.toString());
  //   }
  // }
}
