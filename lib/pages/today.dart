import 'package:flutter/material.dart';

import '../streams/list_stream.dart';

class Today extends StatelessWidget {
  final filter = "today";
  @override
  Widget build(BuildContext context) {
    return ListStream(filter: filter);
  }
}

