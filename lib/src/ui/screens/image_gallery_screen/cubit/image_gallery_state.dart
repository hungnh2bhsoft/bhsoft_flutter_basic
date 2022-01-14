part of 'image_gallery_cubit.dart';

abstract class ImageGalleryState {}

class ImageGalleryInitial extends ImageGalleryState {}

class ImageGalleryLoading extends ImageGalleryState {}

class ImageGalleryLoaded extends ImageGalleryState {
  final File imageFile;

  ImageGalleryLoaded({
    required this.imageFile,
  });
}

class ImageGalleryError extends ImageGalleryState {}
