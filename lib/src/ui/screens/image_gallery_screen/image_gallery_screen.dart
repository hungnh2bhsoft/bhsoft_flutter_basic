import 'package:additional_features/src/repositories/image_repository/image_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/image_gallery_cubit.dart';

class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageGalleryCubit>(
      create: (context) =>
          ImageGalleryCubit(imageRepository: context.read<ImageRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gallery Image'),
        ),
        body: ImageGalleryView(),
      ),
    );
  }
}

class ImageGalleryView extends StatelessWidget {
  const ImageGalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ImageGalleryCubit, ImageGalleryState>(
          builder: (context, state) {
        if (state is ImageGalleryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ImageGalleryError) {
          return const Center(
            child: Text("Error loading message"),
          );
        }
        if (state is ImageGalleryLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(state.imageFile),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: context.read<ImageGalleryCubit>().onPickImage,
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
            child: const Text('Gallery Image'),
            onPressed: context.read<ImageGalleryCubit>().onPickImage,
          ),
        );
      }),
    );
  }
}
