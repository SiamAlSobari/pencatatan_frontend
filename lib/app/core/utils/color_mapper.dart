import 'package:flutter/widgets.dart';

Color mapCategoryColor(String category) {
  switch (category.toLowerCase()) {
    case 'food':
      return const Color(0xFFE57373); // Red
    case 'transportation':
      return const Color(0xFF64B5F6); // Blue
    case 'entertainment':
      return const Color(0xFFFFB74D); // Orange
    case 'utilities':
      return const Color(0xFF81C784); // Green
    case 'health':
      return const Color(0xFFBA68C8); // Purple
    case 'bonus':
      return const Color(0xFF4DB6AC); // Teal
    case 'salary':
      return const Color(0xFF7986CB); // Indigo
    case 'shopping':
      return const Color(0xFFFFD54F); // Yellow
    default:
      return const Color(0xFF90A4AE); // Grey for unknown categories
  }
}

Color mapWalletColor(String type) {
  switch (type.toLowerCase()) {
    case 'cash':
      return const Color(0xFFFFD54F); // Yellow
    case 'bank':
      return const Color(0xFF4DB6AC); // Teal
    case 'e-wallet':
      return const Color(0xFF7986CB); // Indigo
    case 'investment':
      return const Color(0xFF9575CD); // Deep Purple
    case 'savings':
      return const Color(0xFF4FC3F7); // Light Blue
    case 'emergency':
      return const Color(0xFFE57373); // Red
    default:
      return const Color(0xFFB0BEC5); // Light Grey for unknown types
  }
}
