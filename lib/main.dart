import 'package:flutter/material.dart';

import 'clas.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<String> name = ['One', 'Two', 'Three'];
  List<Widget> cla = [one(), two(), three()];
  List<Icon> ico = [
    Icon(Icons.contact_phone),
    Icon(Icons.home),
    Icon(Icons.keyboard),
  ];
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(
        animationDuration: Duration(seconds: 1),
        initialIndex: 1,
        length: 3,
        vsync: this);
    tabController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('accountName'),
              accountEmail: Text('accountEmail')),
          for (int i = 0; i < 3; i++)
            ListTile(
              onTap: () => setState(() {
                tabController!.index = i;
                Navigator.pop(context);
              }),
              title: Text(name[i]),
            )
        ],
      )),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              for (int i = 0; i < 3; i++)
                PopupMenuItem(
                    onTap: () => setState(() {
                          tabController!.index = i;
                        }),
                    value: i,
                    child: Text('${name[i]}'))
            ],
          )
        ],
        bottom: TabBar(
            controller: tabController,
            tabs: [for (int i = 0; i < 3; i++) Tab(child: Text('${name[i]}'))]),
      ),
      body: TabBarView(controller: tabController, children: cla),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => tabController!.index = value,
          currentIndex: tabController!.index,
          items: [
            for (int i = 0; i < name.length; i++)
              BottomNavigationBarItem(label: name[i], icon: ico[i])
          ]),
    );
  }
}
