import 'package:flutter/material.dart';

class SupportButtonsRow extends StatelessWidget {
  const SupportButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50),
                  right: Radius.zero,
                ),
              ),
            ),
            child: const Text("Como pintar"),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.zero,
                  right: Radius.circular(50),
                ),
              ),
            ),
            child: const Text("Tirar dúvidas"),
          ),
        ),
      ],
    );
  }
}