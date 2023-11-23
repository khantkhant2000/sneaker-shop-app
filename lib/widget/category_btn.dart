import 'package:flutter/material.dart';
import 'package:shop_app/constant/appStyle.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    this.onPressed,
    required this.btnColor,
    required this.label,
  });
  final void Function()? onPressed;
  final Color btnColor;
  final String label;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: btnColor,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        child: Text(
          label,
          style: appStyle(
            20,
            FontWeight.bold,
            btnColor,
          ),
        ),
      ),
    );
  }
}
