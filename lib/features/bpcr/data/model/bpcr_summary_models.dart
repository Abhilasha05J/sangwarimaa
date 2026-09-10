enum MilestoneStatus { completed, actionRequired, upcoming }

class JourneyMilestone {
  final String weekLabel;
  final String title;
  final String description;
  final MilestoneStatus status;
  final String? ctaLabel;

  const JourneyMilestone({
    required this.weekLabel,
    required this.title,
    required this.description,
    required this.status,
    this.ctaLabel,
  });
}

enum DomainStatus { completed, pending, action }

class DomainChecklistItem {
  final String label;
  final String subtitle;
  final int scoreEarned;
  final int scoreMax;
  final DomainStatus status;

  const DomainChecklistItem({
    required this.label,
    required this.subtitle,
    required this.scoreEarned,
    required this.scoreMax,
    required this.status,
  });
}

class EmergencyContact {
  final String label;
  final String number;
  const EmergencyContact({required this.label, required this.number});
}