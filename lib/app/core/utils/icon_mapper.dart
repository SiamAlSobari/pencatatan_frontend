import 'package:flutter/material.dart';

IconData mapIconWallet(String type) {
  switch (type) {
    case 'cash':
      return Icons.account_balance_wallet;
    case 'bank':
      return Icons.account_balance;
    case 'e-wallet':
      return Icons.phone_iphone;
    case 'emergency':
      return Icons.local_hospital;
    case 'savings':
      return Icons.savings;
    case 'other':
      return Icons.more_horiz;
    default:
      return Icons.account_balance_wallet;
  }
}

IconData mapIconCategory(String type) {
  switch (type) {
    case 'food':
      return Icons.fastfood;
    case 'transportation':
      return Icons.directions_car;
    case 'entertainment':
      return Icons.movie;
    case 'shopping':
      return Icons.shopping_cart;
    case 'health':
      return Icons.local_hospital;
    case 'education':
      return Icons.school;
    case 'other':
      return Icons.more_horiz;
    case 'salary':
      return Icons.attach_money;
    case 'freelance':
      return Icons.work;
    case 'investment':
      return Icons.trending_up;
    case 'bonus':
      return Icons.card_giftcard;
    case 'bill':
      return Icons.receipt;
    default:
      return Icons.category;
  }
}
