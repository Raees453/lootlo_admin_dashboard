import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../models/formatter.dart';
import '../utils/constants.dart';

class HomeStatsWidget extends StatefulWidget {
  const HomeStatsWidget({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.icon,
    required this.quantity,
    this.isLast = false,
  }) : super(key: key);

  final String title;
  final int quantity;
  final Color backgroundColor;
  final IconData icon;
  final bool isLast;

  @override
  State<HomeStatsWidget> createState() => _HomeStatsWidgetState();
}

class _HomeStatsWidgetState extends State<HomeStatsWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animationController.forward(from: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => buildDesktopView(),
      mobile: (_) => buildMobileView(),
    );
  }

  Widget buildDesktopView() {
    final color = Theme.of(context).colorScheme.onPrimary;
    var textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(
        right: widget.isLast ? 0 : AppConstants.screenPadding,
      ),
      padding: const EdgeInsets.all(AppConstants.screenPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            widget.backgroundColor,
            widget.backgroundColor.withOpacity(0.9)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(widget.icon, size: 40),
          const SizedBox(height: AppConstants.screenPadding / 2),
          FittedBox(
            child: Text(
              widget.title,
              style: textTheme.bodyLarge?.copyWith(color: color),
            ),
          ),
          const SizedBox(height: AppConstants.screenPadding / 2),
          TweenAnimationBuilder(
            curve: Curves.easeInOut,
            tween: IntTween(begin: 1, end: widget.quantity),
            duration: const Duration(milliseconds: 2500),
            builder: (BuildContext context, int value, _) {
              return Text(
                Formatter.formatAmount(value),
                style: textTheme.headlineLarge?.copyWith(color: color),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildMobileView() {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadius / 2), //<-- SEE HERE
      ),
      leading: CircleAvatar(
        child: Icon(widget.icon),
      ),
      title: Text(widget.title),
      subtitle: Text(Formatter.formatAmount(widget.quantity)),
      tileColor: widget.backgroundColor,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
