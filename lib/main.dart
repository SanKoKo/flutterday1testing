import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _key,
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      drawer: Drawer(
       
        child: ListView(
          children: [
            // DrawerHeader(child: Text('header')),
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text("U"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Text("A"),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text("C"),
                  ),
                ],
                accountName: Text('Accout name'),
                accountEmail: Text('email@email.com')),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.abc),
              title: const Text('This is title 1'),
            )
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              if (!_key.currentState!.isDrawerOpen) {
                _key.currentState!.openDrawer();
              }
            },
            child: const Text('Open drawer')),
      ),
    );
  }
}
