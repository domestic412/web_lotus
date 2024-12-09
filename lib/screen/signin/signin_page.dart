import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';
import 'package:web_lotus/screen/eqc/list_eqc/listEQC_page.dart';
import 'package:web_lotus/screen/eqc/list_quote/listQuote_page.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';

import 'popUpAlert/alert.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // GetRef getRef = GetRef();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/background_lotus.png'),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppbarWidget(),
            Container(
              height: 350,
              width: 400,
              margin: EdgeInsets.only(top: 160, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildAppbarImage(),
                  // _buildAppbarName(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildInputUser(),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoButton(
                    color: Colors.white70,
                    onPressed: () {
                      newSignIn(
                          inforUserController.username.value.text.toString(),
                          inforUserController.password.value.text.toString());
                    },
                    child: Text(
                      // 'sign in'.tr,
                      'Sign in',
                      style:
                          TextStyle(color: button, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  _buildInputUser() {
    // InformationNewSignInController infoSignInController =
    //     Get.put(InformationNewSignInController());
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white54),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              height: 50,
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: inforUserController.username.value,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'user name'.tr,
                    // 'User Name',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    border: InputBorder.none),
                onSubmitted: (value) {
                  newSignIn(inforUserController.username.value.text.toString(),
                      inforUserController.password.value.text.toString());
                },
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: inforUserController.password.value,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
                decoration: InputDecoration(
                    hintText: 'password'.tr,
                    // 'Password',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    border: InputBorder.none),
                onSubmitted: (value) {
                  newSignIn(inforUserController.username.value.text.toString(),
                      inforUserController.password.value.text.toString());
                },
              ),
            )
          ],
        ),
      )
    ]);
  }

  Future<void> newSignIn(String username, String password) async {
    try {
      final url = '$SERVER/NewLoginUser/login';
      Map data = {
        'username': username,
        'password': password,
      };
      var body = json.encode(data);
      if (username.isNotEmpty && password.isNotEmpty) {
        final response = await http.post(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: body);
        switch (response.statusCode) {
          case 200:
            {
              var body = response.body;
              var dataLogIn = jsonDecode(body);
              checkDataLogin(dataLogIn);
              // print(dataLogIn);
              // String shipperId = dataNewLogIn['dataTable2s'][1]['shipperName'];

              switch (box.read(is_staff_signin)) {
                case 0:
                  {
                    //update infoUser
                    List infoUser = dataLogIn['dataTable1s'];
                    String userId = infoUser[0]['shipperId'];
                    String userName = infoUser[0]['shipperName'];
                    String managingOfficeId = infoUser[0]['managingOfficeId'];

                    //update consignee
                    var consigneeList_json = dataLogIn['dataTable2s'];
                    // List consigneeList = consigneeList_json
                    //     .map((e) => DataTable2s.fromJson(e))
                    //     .toList();

                    var termList_json = dataLogIn['dataTable4s'];
                    // List termList =
                    //     termList_json.map((e) => DataTable4s.fromJson(e)).toList();

                    var commodityList_json = dataLogIn['dataTable5s'];
                    // List commodityList = commodityList_json
                    //     .map((e) => DataTable5s.fromJson(e))
                    //     .toList();
                    // print(commodityList);
                    box.write(userId_signin, userId);
                    box.write(userName_signin, userName);
                    box.write(managingOfficeId_signin, managingOfficeId);
                    box.write(consigneeList_signin, consigneeList_json);
                    // box.write(refList_signin, refList_json);
                    box.write(termList_signin, termList_json);
                    box.write(commodityList_signin, commodityList_json);

                    inforUserController.updateInfoShipperController(
                      isStaff: 0,
                      userId: box.read(userId_signin),
                      userName: box.read(userName_signin),
                      managingOfficeId: box.read(managingOfficeId_signin),
                      consigneeList: box.read(consigneeList_signin),
                      termList: box.read(termList_signin),
                    );

                    // switch (currentRouteController.route.value) {
                    //   case booking:
                    //     Get.toNamed(GetRoutes.BookingRequest);
                    //     break;
                    //   case service:
                    //     Get.toNamed(GetRoutes.Home);
                    //     break;
                    //   default:
                    //     Get.toNamed(GetRoutes.defaultRoute);
                    //     break;
                    // }
                    Get.to(() => ListQuotePage());
                    // Get.to(() => ListEQCPage());
                    print('Login Success');
                  }
                case 1:
                  {
                    String userId = dataLogIn[0]['userId'];
                    String userName = dataLogIn[0]['userName'];
                    String officeId = dataLogIn[0]['officeId'];
                    box.write(userId_signin, userId);
                    box.write(userName_signin, userName);
                    box.write(managingOfficeId_signin, officeId);

                    inforUserController.updateInfoStaffController(
                      isStaff: 1,
                      userId: box.read(userId_signin),
                      userName: box.read(userName_signin),
                      managingOfficeId: box.read(managingOfficeId_signin),
                    );

                    // switch (currentRouteController.route.value) {
                    //   // case booking:
                    //   //   Get.toNamed(GetRoutes.BookingRequest);
                    //   //   break;
                    //   case checkingCombine:
                    //     Get.toNamed(GetRoutes.Home);
                    //     break;
                    //   default:
                    //     Get.toNamed(GetRoutes.defaultRoute);
                    //     break;
                    // }
                    Get.to(() => ListQuotePage());
                    // Get.to(() => ListEQCPage());
                  }
                default:
                  LoginAlertDatabase(context);
              }
            }
          default:
            LoginAlert(context);
            throw Exception('Error - ${response.reasonPhrase}');
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid")));
        throw Exception('Error fetch Tracking');
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Login - $e');
    }
  }
}

Widget _buildAppbarImage() {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Image.asset(
      'lib/assets/images/logo_lotus.png',
      height: 100,
      width: 200,
    ),
  );
}

void checkDataLogin(dataLogin) {
  if (dataLogin is List) {
    box.write(is_staff_signin, 1);
    // print('data type list');
  } else if (dataLogin is Map<dynamic, dynamic>) {
    box.write(is_staff_signin, 0);
    // print('data type Map');
  } else {
    // print(dataLogin);
  }
}
