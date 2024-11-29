import 'package:flutter/material.dart';
import 'package:get/get.dart';

// final inforController = Get.put(InformationSignInController());
final InformationSignInController inforUserController =
    Get.put(InformationSignInController());

class InformationSignInController extends GetxController {
  var isStaff = 0.obs;
  //old
  // var user = TextEditingController().obs;
  // var pass = TextEditingController().obs;
  // var maNV = ''.obs;
  // shipper name
  // var tenNV = ''.obs;
  // var author = ''.obs;
  // var code = ''.obs;

  //new     information shipper
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;
  var userId = ''.obs;
  var userName = ''.obs;
  var managingOfficeId = ''.obs;

  //new     info consignee, term
  var consigneeList = [].obs;
  var termList = [].obs;

  updateInfoStaffController({
    @required isStaff,
    @required userId,
    @required userName,
    @required managingOfficeId,
  }) {
    this.isStaff.value = isStaff;
    this.userId.value = userId;
    this.userName.value = userName;
    this.managingOfficeId.value = managingOfficeId;
  }

  updateInfoShipperController({
    @required isStaff,
    @required userId,
    @required userName,
    @required managingOfficeId,
    @required consigneeList,
    @required termList,
  }) {
    this.isStaff.value = isStaff;
    this.userId.value = userId;
    this.userName.value = userName;
    this.managingOfficeId.value = managingOfficeId;
    this.consigneeList.value = consigneeList;
    this.termList.value = termList;
  }

  resetInfoController() {
    username.value.clear();
    password.value.clear();
    userId = ''.obs;
    userName = ''.obs;
    managingOfficeId = ''.obs;
    consigneeList = [].obs;
    termList = [].obs;
  }
}
