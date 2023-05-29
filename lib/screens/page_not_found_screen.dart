import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenTypeLayout.builder(
        desktop: (_) => buildDesktopView(textTheme),
      ),
    );
  }

  Widget buildDesktopView(TextTheme textTheme) {
    return Center(
      child: RichText(
        textScaleFactor: 2,
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Error 404\n',
          style: textTheme.headlineSmall,
          children: [
            TextSpan(
              text: 'Page Not Found',
              style: textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
