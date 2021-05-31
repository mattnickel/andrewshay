import 'package:flutter/material.dart';

import '../streams/list_stream.dart';

class MyList extends StatelessWidget {
  final filter = "mine";
  @override
  Widget build(BuildContext context) {
   return ListStream(filter: filter);
  }
}