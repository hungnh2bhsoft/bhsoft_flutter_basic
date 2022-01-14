import 'package:additional_features/src/repositories/image_repository/image_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/image_capture_cubit.dart';

class ImageCaptureScreen extends StatelessWidget {
  const ImageCaptureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageCaptureCubit>(
      create: (context) =>
          ImageCaptureCubit(imageRepository: context.read<ImageRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Capture Image'),
        ),
        body: ImageCaptureView(),
      ),
    );
  }
}

class ImageCaptureView extends StatelessWidget {
  const ImageCaptureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCaptureCubit, ImageCaptureState>(
        builder: (context, state) {
      if (state is ImageCaptureLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ImageCaptureError) {
        return const Center(
          child: Text("Error loading message"),
        );
      }
      if (state is ImageCaptureLoaded) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(state.imageFile),
            Row(
              children: [
                ElevatedButton(
                  onPressed: context.read<ImageCaptureCubit>().onCaptureImage,
                  child: const Text("Retake"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              ],
            )
          ],
        );
      }
      return Center(
        child: ElevatedButton(
          child: const Text('Capture Image'),
          onPressed: context.read<ImageCaptureCubit>().onCaptureImage,
        ),
      );
    });
  }
}
