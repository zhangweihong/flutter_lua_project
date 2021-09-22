import 'package:flutter/material.dart';

class CommonStatefulWidget extends StatefulWidget {
  CommonStatefulWidget({Key? key, required this.pageData}) : super(key: key);
  final String pageData;
  @override
  _CommonStatefulWidgetState createState() => _CommonStatefulWidgetState();
}

class _CommonStatefulWidgetState extends State<CommonStatefulWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
