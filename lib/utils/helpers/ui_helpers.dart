import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/models/toast_notification_type.dart';
import 'package:toastification/toastification.dart';

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

  static void showToastNotification(
    BuildContext context,
    String title,
    ToastNotificationType type,
  ) {
    const pauseOnHover = true;
    final foregroundColor = Theme.of(context).colorScheme.onPrimary;
    final backgroundColor = Theme.of(context).primaryColor;

    const padding = EdgeInsets.symmetric(
      vertical: AppConstants.screenPaddingValue / 4,
      horizontal: AppConstants.screenPaddingValue / 2,
    );

    const autoCloseDuration = Duration(
      seconds: AppConstants.autoCloseDurationSeconds,
    );

    if (type == ToastNotificationType.success) {
      toastification.showSuccess(
        context: context,
        title: title,
        padding: padding,
        autoCloseDuration: autoCloseDuration,
        pauseOnHover: pauseOnHover,
      );
    } else if (type == ToastNotificationType.normal) {
      toastification.showInfo(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        context: context,
        title: title,
        padding: padding,
        autoCloseDuration: autoCloseDuration,
        pauseOnHover: pauseOnHover,
      );
    } else if (type == ToastNotificationType.error) {
      toastification.showError(
        context: context,
        title: title,
        padding: padding,
        autoCloseDuration: autoCloseDuration,
        pauseOnHover: pauseOnHover,
      );
    } else if (type == ToastNotificationType.warning) {
      toastification.showWarning(
        context: context,
        title: title,
        padding: padding,
        autoCloseDuration: autoCloseDuration,
        pauseOnHover: pauseOnHover,
      );
    }
  }
}
