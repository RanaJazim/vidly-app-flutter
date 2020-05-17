import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (ctx, i) {
        return _singleProduct();
      },
    );
  }

  Widget _singleProduct() {
    var topContainerMargin = 10.0;

    return Container(
      margin: EdgeInsets.only(
        top: topContainerMargin,
        left: topContainerMargin,
        right: topContainerMargin,
      ),
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "IPhone",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            "899 USD",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

final img =
    "https://images.pexels.com/photos/788946/pexels-photo-788946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
