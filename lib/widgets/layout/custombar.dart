import 'package:casanareapp/models/site.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Site site;
  AdaptiveAppBar({required this.site});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: true,
      title: SelectableText("Detalle de la empresa"),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          tooltip: "Compartir",
          onPressed: () {
            String name = site.normalizedName;
            int id = site.id;

            Share.share('¡Mira esta empresa! https://casanare.app/$name/$id');
          },
        )
      ],
    );
  }
}
