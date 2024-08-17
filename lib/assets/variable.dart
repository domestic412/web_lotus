import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

double deviceHeight(context) => MediaQuery.sizeOf(context).height;
double deviceWidth(context) => MediaQuery.sizeOf(context).width;

const SERVER = 'http://222.252.166.214:6505';

//format date
changeDatetoShow({required DateTime date}) {
  return DateFormat('dd/MM/yyyy').format(date);
}

changeDatetoSend({required DateTime date}) {
  return DateFormat('MM/dd/yyyy').format(date);
}

String eqcQuoteId_new = '00000000-0000-0000-0000-000000000000';

double? fullSizeHeight;
double? fullSizeWidth;

//save info login
var box = GetStorage();
String is_staff_signin = 'IsStaff';
String maNV_signin = 'maNV';
String author_signin = 'author';
String code_signin = 'code';
String shipperId_signin = 'shipperid';
String shipperName_signin = 'shippername';
String managingOfficeId_signin = 'managingOfficeId';
String consigneeList_signin = 'consigneeList';
String refList_signin_json = 'refList';
String termList_signin = 'termList';
String commodityList_signin = 'commodityList';
