import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {Key? key,
        required this.name,
        this.isActive = false,
        required this.onClick})
      : super(key: key);
  final String name;
  final bool isActive;
  final Function()? onClick;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: isActive ? primaryColor : Colors.white,
            border: Border.all(
                color: isActive ? Colors.transparent : primaryColor,
                width: 0.5)),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Center(
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 12, color: isActive ? Colors.white : Colors.black),
            )),
      ),
    );
  }
}
