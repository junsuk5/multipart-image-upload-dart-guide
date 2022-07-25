import 'dart:typed_data';

import 'package:dio/dio.dart';

class FileApi {
  final _dio = Dio();

  Future<Response> uploadImage(
    Uint8List image,
  ) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(image.buffer.asUint8List(),
          filename: 'group10.png'),
    });

    final response = await _dio.post(
      'http://10.0.2.2:8080/upload',
      data: formData,
    );

    return response;
  }
}
