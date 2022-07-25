import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();
  var isLoading = false;

  Future<bool> _uploadImage() async {
    setState(() {
      isLoading = true;
    });

    final bytes = await rootBundle.load('assets/group10.png');

    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(bytes.buffer.asUint8List(),
          filename: 'group10.png'),
    });

    try {
      final response = await dio.post(
        'http://10.0.2.2:8080/upload',
        data: formData,
      );

      setState(() {
        isLoading = false;
      });

      return true;
    } catch (e) {
      print(e.toString());

      setState(() {
        isLoading = false;
      });

      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            isLoading ? const CircularProgressIndicator() : Container(),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('업로드 파일'),
            ),
          ],
        ),
      ),
    );
  }
}
