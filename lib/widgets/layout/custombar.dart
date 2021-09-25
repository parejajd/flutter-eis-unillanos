import 'package:flutter/material.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: true,
      title: SelectableText("Detalle de la empresa"),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          tooltip: "Share",
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.favorite),
          tooltip: "Favorite",
          onPressed: () {},
        )
      ],
    );
  }
}
