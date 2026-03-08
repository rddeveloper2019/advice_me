import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchButton extends StatelessWidget {
  SearchButton({super.key, this.onTap, required this.controller});
  void Function()? onTap;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.hintColor.withAlpha(30),
          borderRadius: BorderRadius.circular(16),
        ),
        child: AnimatedBuilder(
          builder: (context, _) {
            return Row(
              children: [
                Icon(Icons.search, color: theme.hintColor, size: 24),
                SizedBox(width: 10),
                Text(
                  controller.text.isEmpty
                      ? 'Хочешь совет?...'
                      : controller.text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: theme.hintColor,
                  ),
                ),
              ],
            );
          },
          animation: controller,
        ),
      ),
    );
  }
}
