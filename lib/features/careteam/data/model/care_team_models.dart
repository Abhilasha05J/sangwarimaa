/// Models for the home-screen "care team" (primary + backup ASHAs).
/// Plain classes with hand-written fromJson, same style as the BPCR response classes.
/// No code generation needed for this file.

Map<String, dynamic> _unwrap(Map<String, dynamic> json) =>
    (json['data'] as Map<String, dynamic>?) ?? json;

class AshaModel {
  final String id; // '' for an ASHA who has an app account but is not in the directory
  final String name;
  final String? fatherHusbandName;
  final String? village; // already in the app language (API `lang`)
  final String? shc; // already in the app language
  final String? block;
  final String? mobile; // masked ("******1234") in picker lists, full in the care-team response
  final bool isPrimary;

  const AshaModel({
    required this.id,
    required this.name,
    this.fatherHusbandName,
    this.village,
    this.shc,
    this.block,
    this.mobile,
    this.isPrimary = false,
  });

  factory AshaModel.fromJson(Map<String, dynamic> json) => AshaModel(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        fatherHusbandName: json['father_husband_name'] as String?,
        village: json['village'] as String?,
        shc: json['shc'] as String?,
        block: json['block'] as String?,
        mobile: json['mobile'] as String?,
        isPrimary: json['is_primary'] as bool? ?? false,
      );

  /// Last 10 digits when the number is a full, callable number; null when masked or missing.
  String? get callableNumber {
    final raw = mobile ?? '';
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 10 || raw.contains('*')) return null;
    return digits.substring(digits.length - 10);
  }

  /// "+91 98261 XXXXX" for display; the real number is only used for the call.
  String? get displayMobile {
    final n = callableNumber;
    if (n != null) return '+91 ${n.substring(0, 5)} XXXXX';
    final m = mobile;
    return (m == null || m.isEmpty) ? null : m;
  }

  /// "LS" for "Lata Bai Sahu".
  String get initials {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts[1].substring(0, 1)).toUpperCase();
  }
}

/// GET /women/asha/options
class AshaOptionsResponse {
  final String? selectedId;
  final List<String> backupIds;
  final List<AshaModel> village; // ASHAs of her village
  final List<AshaModel> shc; // other ASHAs of her SHC
  final List<AshaModel> results; // name search inside her block (only when q is given)

  const AshaOptionsResponse({
    required this.selectedId,
    required this.backupIds,
    required this.village,
    required this.shc,
    required this.results,
  });

  factory AshaOptionsResponse.fromJson(Map<String, dynamic> raw) {
    final json = _unwrap(raw);
    List<AshaModel> list(String key) => (json[key] as List? ?? [])
        .map((e) => AshaModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return AshaOptionsResponse(
      selectedId: json['selected_id'] as String?,
      backupIds: (json['backup_ids'] as List? ?? []).map((e) => e.toString()).toList(),
      village: list('village'),
      shc: list('shc'),
      results: list('results'),
    );
  }
}

/// GET /women/asha and PUT /women/asha/selection
class CareTeamResponse {
  final bool selected;
  final String? source; // 'directory' | 'app' | null
  final AshaModel? primary;
  final List<AshaModel> backups;

  const CareTeamResponse({
    required this.selected,
    required this.source,
    required this.primary,
    required this.backups,
  });

  factory CareTeamResponse.fromJson(Map<String, dynamic> raw) {
    final json = _unwrap(raw);
    return CareTeamResponse(
      selected: json['selected'] as bool? ?? false,
      source: json['source'] as String?,
      primary: json['primary'] == null
          ? null
          : AshaModel.fromJson(json['primary'] as Map<String, dynamic>),
      backups: (json['backups'] as List? ?? [])
          .map((e) => AshaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
