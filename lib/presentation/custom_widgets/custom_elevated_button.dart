import 'package:filter_test/core/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ConstantColors.kButtonColorDarkGray),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              style:
                  ConstantTextStyles.buttonStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}