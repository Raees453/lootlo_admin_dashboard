import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../utils/constants.dart';
import '../widgets/custom/custome_text_field.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';

  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        desktop: (_) => buildDesktopView(_),
        mobile: (_) => buildMobileView(_),
      ),
    );
  }

  Widget buildDesktopView(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Card(
      elevation: 5,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: height * 0.7,
            minHeight: height * 0.4,
            maxWidth: width * 0.7,
            minWidth: width * 0.4,
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
                  const EdgeInsets.symmetric(
                    horizontal: AppConstants.screenPaddingValue * 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMobileView(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildImageWidget(
            BoxFit.cover,
            const BorderRadius.only(
              bottomRight: Radius.circular(AppConstants.borderRadius),
              bottomLeft: Radius.circular(AppConstants.borderRadius),
            ),
          ),
        ),
        _buildColumn(
          context,
          const EdgeInsets.all(AppConstants.screenPaddingValue / 1.5),
        ),
      ],
    );
  }

  Widget _buildImageWidget(BoxFit boxFit, BorderRadiusGeometry borderRadius) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset('assets/images/login_dash.jpeg', fit: boxFit),
      ),
    );
  }

  Widget _buildColumn(BuildContext context, EdgeInsets padding) {
    return buildLoginColumn(context, padding);
  }

  Widget buildLoginColumn(BuildContext context, EdgeInsets padding) {
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
          Text(
            'Lootlo Admin\nDashboard',
            textAlign: TextAlign.center,
            style: textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          Text(
            'Login',
            style:
                textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          Text('Email', style: textTheme.bodyMedium),
          const SizedBox(height: AppConstants.screenPaddingValue / 3),
          CustomTextField(
            controller: emailController,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          Text('Password', style: textTheme.bodyMedium),
          const SizedBox(height: AppConstants.screenPaddingValue / 3),
          CustomTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: AppConstants.screenPaddingValue / 3),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: const ButtonStyle(
                overlayColor:
                    MaterialStatePropertyAll<Color>(Colors.transparent),
                padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
              ),
              onPressed: () => Navigator.of(context).pushNamed(
                ForgotPasswordScreen.routeName,
              ),
              child: const Text('Forgot Password'),
            ),
          ),
          const SizedBox(height: AppConstants.screenPaddingValue / 2),
          ElevatedButton(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(HomeScreen.routeName),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
