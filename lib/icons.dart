import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const CustomIcon({
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
  }