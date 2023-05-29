import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    Key? key,
    required this.title,
    required this.values,
  }) : super(key: key);

  final String title;
  final List<dynamic> values;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  dynamic _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: DropdownButton(
        value: _value,
        isExpanded: true,
        underline: const SizedBox(),
        hint: Text(widget.title),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenPaddingValue / 2,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        items: widget.values
            .map((e) => DropdownMenuItem(value: e, child: Text(e.toString())))
            .toList(),
        onChanged: (value) {
          if (_value != null && value == _value) {
            return;
          }
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }

  dynamic get value => _value;
}
