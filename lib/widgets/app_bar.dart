import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';
import 'package:lootlo_app_admin_dash/widgets/profile_button.dart';

import 'change_light_dark_mode_button.dart';

PreferredSizeWidget appBarBuilder(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).primaryColor,
    title: const Text('Lootlo Admin Dashboard'),
    centerTitle: false,
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 24.0),
        child: CircleAvatar(
          child: Icon(Icons.person),
        ),
      )
    ],
  );
}

class AppBarBuilder extends StatelessWidget {
  const AppBarBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      height: 120,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.screenPadding * 3,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Admin',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Here\'s what\'s happening in store right now',
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const Spacer(),
          const ChangeLightDarkModeButton(),
          const SizedBox(width: AppConstants.screenPadding),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, size: 25),
          ),
          const SizedBox(width: AppConstants.screenPadding),
          const ProfileButton(),
        ],
      ),
    );
  }

  Widget _buildSearchButton() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: const Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 5),
          Text('Search something...'),
        ],
      ),
    );
  }
}
