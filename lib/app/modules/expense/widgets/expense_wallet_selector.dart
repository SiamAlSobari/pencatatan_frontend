import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/expense/controllers/expense_controller.dart';

class ExpenseWalletSelector extends StatelessWidget {
  ExpenseWalletSelector({super.key});
  final controller = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.wallets.isEmpty) {
        return const Center(
          child: Text('Wallet belum ada'),
        );
      }

      return ListView.builder(
        itemCount: controller.wallets.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final wallet = controller.wallets[index];
          return ListTile(
            title: Text(wallet.name),
            subtitle: Text('Saldo: ${wallet.balance}'),
            onTap: () {},
          );
        },
      );
    });
  }
}
