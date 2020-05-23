import 'package:flutter/material.dart';

class NavigateAction extends StatelessWidget {
  final String _title;
  final Function _action;

  NavigateAction(this._title, this._action);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(right: 20),
        child: Text(
          '$_title',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
      onTap: _action,
    );
  }
}