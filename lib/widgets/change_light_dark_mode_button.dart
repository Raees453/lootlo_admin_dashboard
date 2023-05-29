import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lootlo_app_admin_dash/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeLightDarkModeButton extends StatefulWidget {
  const ChangeLightDarkModeButton({Key? key}) : super(key: key);

  @override
  State<ChangeLightDarkModeButton> createState() =>
      _ChangeLightDarkModeButtonState();
}

class _ChangeLightDarkModeButtonState extends State<ChangeLightDarkModeButton>
    with SingleTickerProviderStateMixin {
  late ThemeProvider _themeProvider;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _themeMode =
        _themeProvider.themeFromBrightness(Theme.of(context).brightness);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _themeMode = _themeProvider.revertTheme(Theme.of(context).brightness);
        _themeProvider.themeMode = _themeMode;
      },
      child: SizedBox(
        width: 25,
        child: SvgPicture.asset(
          _themeMode == ThemeMode.light
              ? 'assets/icons/sun.svg'
              : 'assets/icons/moon.svg',
          color: _themeMode == ThemeMode.light ? Colors.yellow : Colors.white,
        ),
      ),
    );
  }
}
