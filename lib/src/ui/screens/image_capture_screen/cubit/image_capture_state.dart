part of 'image_capture_cubit.dart';

@immutable
abstract class ImageCaptureState {}

class ImageCaptureInitial extends ImageCaptureState {}

class ImageCaptureLoading extends ImageCaptureState {}

class ImageCaptureLoaded extends ImageCaptureState {
  final File imageFile;

  ImageCaptureLoaded({
    required this.imageFile,
  });
}

class ImageCaptureError extends ImageCaptureState {}
