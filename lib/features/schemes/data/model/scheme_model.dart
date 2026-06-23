import 'package:flutter/material.dart';

/// Represents a single maternal scheme entry in the list.
class SchemeItem {
  final String id;
  final String assetPath; // SVG asset path

  const SchemeItem({required this.id, required this.assetPath});
}

/// Names/descriptions are resolved via l10n keys at render time.
const List<SchemeItem> kMaternalSchemes = [
  SchemeItem(id: 'jsy',       assetPath: 'assets/images/JSY 2.png'),
  SchemeItem(id: 'jssk',      assetPath: 'assets/images/JSSK.png'),
  SchemeItem(id: 'pmsma',     assetPath: 'assets/images/PMSMA.png'),
  SchemeItem(id: 'pmmvy',     assetPath: 'assets/images/PMMVY.png'),
  SchemeItem(id: 'anganwadi', assetPath: 'assets/images/anganwadi.png'),
  SchemeItem(id: 'minimata',  assetPath: 'assets/images/minimata.png'),
];