import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/variable.dart';

class QuoteDetail {
  String? chargeType;
  String? component;
  String? category;
  String? damageCode;
  String? container;
  String? inGateDate;
  String? approveDate;
  String? completeDate;
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
  double? tariffPrice;
  String? approveCode;
  String? isImgUpload;
  String? completeImgUpload;

  QuoteDetail(
      {this.chargeType,
      this.component,
      this.category,
      this.damageCode,
      this.container,
      this.inGateDate,
      this.approveDate,
      this.completeDate,
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
      this.tariffPrice,
      this.approveCode,
      this.isImgUpload,
      this.completeImgUpload});

  DataGridRow getDataGridRow_QuoteDetail() {
    return DataGridRow(cells: [
      DataGridCell(columnName: 'Charge Type', value: chargeType),
      DataGridCell(columnName: 'Component', value: component),
      DataGridCell(columnName: 'Category', value: category),
      DataGridCell(columnName: 'Damage Code', value: damageCode),
      // [4] container for image
      DataGridCell(columnName: 'Container', value: container),
      DataGridCell(columnName: 'Damege Detail', value: damageDetail),
      DataGridCell(columnName: 'Quantity', value: quantity),
      DataGridCell(columnName: 'Dimension', value: dimension),
      DataGridCell(columnName: 'Length', value: length),
      DataGridCell(columnName: 'Width', value: width),
      DataGridCell(columnName: 'Location', value: location),
      DataGridCell(columnName: 'Labor Cost', value: laborCost),
      DataGridCell(columnName: 'Mr Cost', value: mrCost),
      DataGridCell(columnName: 'Total Cost', value: totalCost),
      // [14] inGateDate for image
      DataGridCell(columnName: 'Estimate Date', value: estimateDate),
      DataGridCell(columnName: 'Payer', value: payer),
      DataGridCell(columnName: 'Status', value: approveCode),
      DataGridCell(columnName: 'Tariff Price', value: tariffPrice),
      DataGridCell(columnName: 'Image', value: isImgUpload),
    ]);
  }

  QuoteDetail.fromJson(Map<String, dynamic> json) {
    chargeType = json['chargeType'];
    component = json['component'];
    category = json['category'];
    damageCode = json['damageCode'];
    container = json['container'];
    inGateDate = json['inGateDate'];
    approveDate = json['approveDate'];
    completeDate = json['completeDate'];
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
    tariffPrice = json['tariffPrice'];
    approveCode = json['approveCode'];
    isImgUpload = json['isImgUpload'];
    completeImgUpload = json['completeImgUpload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chargeType'] = this.chargeType;
    data['component'] = this.component;
    data['category'] = this.category;
    data['damageCode'] = this.damageCode;
    data['container'] = this.container;
    data['inGateDate'] = this.inGateDate;
    data['approveDate'] = this.approveDate;
    data['completeDate'] = this.completeDate;
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
    data['tariffPrice'] = this.tariffPrice;
    data['approveCode'] = this.approveCode;
    data['isImgUpload'] = this.isImgUpload;
    data['completeImgUpload'] = this.completeImgUpload;
    return data;
  }

  Future<List<QuoteDetail>> fetchQuoteDetail({required String quoteId}) async {
    try {
      var url = '$SERVER/EQCQuote/LoadEQCQuoteDetail?EQCQuoteId=$quoteId';
      final response = await http.post(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data Quote Detail');
          List dataQuoteDetail = json.decode(body);
          return dataQuoteDetail
              .map((data) => QuoteDetail.fromJson(data))
              .toList();
        default:
          throw Exception('Error: EQC_QuoteDetail ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      throw Exception('Error: $e EQC_QuoteDetail');
    }
  }
}
