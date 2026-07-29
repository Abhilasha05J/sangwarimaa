import 'package:flutter/material.dart';

class DangerSignCardData {
  final String imageAsset;
  final String title;
  final String description;
  final Color accentColor;

  const DangerSignCardData({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.accentColor,
  });
}