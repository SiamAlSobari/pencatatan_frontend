import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/modules/home/widgets/home_balance_card.dart';
import 'package:mobile/app/modules/home/widgets/home_transactions_action.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeBalanceCard(),
        HomeTransactionsAction(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item #$index')),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
