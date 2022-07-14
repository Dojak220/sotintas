import 'package:flutter/material.dart';
import 'package:sotintas/src/utils/fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Fonts.headline2,
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      shadowColor: Colors.transparent,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
