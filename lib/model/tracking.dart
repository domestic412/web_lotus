class ContainerTracking {
  String? vessel;
  String? voyage;
  String? logStatus;
  String? shipperName;
  String? consigneeName;
  String? billNumber;
  String? status;
  String? shipper;
  String? consignee;
  String? logDate;
  String? depot;
  String? endDate;
  String? bookingNo;
  String? container;
  String? size;
  String? remark;
  String? operator;

  ContainerTracking(
      {this.vessel,
      this.voyage,
      this.logStatus,
      this.shipperName,
      this.consigneeName,
      this.billNumber,
      this.status,
      this.shipper,
      this.consignee,
      this.logDate,
      this.depot,
      this.endDate,
      this.bookingNo,
      this.container,
      this.size,
      this.remark,
      this.operator});

  factory ContainerTracking.fromJson(Map<String, dynamic> json) {
    return ContainerTracking(
    vessel: json['vessel'],
    voyage: json['voyage'],
    logStatus: json['logStatus'],
    shipperName: json['shipperName'],
    consigneeName: json['consigneeName'],
    billNumber: json['billNumber'],
    status: json['status'],
    shipper: json['shipper'],
    consignee: json['consignee'],
    logDate: json['logDate'],
    depot: json['depot'],
    endDate: json['endDate'],
    bookingNo: json['bookingNo'],
    container: json['container'],
    size: json['size'],
    remark: json['remark'],
    operator: json['operator']
    );
  }

  // static Future<ContainerTrucking> fetchContainerTrucking(String cntr, String bk) async {
  //   var url = '$SERVER_NAME/TrackingContainer?CntrNo=$cntr&BookingNo=$bk';
  //   var data = {
  //     'container': cntr,
  //     'bookingNo': bk,
  //   };
  //   var body = json.encode(data);
  //   if (cntr.isNotEmpty && bk.isNotEmpty) {
  //     final response = await http.post(Uri.parse(url),
  //         headers: {"Content-Type": "application/json"}, 
  //         body: body);
  //     if (response.statusCode == 200) {
  //       var body = response.body;
  //       final dataCntrTrucking = jsonDecode(body);
  //       print(dataCntrTrucking);
  //       return ContainerTrucking.fromJson(dataCntrTrucking);
  //       } else {
  //         throw Exception('Error');
  //       }
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

}