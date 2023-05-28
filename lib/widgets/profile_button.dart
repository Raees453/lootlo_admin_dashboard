import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      splashRadius: 0.1,
      enableFeedback: false,
      elevation: 3,
      position: PopupMenuPosition.under,
      tooltip: 'Profile',
      icon: CircleAvatar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        radius: 25,
        child: Text(
          'A',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      itemBuilder: (context) {
        return <PopupMenuItem>[
          PopupMenuItem(
            child: _buildRow(context, Icons.dashboard, 'Dashboard'),
            onTap: () {},
          ),
          PopupMenuItem(
            child: _buildRow(context, Icons.settings, 'Edit Profile'),
            onTap: () {},
          ),
          PopupMenuItem(
            child: _buildRow(context, Icons.logout, 'Logout'),
            onTap: () {},
          ),
        ];
      },
    );
  }

  Widget _buildRow(BuildContext context, IconData icon, String title) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(
          icon,
          color: theme.brightness == Brightness.light
              ? theme.primaryColor
              : theme.iconTheme.color,
        ),
        const SizedBox(width: AppConstants.screenPaddingValue / 2),
        Text(title),
        const SizedBox(width: AppConstants.screenPaddingValue),
      ],
    );
  }
}
