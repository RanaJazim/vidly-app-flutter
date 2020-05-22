import 'package:flutter/material.dart';

class SingleMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Title'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _header(context),
            SizedBox(height: 30),
            _shortDescription(),
            Spacer(),
            // SizedBox(height: 20),
            Expanded(child: _caste()),
          ],
        ),
      ),
    );
  }

  Widget _header(context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3,
          child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Title', overflow: TextOverflow.ellipsis),
              SizedBox(height: 20),
              Text('Action, Comedy', overflow: TextOverflow.ellipsis),
              SizedBox(height: 20),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _shortDescription() {
    return Text(
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,",
    );
  }

  Widget _caste() {
    return ListView.builder(
      itemCount: 30,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                child: ClipOval(
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 50,
                child: Text(
                  'Text here here here',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final img =
    "https://images.unsplash.com/photo-1579445710183-f9a816f5da05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60";
