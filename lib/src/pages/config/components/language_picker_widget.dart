import 'dart:ui';
import 'package:app_internacionalizaion/l10n/l10n.dart';
import 'package:app_internacionalizaion/src/shared/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: Text(flag, style: TextStyle(fontSize: 80)),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: const Icon(Icons.language),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getFlag(locale.languageCode);
            return DropdownMenuItem(
              child: Text(flag),
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<ThemeNotifier>(context, listen: false);

                provider.toogleChangeLanguage(locale.toString());
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
