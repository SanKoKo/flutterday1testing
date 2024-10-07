import 'package:flutter/material.dart';
import 'package:flutter_day_1/second_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Body()),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                        icon: Icon(Icons.cloud_circle_sharp),
                        title: Text('This is title.'),
                        content: Text('This is content.'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, 'cancel');
                              },
                              child: Text('Cancel')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, 'ok');
                              },
                              child: Text('Ok')),
                        ],
                      )).then((value) {
                if (value == 'ok') {}
              });
            },
            child: Text('Show Dialog')),
        ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2023),
                lastDate: DateTime(2025),
                selectableDayPredicate: (day) {
                  print(day);
                  return true;
                },
              );
            },
            child: Text('show date picker')),
        ElevatedButton(
            onPressed: () {
              showMenu(context: context, position: RelativeRect.fill, items: [
                PopupMenuItem(child: Text('popup child1')),
                PopupMenuItem(child: Text('popup child1')),
              ]);
            },
            child: Text('show menu')),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('child 1'),
              onTap: () {},
            ),
            PopupMenuItem(child: Text('child 1')),
          ],
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
