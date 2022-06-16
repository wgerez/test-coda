import 'package:flutter/material.dart';

class MinimalButton extends StatelessWidget {
  const MinimalButton({
    Key? key,
    required this.text,
    required this.action,
    required this.padding,
  }) : super(key: key);

  final String text;
  final VoidCallback action;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
        backgroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      child: Text(text),
      onPressed: () {
        action();
      },
    );
  }
}
