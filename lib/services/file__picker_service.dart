import 'package:file_picker/file_picker.dart';

class FilePickerService {
  static Future<PlatformFile?> pickPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false, // Only one file
        withData: true, // Ensures file bytes are included
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.first;
      } else {
        // User canceled the picker
        return null;
      }
    } catch (e) {
      print("File pick error: $e");
      return null;
    }
  }
}
