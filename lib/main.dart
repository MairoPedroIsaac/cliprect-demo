import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipRect Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClipRectDemo(),
    );
  }
}

class ClipRectDemo extends StatelessWidget {
  const ClipRectDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClipRect Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First section: Image without ClipRect
            // This shows the full image without any clipping
            const Text('Without ClipRect'),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              width: 50,
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Second section: Image with ClipRect
            const Text('With ClipRect'),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              width: 50,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.5,
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}