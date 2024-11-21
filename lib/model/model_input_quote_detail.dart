import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class InputQuoteDetail {
  String? eqcQuoteId;
  String? chargeTypeId;
  String? componentId;
  String? categoryId;
  String? errorId;
  String? container;
  String? inGateDate;
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
  bool? isImgUpload;
  String? edit;
  // String? approveCode;
  // int? payer;

  InputQuoteDetail({
    this.eqcQuoteId,
    this.chargeTypeId,
    this.componentId,
    this.categoryId,
    this.errorId,
    this.container,
    this.inGateDate,
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
    this.isImgUpload,
    this.edit,
    // this.approveCode,
    // this.payer,
  });

  DataGridRow getDataGridRow_InputQuoteDetail(int seq) {
    return DataGridRow(cells: [
      DataGridCell(columnName: 'Seq', value: seq),
      DataGridCell(columnName: 'eqcQuoteId', value: eqcQuoteId),
      DataGridCell(columnName: 'Charge Type', value: chargeTypeId),
      DataGridCell(columnName: 'Container', value: container),
      DataGridCell(columnName: 'Gate In Date', value: inGateDate),
      DataGridCell(columnName: 'Component', value: componentId),
      DataGridCell(columnName: 'Damege Detail', value: damageDetail),
      DataGridCell(columnName: 'Damage Code', value: errorId),
      DataGridCell(columnName: 'Quantity', value: quantity),
      DataGridCell(columnName: 'Dimension', value: dimension),
      DataGridCell(columnName: 'Length', value: length),
      DataGridCell(columnName: 'Width', value: width),
      DataGridCell(columnName: 'Location', value: location),
      DataGridCell(columnName: 'Category', value: categoryId),
      DataGridCell(columnName: 'Labor Cost', value: laborCost),
      DataGridCell(columnName: 'Mr Cost', value: mrCost),
      DataGridCell(columnName: 'Total Cost', value: totalCost),
      DataGridCell(columnName: 'Image', value: isImgUpload),
    ]);
  }

  InputQuoteDetail.fromJson(Map<String, dynamic> json) {
    eqcQuoteId = json['eqcQuoteId'];
    chargeTypeId = json['chargeTypeId'];
    componentId = json['componentId'];
    categoryId = json['categoryId'];
    errorId = json['errorId'];
    container = json['container'];
    inGateDate = json['inGateDate'];
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
    isImgUpload = json['isImgUpload'];
    edit = json['edit'];
    // approveCode = json['approveCode'];
    // payer = json['payer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eqcQuoteId'] = this.eqcQuoteId;
    data['chargeTypeId'] = this.chargeTypeId;
    data['componentId'] = this.componentId;
    data['categoryId'] = this.categoryId;
    data['errorId'] = this.errorId;
    data['container'] = this.container;
    data['inGateDate'] = this.inGateDate;
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
    data['isImgUpload'] = this.isImgUpload;
    data['edit'] = this.edit;
    // data['approveCode'] = this.approveCode;
    // data['payer'] = this.payer;
    return data;
  }
}
