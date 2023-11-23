import 'package:flutter/material.dart';
import 'package:shop_app/constant/appStyle.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is Add Page",
          style: appStyle(
            40,
            FontWeight.bold,
            Colors.black,
          ),
        ),
      ),
    );
  }
}
