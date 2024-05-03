import 'dart:async';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImagePicker _imagePicker;
  ImageCropper _imageCropper;

  ImageHelper({
    required ImagePicker imagePicker,
    required ImageCropper imageCropper,
  })  : _imagePicker = imagePicker,
        _imageCropper = imageCropper;

  Future<List<XFile>?> getImage(
      ImageSource imageSource, bool multipleImg) async {
    if (multipleImg) {
      return await _imagePicker.pickMultiImage(imageQuality: 100);
    } else {
      final file = await _imagePicker.pickImage(source: imageSource);
      if (file != null) {
        return <XFile>[file];
      } else {
        return [];
      }
    }
  }

  Future<CroppedFile?> cropImage(String imgPath, CropStyle cropStyle) async {
    return await _imageCropper.cropImage(
      sourcePath: imgPath,
      cropStyle: cropStyle,
    );
  }
}
