import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pythonista Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.toll_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Pythonista',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('This iPhone'),
              onTap: () {
                // Add your action here
              },
            ),
            ListTile(
              title: const Text('Icloud'),
              onTap: () {
                // Add your action here
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text('Add Favorites...'),
              onTap: () {
                // Add your action here
              },
            ),
            ListTile(
              title: const Text('Examples'),
              onTap: () {
                // Add your action here
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text('Open...'),
              onTap: () {
                // Add your action here
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text('Python Modules'),
              onTap: () {
                // Add your action here
              },
            ),
            ListTile(
              title: const Text('Files Templates'),
              onTap: () {
                // Add your action here
              },
            ),
            ListTile(
              title: const Text('Trash'),
              onTap: () {
                // Add your action here
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
