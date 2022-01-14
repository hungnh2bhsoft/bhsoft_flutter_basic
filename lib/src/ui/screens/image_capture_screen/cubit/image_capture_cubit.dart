import 'dart:io';

import 'package:additional_features/src/repositories/image_repository/image_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_capture_state.dart';

class ImageCaptureCubit extends Cubit<ImageCaptureState> {
  final ImageRepository _imageRepository;

  ImageCaptureCubit({required ImageRepository imageRepository})
      : _imageRepository = imageRepository,
        super(ImageCaptureInitial());

  void onCaptureImage() async {
    try {
      emit(ImageCaptureLoading());
      final imageFile = await _imageRepository.captureImage();
      if (imageFile != null) {
        emit(ImageCaptureLoaded(imageFile: imageFile));
      } else {
        emit(ImageCaptureInitial());
      }
    } on ImagePickerException catch (_) {
      emit(ImageCaptureError());
    }
  }
}
