

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

fileUpLoadGallery()async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: [
        "jpg",
        "png",
        "jpeg",
        "png",
        "PNG",
        "gif"
      ]

  );

  if (result != null) {
    if (kIsWeb) {
      return result.files.first.bytes;
    } else {
      return File(result.files.single.path!);
    }
  }
  else {
    return null;
  }
}