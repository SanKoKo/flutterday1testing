import 'package:flutter/material.dart';

class MySearch extends SearchDelegate {
  List<String> list;
  List<String> sugList;
  MySearch(this.list, this.sugList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> result = list
        .where((value) => value.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(index.toString()),
            ),
            title: Text(result[index]),
            subtitle: Text('Api ${index + 1}'),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   List<String> result = sugList
        .where((value) => value.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(index.toString()),
            ),
            title: Text(result[index]),
            subtitle: Text('Api ${index + 1}'),
          ),
        );
      },
    );
  }
}
