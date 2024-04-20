import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/features/signup/presentation/views/signup_view.dart';

class CustomButtonWelcome extends StatelessWidget {
  final IconData prefixIcon;
  final String text;
  final VoidCallback? onPressed;
  const CustomButtonWelcome(
      {super.key,
      required this.prefixIcon,
      required this.text,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(prefixIcon), // Prefix icon
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.arrow_forward_ios), onPressed: onPressed),
        ],
      ),
    );
  }
}
