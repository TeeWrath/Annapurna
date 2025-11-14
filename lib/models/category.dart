// models/category.dart
import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;

  // Convert hex color string to Color
  static Color _hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      title: json['title'] as String,
      color: _hexToColor(json['color'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'color': '#${color.value.toRadixString(16).substring(2)}',
    };
  }

  @override
  String toString() {
    return 'Category(id: $id, title: $title)';
  }
}