import 'dart:io';

import 'package:additional_features/src/repositories/image_repository/image_repository.dart';
import 'package:bloc/bloc.dart';

part 'image_gallery_state.dart';

class ImageGalleryCubit extends Cubit<ImageGalleryState> {
  final ImageRepository _imageRepository;

  ImageGalleryCubit({required ImageRepository imageRepository})
      : _imageRepository = imageRepository,
        super(ImageGalleryInitial());

  void onPickImage() async {
    try {
      emit(ImageGalleryLoading());
      final imageFile = await _imageRepository.pickImage();
      if (imageFile != null) {
        emit(ImageGalleryLoaded(imageFile: imageFile));
      } else {
        emit(ImageGalleryInitial());
      }
    } on ImagePickerException catch (_) {
      emit(ImageGalleryError());
    }
  }
}
