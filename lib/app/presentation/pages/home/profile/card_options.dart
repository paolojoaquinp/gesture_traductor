import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_image.dart';

class CardOptions extends StatelessWidget {
  const CardOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text(
              'Editar perfil',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.add),
            minLeadingWidth: 0,
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Salir',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.exit_to_app_outlined),
            minLeadingWidth: 0,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
