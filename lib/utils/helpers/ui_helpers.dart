import 'package:flutter/material.dart';

import '../../models/order_status.dart';
import '../constants.dart';

class UIHelpers {
  static final _colorsMap = {
    OrderStatus.Pending: Colors.amber,
    OrderStatus.Processing: Colors.teal,
    OrderStatus.Cancel: Colors.red,
    OrderStatus.Delivered: Colors.green,
  };

  static Widget highlightedWidget(
    BuildContext context,
    OrderStatus title,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: (_colorsMap[title] as Color).withOpacity(0.1),
        borderRadius:
            BorderRadius.circular(AppConstants.screenPaddingValue / 2),
      ),
      child: Text(
        title.name,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: (_colorsMap[title] as Color),
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
