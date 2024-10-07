import 'package:flutter/material.dart';
import 'package:flutter_day_1/search.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Body(),
    );
  }
}

class Body extends StatelessWidget {
  List<String> list = List.generate(100, (index) => 'This is index of $index');
  List<String> sugList =
      List.generate(10, (index) => 'This is index of $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: MySearch(list, sugList));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Column(
          children: [
            Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) return const Iterable.empty();
              return list
                  .where((value) => value.contains(textEditingValue.text));
            }),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(index.toString()),
                      ),
                      title: Text(list[index]),
                      subtitle: Text('Api ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
