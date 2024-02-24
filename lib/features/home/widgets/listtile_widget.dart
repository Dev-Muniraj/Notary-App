
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const ListTileWidget(
      {super.key,
        required this.title,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding:  EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -4),
      onTap: onTap,
      title:
          Text(title),
    );
  }
}
