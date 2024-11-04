import 'package:flutter/material.dart';

import '../theme/colors.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        side: const BorderSide(color: AppColor.primaryColor, width: 1), //<-- SEE HERE
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}