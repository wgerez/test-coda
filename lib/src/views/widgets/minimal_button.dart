import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinimalButton extends StatelessWidget {
  const MinimalButton({
    Key? key,
    required this.text,
    required this.action,
  }) : super(key: key);

  final String text;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      child: Text('login'.tr),
      onPressed: () {
        action();
      },
    );
  }
}
