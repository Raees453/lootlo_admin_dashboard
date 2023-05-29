import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureTextValue;

  @override
  void initState() {
    obscureTextValue = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        obscureText: obscureTextValue,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        dragStartBehavior: DragStartBehavior.start,
        decoration: InputDecoration(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          suffixIcon: widget.obscureText
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.screenPaddingValue / 3,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureTextValue = !obscureTextValue;
                      });
                    },
                    icon: Icon(
                      obscureTextValue
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
