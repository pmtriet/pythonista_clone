import 'package:flutter/material.dart';

void main() {
  runApp(const Setting());
}

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: const <Widget>[
          Section(title: 'GENERAL'),
          ListTile(title: Text('Theme')),
          ListTile(
            title: Text('Sound Effects'), ),
          SizedBox(
            height: 20,
          ),
          Section(title: 'EDITOR'),
          ListTile(title: Text('Code Font'),),
          ListTile(title: Text('Indentation & Coding Style')),
          ListTile(title: Text('Keyboard & Typing ')),
          ListTile(title: Text('Snippets')),
          ListTile(title: Text('Show Line Numbers') ),
          SizedBox(
            height: 20,
          ),
          Section(title: 'Console'),
          ListTile(title: Text('Clear Before Running')),
          SizedBox(
            height: 20,
          ),
          Section(title: "APP EXTENSION"),
          ListTile(title: Text('Today Widget')),
          ListTile(title: Text('Share extension Shortcuts')),
          ListTile(title: Text('Pythonista Keyboard')),
          SizedBox(
            height: 20,
          ),
          Section(title: 'Script Library'),
          ListTile(title: Text('Restore Examples')),
          SizedBox(
            height: 20,
          ),
          ListTile(title: Text('Rate Pythonista')),
          ListTile(title: Text('Follow')),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;

  const Section({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
