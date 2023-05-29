import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/models/customer.dart';
import 'package:lootlo_app_admin_dash/models/home_mini_stats_widget_model.dart';
import 'package:lootlo_app_admin_dash/models/home_stats_widget_model.dart';
import 'package:lootlo_app_admin_dash/models/order.dart';
import 'package:lootlo_app_admin_dash/models/order_payment.dart';
import 'package:lootlo_app_admin_dash/models/order_status.dart';
import 'package:lootlo_app_admin_dash/models/product.dart';

final customersList = List.generate(
  30,
  (index) => Customer(
    id: '$index',
    name: 'Customer # ${index + 1}',
    email: 'email${index + 1}@gmail.com',
    phone: '+923041779940',
    imageUrl: 'assets/images/customer.jpg',
  ),
);

final productsList = List.generate(
  30,
  (index) => Product(
    id: '$index',
    title: 'Product # ${index + 1}',
    description: 'This is a product description for Product # ${index + 1}',
    quantity: index,
    price: index * 10,
    imageUrls: [
      'https://thumbs.dreamstime.com/z/blue-tennis-shoes-white-backgound-background-front-view-51529498.jpg',
      'https://media.istockphoto.com/id/1218933854/vector/t-shirt-mockup-in-black-white-and-blue-colors-mockup-of-realistic-t-shirt-with-short-sleeves.jpg?s=612x612&w=0&k=20&c=kQGds0peHji1JNG-Xro-nSDD7gQH8HBDTNNmx9M3ZK0=',
      'https://media.istockphoto.com/id/916092484/photo/women-clothes-hanging-on-hangers-clothing-rails-fashion-design.jpg?s=1024x1024&w=is&k=20&c=m_-tKfvNIumZYwW9V_3JO6ulWMPRLhPvXX0gsbJAe58=',
    ],
  ),
);

final tableCols = [
  'Invoice No',
  'Order Time',
  'Customer Name',
  'Payment Method',
  'Amount',
  'Status'
];

final tableRows = List.generate(
  300,
  (index) => [
    index + 1000,
    DateTime.now(),
    'Ali Wajdan ${index}',
    OrderPaymentType.cash,
    index + 1000,
    index % 2 == 0
        ? OrderStatus.Pending
        : index % 3 == 0
            ? OrderStatus.Delivered
            : index % 5 == 0
                ? OrderStatus.Cancel
                : OrderStatus.Processing
  ],
).toList();

final homeMajorStatsList = [
  HomeStatsWidgetModel(
    title: 'Today Orders',
    icon: Icons.attach_money_rounded,
    quantity: 5,
    backgroundColor: Colors.teal,
  ),
  HomeStatsWidgetModel(
    title: 'Yesterday Orders',
    icon: Icons.attach_money_rounded,
    quantity: 2,
    backgroundColor: Colors.deepOrangeAccent,
  ),
  HomeStatsWidgetModel(
    title: 'This Month',
    icon: Icons.shopping_cart_outlined,
    quantity: 45000,
    backgroundColor: Colors.blue,
  ),
  HomeStatsWidgetModel(
    title: 'All Time Earnings',
    icon: Icons.credit_card,
    quantity: 1450000,
    backgroundColor: Colors.green,
    isLast: true,
  ),
];

final homeMiniStatsList = [
  HomeMiniStatsWidgetModel(
    title: 'Total Orders',
    icon: Icons.shopping_cart_outlined,
    value: 8,
    backgroundColor: Colors.orangeAccent,
  ),
  HomeMiniStatsWidgetModel(
    title: 'Total Orders',
    icon: Icons.restart_alt,
    value: 9,
    backgroundColor: Colors.blueAccent,
  ),
  HomeMiniStatsWidgetModel(
    title: 'Total Orders',
    icon: Icons.fire_truck_outlined,
    value: 10,
    backgroundColor: Colors.teal,
  ),
  HomeMiniStatsWidgetModel(
    title: 'Total Orders',
    icon: Icons.done,
    value: 18,
    backgroundColor: Colors.green,
  ),
];

final List<Order> allOrders = List.generate(
  30,
  (index) => Order(
    id: '$index}',
    invoiceNo: index + 1000,
    orderTime: DateTime.utc(2023, index % 12),
    customerName: 'Ali Wajdan $index',
    paymentType:
        index % 2 == 0 ? OrderPaymentType.cash : OrderPaymentType.online,
    amount: index * 30,
    orderStatus: index % 2 == 0
        ? OrderStatus.Pending
        : index % 3 == 0
            ? OrderStatus.Delivered
            : index % 5 == 0
                ? OrderStatus.Cancel
                : OrderStatus.Processing,
  ),
).toList();
