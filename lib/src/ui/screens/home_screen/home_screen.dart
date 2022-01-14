import 'package:additional_features/src/ui/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Additional Features"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Login"),
            ),
            ElevatedButton(
              child: Text("Maps"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("Capture Image"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageCaptureScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("Pick Image"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageGalleryScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("SQL"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SqlScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
