import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/screens/forgot_password_screen.dart';
import 'package:lootlo_app_admin_dash/screens/home_screen.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';
import 'package:lootlo_app_admin_dash/widgets/custom/custome_text_field.dart';

class LoginDesktopView extends StatelessWidget {
  LoginDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.screenPaddingValue * 13,
        vertical: AppConstants.screenPaddingValue * 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppConstants.borderRadius),
                bottomLeft: Radius.circular(AppConstants.borderRadius),
              ),
              child: Image.asset(
                'assets/images/login_dash.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(child: buildLoginColumn(context)),
        ],
      ),
    );
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget buildLoginColumn(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppConstants.borderRadius),
          bottomRight: Radius.circular(AppConstants.borderRadius),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.screenPaddingValue * 2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Lootlo Admin\nDashboard',
                style: textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Login',
                  style: textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
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
                      padding:
                          MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(
                      ForgotPasswordScreen.routeName,
                    ),
                    child: const Text('Forgot Password'),
                  ),
                ),
                const SizedBox(height: AppConstants.screenPaddingValue),
                ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName),
                  child: const Text('Login'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
