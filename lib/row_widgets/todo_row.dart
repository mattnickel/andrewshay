import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ToDoRow extends StatelessWidget {


  @override

  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: RawMaterialButton(
              onPressed: () {
              },
              elevation: 2.0,
              child: Icon(
                Icons.play_circle_filled,
                size: 55.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ),
          Positioned(
            bottom: 50,
            left:10,
            child: Text(
                "This Title",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white)
            ),
          ),
          Positioned(
            bottom: 10,
            left:10,
            width: 300,
            child: Text(
                "This description",
                maxLines: 2,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white)
            ),
          ),
        ],
      ),
    );
  }
}

