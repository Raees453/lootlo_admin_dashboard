import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/models/formatter.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';

class CustomGetDataButtonWidget extends StatefulWidget {
  const CustomGetDataButtonWidget({Key? key}) : super(key: key);

  @override
  State<CustomGetDataButtonWidget> createState() =>
      _CustomGetDataButtonWidgetState();
}

class _CustomGetDataButtonWidgetState extends State<CustomGetDataButtonWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.widgetHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.screenPaddingValue / 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Row(
        children: [
          Text(
            selectedDate == null
                ? 'dd/mm/yyyy'
                : Formatter.formatDate(selectedDate!),
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {
              selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.utc(2000),
                lastDate: DateTime.utc(2030),
              );
              setState(() {});
            },
            icon: Icon(
              Icons.calendar_month,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
