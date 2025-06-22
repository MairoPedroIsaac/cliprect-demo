import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipRect Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClipRectDemo(),
    );
  }
}

class ClipRectDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipRect Examples'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              'ClipRect Widget Demo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 30),
            
            // Example 1: Without ClipRect
            Text(
              '❌ WITHOUT ClipRect (Image overflows):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3),
                color: Colors.red.withOpacity(0.1),
              ),
              child: Image.network(
                'https://picsum.photos/400/300',
                fit: BoxFit.none,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
            
            SizedBox(height: 30),
            
            // Example 2: With ClipRect
            Text(
              '✅ WITH ClipRect (Clean and contained):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3),
                color: Colors.green.withOpacity(0.1),
              ),
              child: ClipRect(
                child: Image.network(
                  'https://picsum.photos/400/300',
                  fit: BoxFit.none,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),
            
            SizedBox(height: 30),
            
            // Example 3: Text Clipping
            Text(
              '📝 Text Clipping Example:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            // Without ClipRect
            Text('Without ClipRect:', style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            Container(
              width: 150,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Text(
                'This is a very long text that overflows',
                style: TextStyle(fontSize: 14),
              ),
            ),
            
            SizedBox(height: 15),
            
            // With ClipRect
            Text('With ClipRect:', style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            Container(
              width: 150,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2),
              ),
              child: ClipRect(
                child: Text(
                  'This is a very long text that gets clipped',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            
            SizedBox(height: 30),
            
            // Code Example Display
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic ClipRect Code:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ClipRect(\n  child: YourWidget(),\n)',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}