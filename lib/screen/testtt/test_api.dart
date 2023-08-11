import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/test_api.dart';

class test_api extends StatefulWidget {
  const test_api({super.key});

  @override
  State<test_api> createState() => _test_apiState();
}

class _test_apiState extends State<test_api> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                postData();
              },
              child: Container(
                color: Colors.amber,
                height: 50,
                width: 100,
                  ),
            ),
          ],
        )),
    );
  }

  
  Future<List<TestAPI>> postData() async {
    var response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'), 
      body: {
        "id": "1", 
        "name": "Blue",
        "email": "someone@gmail.com"
        });
        print(response.body);
        return postData();

}
}