import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';
import 'package:lootlo_app_admin_dash/widgets/home_mini_stats_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/hard_coded_data.dart';
import '../../widgets/home_recent_orders_table_widget.dart';
import '../../widgets/home_stats_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => const HomeWidgetDesktopViewBuilder(),
      tablet: (_) => buildTabletView(),
      mobile: (_) => buildMobileView(),
    );
  }

  Widget buildTabletView() {
    return const Center(
      child: Text('Tablet Home Widget'),
    );
  }

  Widget buildListVIew() {
    final list = homeMajorStatsList;
    const sizedBox = SizedBox(height: AppConstants.screenPaddingValue / 3);

    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: list.length,
      separatorBuilder: (_, __) => sizedBox,
      itemBuilder: (_, index) => HomeStatsWidget(
        title: list[index].title,
        backgroundColor: list[index].backgroundColor,
        icon: list[index].icon,
        quantity: list[index].quantity,
      ),
    );
  }

  Widget buildMobileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildListVIew(),
        const SizedBox(height: AppConstants.screenPaddingValue),
        Text('Recent Orders', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AppConstants.screenPaddingValue / 2),
        HomeRecentOrdersTableWidget(),
      ],
    );
  }
}

class HomeWidgetDesktopViewBuilder extends StatelessWidget {
  const HomeWidgetDesktopViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: AppConstants.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Dashboard Overview', style: textTheme.headlineMedium),
          const SizedBox(height: AppConstants.screenPaddingValue),
          _buildMainStatsRow(),
          const SizedBox(height: AppConstants.screenPaddingValue),
          _buildMiniStatsRow(),
          const SizedBox(height: AppConstants.screenPaddingValue * 2),
          Text('Recent Orders', style: textTheme.headlineMedium),
          const SizedBox(height: AppConstants.screenPaddingValue / 2),
          HomeRecentOrdersTableWidget(),
        ],
      ),
    );
  }

  Widget _buildMainStatsRow() {
    final list = homeMajorStatsList;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list
          .map((e) => Expanded(
                child: HomeStatsWidget(
                  title: e.title,
                  backgroundColor: e.backgroundColor,
                  icon: e.icon,
                  quantity: e.quantity,
                  isLast: e.isLast,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildMiniStatsRow() {
    final List<Color> colors = [
      Colors.orangeAccent,
      Colors.blueAccent,
      Colors.teal,
      Colors.green,
    ];

    final icons = [
      Icons.shopping_cart_outlined,
      Icons.restart_alt,
      Icons.fire_truck_outlined,
      Icons.done,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HomeMiniStatsWidget(
          title: 'Total Order',
          icon: icons[0],
          value: 0,
          iconBgColor: colors[0],
        ),
        HomeMiniStatsWidget(
          title: 'Total Order',
          icon: icons[1],
          value: 0,
          iconBgColor: colors[1],
        ),
        HomeMiniStatsWidget(
          title: 'Total Order',
          icon: icons[2],
          value: 0,
          iconBgColor: colors[2],
        ),
        HomeMiniStatsWidget(
          title: 'Total Order',
          icon: icons[3],
          value: 0,
          iconBgColor: colors[3],
          isLast: true,
        ),
      ],
    );
  }
}
