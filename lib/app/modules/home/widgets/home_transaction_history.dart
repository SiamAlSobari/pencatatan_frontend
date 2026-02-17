import 'package:flutter/widgets.dart';

class HomeTransactionHistory extends StatelessWidget {
  const HomeTransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    ));
  }
}
