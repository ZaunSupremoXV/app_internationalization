import 'package:app_internacionalizaion/src/shared/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import 'components/language_picker_widget.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.configuracoes_title),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => SwitchListTile(
                title: Text(AppLocalizations.of(context)!.modo_escuro),
                onChanged: (val) {
                  notifier.toggleChangeTheme();
                },
                value: notifier.darkMode,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => ListTile(
                title: Text(AppLocalizations.of(context)!.idioma,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text(AppLocalizations.of(context)!.language),
                trailing: LanguagePickerWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
