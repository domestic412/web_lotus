class InputQuote {
  String? eqcQuoteId;
  String? portDepotId;
  String? quoteNo;
  String? quoteStatus;
  String? quoteCcy;
  String? exRate;
  String? quoteUser;
  String? edit;

  InputQuote(
      {this.eqcQuoteId,
      this.portDepotId,
      this.quoteNo,
      this.quoteStatus,
      this.quoteCcy,
      this.exRate,
      this.quoteUser,
      this.edit});

  InputQuote.fromJson(Map<String, dynamic> json) {
    eqcQuoteId = json['eqcQuoteId'];
    portDepotId = json['portDepotId'];
    quoteNo = json['quoteNo'];
    quoteStatus = json['quoteStatus'];
    quoteCcy = json['quoteCcy'];
    exRate = json['exRate'];
    quoteUser = json['quoteUser'];
    edit = json['edit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eqcQuoteId'] = this.eqcQuoteId;
    data['portDepotId'] = this.portDepotId;
    data['quoteNo'] = this.quoteNo;
    data['quoteStatus'] = this.quoteStatus;
    data['quoteCcy'] = this.quoteCcy;
    data['exRate'] = this.exRate;
    data['quoteUser'] = this.quoteUser;
    data['edit'] = this.edit;
    return data;
  }
}
