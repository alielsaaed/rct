import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/view-model/functions/snackbar.dart';

Future<File?> openFilePicker(BuildContext context) async {
  // Use FilePicker to pick a file
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null && result.files.single.path != null) {
    // Return the picked file
    showSnackBar(context, "تم رفع الملف بنجاح", primaryColor);
    if (kDebugMode) {
      print("File:${result.files.single.path!} ");
    }
    return File(result.files.single.path!);
  } else {
    // User canceled the picker
    showSnackBar(context, "لم يتم رفع الملف بنجاح", redColor);

    if (kDebugMode) {
      print("Upload Cancelled");
    }
    return null;
  }
}

// Helper function to determine if the file is a text file
bool isTextFile(String fileName) {
  final textFileExtensions = ['.txt', '.md', '.json', '.xml', '.csv'];
  return textFileExtensions.any((ext) => fileName.toLowerCase().endsWith(ext));
}


// class FileUploade {
//   final Crud _crud = Crud();

//   // Future<void> sendPostRequest(File file, String text) async {
//   //   _crud.postRequest(linkAreaspaces, data);
//   //   var uri = Uri.parse('https://your-api-url.com/endpoint');
//   //   var request = http.MultipartRequest('POST', uri)
//   //     ..fields['text'] = text
//   //     ..files.add(await http.MultipartFile.fromPath(
//   //       'file',
//   //       file.path,
//   //       contentType: MediaType('application', 'octet-stream'),
//   //     ));

//   //   var response = await request.send();

//   //   if (response.statusCode == 200) {
//   //     print('Request sent successfully!');
//   //   } else {
//   //     print('Failed to send request.');
//   //   }
//   // }

// }
