import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:universal_html/html.dart' as html;

Future<void> SelectFileZip() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['zip'],
      );
      final url = '$SERVER/EQCQuote/UploadFileZip';
      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        if (file.bytes != null) {
          EasyLoading.show(
            status: 'Loading...',
            maskType: EasyLoadingMaskType.black,
            dismissOnTap: true,
          );
          // Create a Blob from file data
          final blob = html.Blob([file.bytes!]);
          // Create FormData and append the Blob as a file
          final formData = html.FormData();
          formData.appendBlob('uploadfile', blob, file.name);

          // Send the FormData using XMLHttpRequest
          final request = html.HttpRequest();
          request.open('POST', url, async: true);

          // Set up event listeners
          request.onLoadEnd.listen((event) {
            if (request.status == 200) {
              print("File uploaded successfully");
            } else {
              print("Failed to upload file: ${request.status}");
            }
          });

          request.send(formData);
          request.onLoad.listen((html.ProgressEvent event) {
            switch (request.status) {
              case 200:
                var response = request.responseText;
                print(response);
                EasyLoading.showSuccess('Upload Success');
                // quoteController.listInputQuoteDetail_show[i].isImgUpload = true;
                // quoteController.listInputQuoteDetail[i].isImgUpload = true;
                // setState(() {
                //   // print(quoteController.listInputQuoteDetail);
                // });
                print('Success send Image quote');
              // if (Get.isDialogOpen == true) {
              //   Get.back();
              // }
              default:
                EasyLoading.showError('Upload Image Fail');
            }
          });
        } else {
          EasyLoading.showError('Error File Zip');
        }
      } else {
        // User canceled the picker
        // EasyLoading.showError('No file select');
      }
    } on Exception catch (e) {
      EasyLoading.showError('Fail to select file zip');
      print(e);
      throw Exception('Error select file zip - $e');
    }
  }