import 'package:flutter/material.dart';

import '../utils/constants.dart';

class HomeMiniStatsWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            right: isLast ? 0 : AppConstants.screenPaddingValue),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenPaddingValue / 2,
          vertical: AppConstants.screenPaddingValue / 5,
        ),
        decoration: BoxDecoration(
            // color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            border: Border.all(
              color: Colors.grey.withOpacity(0.8),
            )),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconBgColor.withOpacity(0.8),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: AppConstants.screenPaddingValue / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: AppConstants.screenPaddingValue),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                ),
                const SizedBox(width: AppConstants.screenPaddingValue / 2),
                Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
