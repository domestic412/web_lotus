import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class InitEQCQuote {
  List<ChargeTypeQuotes>? chargeTypeQuotes;
  List<ComponentQuotes>? componentQuotes;
  List<CategoryQuotes>? categoryQuotes;
  List<ErrorQuotes>? errorQuotes;
  List<CurrencyQuotes>? currencyQuotes;
  InputQuote? inputQuote;
  List<PostQuotes>? postQuotes;
  List<PostQuoteDetailModels>? postQuoteDetailModels;

  InitEQCQuote(
      {this.chargeTypeQuotes,
      this.componentQuotes,
      this.categoryQuotes,
      this.errorQuotes,
      this.currencyQuotes,
      this.inputQuote,
      this.postQuotes,
      this.postQuoteDetailModels});

  InitEQCQuote.fromJson(Map<String, dynamic> json) {
    if (json['chargeTypeQuotes'] != null) {
      chargeTypeQuotes = <ChargeTypeQuotes>[];
      json['chargeTypeQuotes'].forEach((v) {
        chargeTypeQuotes!.add(new ChargeTypeQuotes.fromJson(v));
      });
    }
    if (json['componentQuotes'] != null) {
      componentQuotes = <ComponentQuotes>[];
      json['componentQuotes'].forEach((v) {
        componentQuotes!.add(new ComponentQuotes.fromJson(v));
      });
    }
    if (json['categoryQuotes'] != null) {
      categoryQuotes = <CategoryQuotes>[];
      json['categoryQuotes'].forEach((v) {
        categoryQuotes!.add(new CategoryQuotes.fromJson(v));
      });
    }
    if (json['errorQuotes'] != null) {
      errorQuotes = <ErrorQuotes>[];
      json['errorQuotes'].forEach((v) {
        errorQuotes!.add(new ErrorQuotes.fromJson(v));
      });
    }
    if (json['currencyQuotes'] != null) {
      currencyQuotes = <CurrencyQuotes>[];
      json['currencyQuotes'].forEach((v) {
        currencyQuotes!.add(new CurrencyQuotes.fromJson(v));
      });
    }
    inputQuote = json['inputQuote'] != null
        ? new InputQuote.fromJson(json['inputQuote'])
        : null;
    if (json['postQuotes'] != null) {
      postQuotes = <PostQuotes>[];
      json['postQuotes'].forEach((v) {
        postQuotes!.add(new PostQuotes.fromJson(v));
      });
    }
    if (json['postQuoteDetailModels'] != null) {
      postQuoteDetailModels = <PostQuoteDetailModels>[];
      json['postQuoteDetailModels'].forEach((v) {
        postQuoteDetailModels!.add(new PostQuoteDetailModels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chargeTypeQuotes != null) {
      data['chargeTypeQuotes'] =
          this.chargeTypeQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.componentQuotes != null) {
      data['componentQuotes'] =
          this.componentQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.categoryQuotes != null) {
      data['categoryQuotes'] =
          this.categoryQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.errorQuotes != null) {
      data['errorQuotes'] = this.errorQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.currencyQuotes != null) {
      data['currencyQuotes'] =
          this.currencyQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.inputQuote != null) {
      data['inputQuote'] = this.inputQuote!.toJson();
    }
    if (this.postQuotes != null) {
      data['postQuotes'] = this.postQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.postQuoteDetailModels != null) {
      data['postQuoteDetailModels'] =
          this.postQuoteDetailModels!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<InitEQCQuote> fetchInitQuote(String eqcQuoteId) async {
    try {
      var url = '$SERVER/EQCQuote/InitEQCQuote';
      Map<String, String> data = {'eqcQuoteId': eqcQuoteId};
      var body = json.encode(data);
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: body);
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data init EQC Quote');
          var dataInitQuote = json.decode(body);
          //save eqcQuoteId when create or edit Quote
          quoteController.eqcQuoteId.value =
              dataInitQuote['inputQuoteModels'][0]['eqcQuoteId'];
          quoteController.quoteNo.value =
              dataInitQuote['inputQuoteModels'][0]['quoteNo'];
          print(quoteController.eqcQuoteId.value);
          return InitEQCQuote.fromJson(dataInitQuote);
        default:
          throw Exception('Error: Init EQC Quote ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      throw Exception('Error: $e Init EQC Quote');
    }
  }
}

class ChargeTypeQuotes {
  String? chargeTypeId;
  String? chargeTypeCode;
  String? chargeType;

  ChargeTypeQuotes({this.chargeTypeId, this.chargeTypeCode, this.chargeType});

  ChargeTypeQuotes.fromJson(Map<String, dynamic> json) {
    chargeTypeId = json['chargeTypeId'];
    chargeTypeCode = json['chargeTypeCode'];
    chargeType = json['chargeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chargeTypeId'] = this.chargeTypeId;
    data['chargeTypeCode'] = this.chargeTypeCode;
    data['chargeType'] = this.chargeType;
    return data;
  }
}

class ComponentQuotes {
  String? componentId;
  String? componentCode;
  String? component;

  ComponentQuotes({this.componentId, this.componentCode, this.component});

  ComponentQuotes.fromJson(Map<String, dynamic> json) {
    componentId = json['componentId'];
    componentCode = json['componentCode'];
    component = json['component'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['componentId'] = this.componentId;
    data['componentCode'] = this.componentCode;
    data['component'] = this.component;
    return data;
  }
}

class CategoryQuotes {
  String? categoryId;
  String? categoryCode;
  String? category;

  CategoryQuotes({this.categoryId, this.categoryCode, this.category});

  CategoryQuotes.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryCode = json['categoryCode'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryCode'] = this.categoryCode;
    data['category'] = this.category;
    return data;
  }
}

class ErrorQuotes {
  String? errorId;
  String? errorCode;
  String? error;

  ErrorQuotes({this.errorId, this.errorCode, this.error});

  ErrorQuotes.fromJson(Map<String, dynamic> json) {
    errorId = json['errorId'];
    errorCode = json['errorCode'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorId'] = this.errorId;
    data['errorCode'] = this.errorCode;
    data['error'] = this.error;
    return data;
  }
}

class CurrencyQuotes {
  String? currency;
  String? currencyName;

  CurrencyQuotes({this.currency, this.currencyName});

  CurrencyQuotes.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    currencyName = json['currencyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['currencyName'] = this.currencyName;
    return data;
  }
}

class InputQuote {
  String? eqcQuoteId;

  InputQuote({this.eqcQuoteId});

  InputQuote.fromJson(Map<String, dynamic> json) {
    eqcQuoteId = json['eqcQuoteId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eqcQuoteId'] = this.eqcQuoteId;
    return data;
  }
}

class PostQuotes {
  String? eqcQuoteId;
  String? portDepotId;
  String? code;
  String? quoteNo;
  String? quoteDate;
  String? quoteCcy;
  int? exRate;

  PostQuotes(
      {this.eqcQuoteId,
      this.portDepotId,
      this.code,
      this.quoteNo,
      this.quoteDate,
      this.quoteCcy,
      this.exRate});

  PostQuotes.fromJson(Map<String, dynamic> json) {
    eqcQuoteId = json['eqcQuoteId'];
    portDepotId = json['portDepotId'];
    code = json['code'];
    quoteNo = json['quoteNo'];
    quoteDate = json['quoteDate'];
    quoteCcy = json['quoteCcy'];
    exRate = json['exRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eqcQuoteId'] = this.eqcQuoteId;
    data['portDepotId'] = this.portDepotId;
    data['code'] = this.code;
    data['quoteNo'] = this.quoteNo;
    data['quoteDate'] = this.quoteDate;
    data['quoteCcy'] = this.quoteCcy;
    data['exRate'] = this.exRate;
    return data;
  }
}

class PostQuoteDetailModels {
  String? quoteDetailId;
  String? chargeTypeId;
  String? componentId;
  String? categoryId;
  String? errorId;
  String? container;
  String? inGateDate;
  String? damageDetail;
  int? quantity;
  String? dimension;
  int? length;
  int? width;
  String? location;
  int? laborCost;
  int? mrCost;
  int? totalCost;
  String? estimateDate;
  Null? remark;

  PostQuoteDetailModels(
      {this.quoteDetailId,
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
      this.remark});

  PostQuoteDetailModels.fromJson(Map<String, dynamic> json) {
    quoteDetailId = json['quoteDetailId'];
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
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quoteDetailId'] = this.quoteDetailId;
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
    data['remark'] = this.remark;
    return data;
  }
}
