import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: _buildCheckout(),
          ),
          Spacer(flex: 10),
          _totalPayment(),
          Spacer(flex: 20),
          _actions(context),
          Spacer(),
          _clearAction(),
        ],
      ),
    );
  }

  Widget _buildCheckout() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (ctx, i) {
        return ListTile(
          leading: ClipOval(
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          ),
          title: Text('Movie Name'),
          subtitle: Text('Price: 50'),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {},
          ),
        );
      },
    );
  }

  Widget _totalPayment() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Text(
            'Total Payment: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Text(
            '150',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actions(context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Purchase',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                'Rent',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _clearAction() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        child: FlatButton(
          color: Colors.red,
          child: Text(
            'Clear All Items',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

final img =
    "https://images.unsplash.com/photo-1579445710183-f9a816f5da05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60";
