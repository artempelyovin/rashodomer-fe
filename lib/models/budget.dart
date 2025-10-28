class Budget {
  final String id;
  final String name;
  final String description;
  final double amount;
  final String? emojiIcon;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Budget({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.emojiIcon,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
}
