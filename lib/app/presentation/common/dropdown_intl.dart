import 'package:flutter/material.dart';


class DropdownIntl extends StatefulWidget {

  @override
  State<DropdownIntl> createState() => _DropdownIntlState();
}

class _DropdownIntlState extends State<DropdownIntl> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: Localizations.localeOf(context),
      onChanged: (Locale? newValue) {
        if (newValue != null) {
          setState(() {
            Localizations.localeOf(context);
          });
        }
      },
      items: <Locale>[
        const Locale('en', ''),
        const Locale('es', 'ES'),
        // Add any other locales your app supports
      ].map<DropdownMenuItem<Locale>>((Locale value) {
        return DropdownMenuItem<Locale>(
          value: value,
          child: Text(value.languageCode),
        );
      }).toList(),
    );
  }
}