import 'dart:io';
import 'dart:typed_data';

import 'package:image_upload_guide/file_api.dart';

class FileRepository {
  final _fileApi = FileApi();

  Future<bool> uploadImage(Uint8List image) async {
    try {
      await _fileApi.uploadImage(image);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
