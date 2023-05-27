import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../models/customer.dart';

class CustomerTileWidget extends StatelessWidget {
  const CustomerTileWidget({Key? key, required this.customer})
      : super(key: key);

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => buildDesktopView(_),
    );
  }

  Widget buildDesktopView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(customer.imageUrl),
        ),
        title: Text(
          customer.name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        subtitle: Text(customer.email),
        trailing: PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: TextButton(
                  child: const Text('Delete'),
                  onPressed: () {},
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  child: const Text('Disable Account'),
                  onPressed: () {},
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}
