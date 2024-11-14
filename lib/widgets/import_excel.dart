import 'package:file_picker/file_picker.dart';

FilePickerResult? resultPickedFile;

class Import {
  Future ImportExcel() async {
    try {
      resultPickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
        allowMultiple: false,
      );
    } catch (e) {
      print(e);
    }
  }
}
