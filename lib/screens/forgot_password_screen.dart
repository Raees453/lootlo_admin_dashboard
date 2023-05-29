import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/models/toast_notification_type.dart';
import 'package:lootlo_app_admin_dash/utils/helpers/ui_helpers.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../utils/constants.dart';
import '../widgets/custom/custome_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgot-password';

  ForgotPasswordScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        desktop: (_) => buildDesktopView(_),
        tablet: (_) => buildTabletView(),
        mobile: (_) => buildMobileView(_),
      ),
    );
  }

  Widget buildDesktopView(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.screenPaddingValue * 20,
        vertical: AppConstants.screenPaddingValue * 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildImageWidget(
              BoxFit.fill,
              const BorderRadius.only(
                topLeft: Radius.circular(AppConstants.borderRadius),
                bottomLeft: Radius.circular(AppConstants.borderRadius),
              ),
            ),
          ),
          Expanded(
            child: _buildColumn(
              context,
              const EdgeInsets.all(AppConstants.screenPaddingValue),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMobileView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _buildImageWidget(
            BoxFit.fill,
            const BorderRadius.only(
              topLeft: Radius.circular(AppConstants.borderRadius),
              bottomLeft: Radius.circular(AppConstants.borderRadius),
            ),
          ),
        ),
        _buildColumn(
          context,
          const EdgeInsets.all(AppConstants.screenPaddingValue),
        ),
      ],
    );
  }

  Widget buildTabletView() {
    return const Center(
      child: Text('Forgot Password Screen Tablet View'),
    );
  }

  Widget _buildImageWidget(BoxFit boxFit, BorderRadiusGeometry borderRadius) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset('assets/images/forgot_password.jpeg', fit: boxFit),
      ),
    );
  }

  Widget _buildColumn(BuildContext context, EdgeInsets padding) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppConstants.borderRadius),
          bottomRight: Radius.circular(AppConstants.borderRadius),
        ),
      ),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppConstants.screenPaddingValue),
          Text(
            'Forgot Password',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          Text('Email', style: textTheme.bodyMedium),
          const SizedBox(height: AppConstants.screenPaddingValue / 3),
          CustomTextField(
            controller: emailController,
            hintText: 'admin@lootlo.com',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          ElevatedButton(
            onPressed: () {
              UIHelpers.showToastNotification(
                context,
                'Email with instructions sent.',
                ToastNotificationType.normal,
              );
              Future.delayed(const Duration(seconds: 2)).then(
                (value) => Navigator.of(context).pop(),
              );
            },
            child: const Text('Recover Password'),
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          TextButton(
            onPressed: () {},
            child: const Text('Already have an Account? Login'),
          ),
        ],
      ),
    );
  }
}
