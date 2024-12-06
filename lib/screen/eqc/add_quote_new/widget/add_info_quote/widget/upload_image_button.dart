import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/screen/eqc/widget/img/upload_image_zip.dart';

class UploadImageButton extends StatelessWidget {
  UploadImageButton(this.refresh);
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
          onPressed: () {
            SelectFileZip(refresh);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            minimumSize: Size(70, 35),
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
          child: Text(
            'Upload Image (.zip)',
            style: style11_white,
          )),
    );
  }
}
