import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: UserAccountsDrawerHeader(
            accountName: Text('accountName'),
            accountEmail: Text('thisismyemail.com')),
      ),
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
