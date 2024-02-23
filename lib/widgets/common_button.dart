import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    super.key,
    required this.onPressed,
    required this.widget,
    required this.color,
    this.width,
  });
  double? width;
  final Widget widget;
  Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        width: width,
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
