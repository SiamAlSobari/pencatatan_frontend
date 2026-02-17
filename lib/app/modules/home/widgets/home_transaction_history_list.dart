import 'package:flutter/material.dart';

class HomeTransactionHistoryList extends StatelessWidget {
  const HomeTransactionHistoryList({super.key});

  Widget _buildTransactionHistoryCard() {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildTransactionHistoryCard(),
          childCount: 10,
        ),
      ),
    );
  }
}
