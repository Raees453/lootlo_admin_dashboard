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
        margin: EdgeInsets.only(right: isLast ? 0 : AppConstants.screenPadding),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenPadding / 2,
          vertical: AppConstants.screenPadding / 5,
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
            const SizedBox(width: AppConstants.screenPadding / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: AppConstants.screenPadding),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                ),
                const SizedBox(width: AppConstants.screenPadding / 2),
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

    return Expanded(
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        leading: CircleAvatar(
          backgroundColor: iconBgColor,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
              ),
        ),
        subtitle: Text(
          value.toString(),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
