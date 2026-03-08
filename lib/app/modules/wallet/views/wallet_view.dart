import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wallet_controller.dart';
import '../widgets/wallet_add_button.dart';
import '../widgets/wallet_info_tip.dart';
import '../widgets/wallet_list.dart';
import '../widgets/wallet_list_header.dart';
import '../widgets/wallet_total_balance_card.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        WalletTotalBalanceCard(),
        WalletListHeader(),
        WalletList(),
        const WalletAddButton(),
        const WalletInfoTip(),
      ],
    );
  }
}
