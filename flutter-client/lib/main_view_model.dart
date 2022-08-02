import 'dart:typed_data';

import 'package:image_upload_guide/file_repository.dart';

class MainViewModel {
  final _repository = FileRepository();

  var isLoading = false;

  Future uploadImage(Uint8List image) async {
    await _repository.uploadImage(image);
  }
}
