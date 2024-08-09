class InputQuoteDetail {
  String? eqcQuoteId;
  String? chargeTypeId;
  String? componentId;
  String? categoryId;
  String? errorId;
  String? container;
  String? inGateDate;
  String? damageDetail;
  int? quantity;
  String? dimension;
  double? length;
  double? width;
  String? location;
  double? laborCost;
  double? mrCost;
  double? totalCost;
  String? estimateDate;
  String? edit;
  // String? approveCode;
  // int? payer;

  InputQuoteDetail(
      {this.eqcQuoteId,
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
      this.edit,
      // this.approveCode,
      // this.payer,
      });

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
    data['edit'] = this.edit;
    // data['approveCode'] = this.approveCode;
    // data['payer'] = this.payer;
    return data;
  }


}
