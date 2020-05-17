import 'package:flutter/material.dart';

import './product_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ecommerece"),
          centerTitle: true,
          leading: Icon(Icons.menu),
        ),
        body: _TabView(),
        bottomNavigationBar: _BottomTabs(),
      ),
    );
  }
}

class _TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ProductScreen(),
        new Container(
          color: Colors.orange,
        ),
        new Container(
          color: Colors.lightGreen,
        ),
        new Container(
          color: Colors.red,
        ),
      ],
    );
  }
}

class _BottomTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          icon: new Icon(Icons.home),
          text: "Home",
        ),
        Tab(
          icon: new Icon(Icons.category),
          text: "Category",
        ),
        Tab(
          icon: new Icon(Icons.refresh),
          text: "Recent",
        ),
        Tab(
          icon: new Icon(Icons.perm_identity),
          text: "Profile",
        ),
      ],
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
