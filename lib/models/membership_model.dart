class Membership {
  String level;
  int points;
  final String nextLevel;
  final int pointsNeeded;
  final List<String> benefits;

  Membership({
    required this.level,
    required this.points,
    required this.nextLevel,
    required this.pointsNeeded,
    required this.benefits,
  });
}

class CafeItem {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final String category;

  CafeItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
  });
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}