import 'package:flutter/material.dart';

class SecondScreen extends MaterialPageRoute {
  SecondScreen()
      : super(
          builder: (context) => const SecondPage(),
        );
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Container(
        child: Column(
          children: [
            Center(
              child:  Hero(
                tag: '1',
                child: Icon(Icons.ac_unit,size: 60,)),
            ),
            Center(
              child:  Hero(
                tag: '2',
                child: Icon(Icons.ac_unit,size: 60,)),
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}


