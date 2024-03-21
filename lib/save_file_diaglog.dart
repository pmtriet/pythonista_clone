import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

class SaveFileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lưu File'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                final fileName = await _promptFileName(context);
                if (fileName != null && fileName.isNotEmpty) {
                  final savePath = await _pickSaveLocation();
                  if (savePath != null) {
                    final filePath = '$savePath/$fileName.txt';
                    final file = File(filePath);
                    if (await file.exists()) {
                      final replace = await _promptReplaceExistingFile(context);
                      if (!replace) return;
                    }
                    await _saveFile(
                        file, 'Nội dung file'); // Giả sử lưu nội dung này
                  }
                }
              },
            ),
          ],
        ),
        body: Center(
          child: Text('Nhấn vào icon lưu trên AppBar để bắt đầu'),
        ),
      ),
    );
  }
}

Future<String?> _promptFileName(BuildContext context) async {
  String? fileName;
  return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Nhập tên file'),
          content: TextField(
            onChanged: (value) {
              fileName = value;
            },
            decoration: InputDecoration(hintText: "Tên file"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Lưu'),
              onPressed: () {
                Navigator.of(context).pop(fileName);
              },
            ),
          ],
        );
      });
}

Future<bool> _promptReplaceExistingFile(BuildContext context) async {
  return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Thay thế file?'),
              content: Text('File đã tồn tại. Bạn có muốn thay thế không?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Không'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: Text('Có'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          }) ??
      false;
}

Future<void> _saveFile(File file, String content) async {
  await file.writeAsString(content);
}

Future<String?> _pickSaveLocation() async {
  final result = await FilePicker.platform.getDirectoryPath();
  if (result != null) {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      return result;
    }
  }
  return null;
}
