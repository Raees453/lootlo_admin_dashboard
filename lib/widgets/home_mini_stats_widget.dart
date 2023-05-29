import 'package:flutter/material.dart';

import '../models/formatter.dart';
import '../utils/constants.dart';

class HomeMiniStatsWidget extends StatefulWidget {
  const HomeMiniStatsWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.value,
    required this.iconBgColor,
    this.isLast = false,
  }) : super(key: key);

  final String title;
  final int value;
  final IconData icon;
  final Color iconBgColor;
  final bool isLast;

  @override
  State<HomeMiniStatsWidget> createState() => _HomeMiniStatsWidgetState();
}

class _HomeMiniStatsWidgetState extends State<HomeMiniStatsWidget>
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
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            right: widget.isLast ? 0 : AppConstants.screenPaddingValue),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenPaddingValue / 2,
          vertical: AppConstants.screenPaddingValue / 5,
        ),
        decoration: BoxDecoration(
          // color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          border: Border.all(
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: widget.iconBgColor.withOpacity(0.8),
              child: Icon(
                widget.icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: AppConstants.screenPaddingValue / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: AppConstants.screenPaddingValue),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                ),
                const SizedBox(width: AppConstants.screenPaddingValue / 2),
                TweenAnimationBuilder(
                  curve: Curves.easeInOut,
                  tween: IntTween(begin: 1, end: widget.value),
                  duration: AppConstants.homeTextAnimationDuration,
                  builder: (BuildContext context, int value, _) {
                    return Text(
                      Formatter.formatAmount(value),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
