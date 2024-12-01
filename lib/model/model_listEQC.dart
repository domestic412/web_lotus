import 'dart:convert';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:http/http.dart' as http;

class ListEQC123 {
  String? quoteNo;
  String? quoteCcy;
  String? size;
  String? depot;
  String? container;
  double? totalCost;
  String? inGateDate;
  String? approveDate;
  String? completeDate;
  String? estimateDate;
  String? approveCode;
  double? tariffPrice;
  String? isImgUpload;
  String? completeImgUpload;
  List<Details>? details;

  Future<List<ListEQC123>> fetchListEQC(
      {required String fromDate,
      required String toDate,
      required String userId}) async {
    try {
      var url =
          '$SERVER/EQCQuote/LoadEQCQDO?fromDate=$fromDate&toDate=$toDate&UserId=$userId';
      final response = await http.post(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data EQC Quote Detail');
          List dataListEQC = json.decode(body);
          return dataListEQC.map((data) => ListEQC123.fromJson(data)).toList();
        default:
          throw Exception('Error: EQC_ListEQC ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      throw Exception('Error: $e EQC_ListEQC');
    }
  }

  DataGridRow getDataGridRow_ListEQC123() {
    return DataGridRow(cells: [
      DataGridCell(columnName: 'Depot', value: depot),
      // [1] container for image
      DataGridCell(columnName: 'Container', value: container),
      // [2] inGateDate for image
      DataGridCell(columnName: 'inGateDate', value: inGateDate),
      // [3] isImgUpload
      DataGridCell(columnName: 'isImgUpload', value: isImgUpload),
      // [4] completeImgUpload
      DataGridCell(columnName: 'completeImgUpload', value: completeImgUpload),
      // [5] details
      DataGridCell(columnName: 'details', value: details),
      DataGridCell(columnName: 'Size', value: size),
      DataGridCell(columnName: 'Ccy', value: quoteCcy),
      DataGridCell(columnName: 'Total Cost', value: totalCost),
      DataGridCell(columnName: 'Tarrif', value: tariffPrice),
      DataGridCell(columnName: 'Status', value: approveCode),
      DataGridCell(columnName: 'Request', value: estimateDate),
      DataGridCell(columnName: 'Approval', value: approveDate),
      DataGridCell(columnName: 'Complete', value: completeDate),
      const DataGridCell(columnName: 'Remarks', value: ''),
      DataGridCell(columnName: 'Quote No', value: quoteNo),
    ]);
  }

  ListEQC123(
      {this.quoteNo,
      this.quoteCcy,
      this.size,
      this.depot,
      this.container,
      this.totalCost,
      this.inGateDate,
      this.approveDate,
      this.completeDate,
      this.estimateDate,
      this.approveCode,
      this.tariffPrice,
      this.isImgUpload,
      this.completeImgUpload,
      this.details});

  ListEQC123.fromJson(Map<String, dynamic> json) {
    quoteNo = json['quoteNo'];
    quoteCcy = json['quoteCcy'];
    size = json['size'];
    depot = json['depot'];
    container = json['container'];
    totalCost = json['totalCost'];
    inGateDate = json['inGateDate'];
    approveDate = json['approveDate'];
    completeDate = json['completeDate'];
    estimateDate = json['estimateDate'];
    approveCode = json['approveCode'];
    tariffPrice = json['tariffPrice'];
    isImgUpload = json['isImgUpload'];
    completeImgUpload = json['completeImgUpload'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quoteNo'] = quoteNo;
    data['quoteCcy'] = quoteCcy;
    data['size'] = size;
    data['depot'] = depot;
    data['container'] = container;
    data['totalCost'] = totalCost;
    data['inGateDate'] = inGateDate;
    data['approveDate'] = approveDate;
    data['completeDate'] = completeDate;
    data['estimateDate'] = estimateDate;
    data['approveCode'] = approveCode;
    data['tariffPrice'] = tariffPrice;
    data['isImgUpload'] = isImgUpload;
    data['completeImgUpload'] = completeImgUpload;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? quoteNo;
  String? quoteCcy;
  String? chargeType;
  String? component;
  String? category;
  String? damageCode;
  String? container;
  String? inGateDate;
  String? approveDate;
  String? size;
  String? depot;
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

  Details(
      {quoteNo,
      quoteCcy,
      chargeType,
      component,
      category,
      damageCode,
      container,
      inGateDate,
      approveDate,
      size,
      depot,
      completeDate,
      damageDetail,
      quantity,
      dimension,
      length,
      width,
      location,
      laborCost,
      mrCost,
      totalCost,
      estimateDate,
      payer,
      tariffPrice,
      approveCode,
      isImgUpload,
      completeImgUpload});

  Details.fromJson(Map<String, dynamic> json) {
    quoteNo = json['quoteNo'];
    quoteCcy = json['quoteCcy'];
    chargeType = json['chargeType'];
    component = json['component'];
    category = json['category'];
    damageCode = json['damageCode'];
    container = json['container'];
    inGateDate = json['inGateDate'];
    approveDate = json['approveDate'];
    size = json['size'];
    depot = json['depot'];
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
    data['quoteNo'] = quoteNo;
    data['quoteCcy'] = quoteCcy;
    data['chargeType'] = chargeType;
    data['component'] = component;
    data['category'] = category;
    data['damageCode'] = damageCode;
    data['container'] = container;
    data['inGateDate'] = inGateDate;
    data['approveDate'] = approveDate;
    data['size'] = size;
    data['depot'] = depot;
    data['completeDate'] = completeDate;
    data['damageDetail'] = damageDetail;
    data['quantity'] = quantity;
    data['dimension'] = dimension;
    data['length'] = length;
    data['width'] = width;
    data['location'] = location;
    data['laborCost'] = laborCost;
    data['mrCost'] = mrCost;
    data['totalCost'] = totalCost;
    data['estimateDate'] = estimateDate;
    data['payer'] = payer;
    data['tariffPrice'] = tariffPrice;
    data['approveCode'] = approveCode;
    data['isImgUpload'] = isImgUpload;
    data['completeImgUpload'] = completeImgUpload;
    return data;
  }

  DataGridRow getDataGridRow_DetailsEQC() {
    return DataGridRow(cells: [
      DataGridCell(columnName: 'Charge', value: chargeType),
      DataGridCell(columnName: 'Container', value: container),
      DataGridCell(columnName: 'inGateDate', value: inGateDate),
      DataGridCell(columnName: 'Component', value: component),
      DataGridCell(columnName: 'Damage Code', value: damageCode),
      DataGridCell(columnName: 'Damege Detail', value: damageDetail),
      DataGridCell(columnName: 'Category', value: category),
      DataGridCell(columnName: 'Quantity', value: quantity),
      DataGridCell(columnName: 'Dimension', value: dimension),
      DataGridCell(columnName: 'Length', value: length),
      DataGridCell(columnName: 'Width', value: width),
      DataGridCell(columnName: 'Location', value: location),
      DataGridCell(columnName: 'Labor Cost', value: laborCost),
      DataGridCell(columnName: 'Mr Cost', value: mrCost),
      DataGridCell(columnName: 'Total Cost', value: totalCost),
      DataGridCell(columnName: 'Tariff', value: tariffPrice),
      DataGridCell(columnName: 'Payer', value: payer),
      DataGridCell(columnName: 'Status', value: approveCode),
      DataGridCell(columnName: 'Image', value: isImgUpload),
    ]);
  }
}
