import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../models/booking_model.dart';
import '../models/membership_model.dart';

class AppProvider extends ChangeNotifier {
  final List<Service> _packages = [
    Service(
      id: '1',
      name: 'Basic Wash',
      price: 29.99,
      duration: '30 min',
      description: 'Exterior wash, wheel cleaning, and drying',
      imageUrl: 'assets/images/basic.png',
    ),
    Service(
      id: '2',
      name: 'Premium Wash',
      price: 49.99,
      duration: '45 min',
      description: 'Full exterior + interior vacuum and dashboard cleaning',
      imageUrl: 'assets/images/premium.png',
    ),
    Service(
      id: '3',
      name: 'Deluxe Detail',
      price: 89.99,
      duration: '1.5 hr',
      description: 'Complete detailing including wax, polish, and leather care',
      imageUrl: 'assets/images/deluxe.png',
    ),
    Service(
      id: '4',
      name: 'Executive Package',
      price: 149.99,
      duration: '2.5 hr',
      description: 'Full detailing + engine cleaning + ceramic coating',
      imageUrl: 'assets/images/executive.png',
    ),
  ];

  final List<Booking> _bookings = [];
  final Membership _membership = Membership(
    level: 'Silver',
    points: 150,
    nextLevel: 'Gold',
    pointsNeeded: 350,
    benefits: ['5% discount', 'Priority booking', 'Free vacuum'],
  );

  final List<CafeItem> _cafeItems = [
    CafeItem(
      id: 'c1',
      name: 'Espresso',
      price: 3.99,
      description: 'Strong black coffee',
      imageUrl: 'assets/images/espresso.png',
      category: 'Coffee',
    ),
    CafeItem(
      id: 'c2',
      name: 'Cappuccino',
      price: 4.99,
      description: 'Espresso with steamed milk foam',
      imageUrl: 'assets/images/cappuccino.png',
      category: 'Coffee',
    ),
    CafeItem(
      id: 'c3',
      name: 'Pastry Set',
      price: 6.99,
      description: 'Assorted pastries and croissant',
      imageUrl: 'assets/images/pastry.png',
      category: 'Food',
    ),
    CafeItem(
      id: 'c4',
      name: 'Fresh Juice',
      price: 5.99,
      description: 'Freshly squeezed orange or apple juice',
      imageUrl: 'assets/images/juice.png',
      category: 'Beverages',
    ),
    CafeItem(
      id: 'c5',
      name: 'Sandwich',
      price: 7.99,
      description: 'Grilled chicken or veg sandwich',
      imageUrl: 'assets/images/sandwich.png',
      category: 'Food',
    ),
    CafeItem(
      id: 'c6',
      name: 'Smoothie',
      price: 6.49,
      description: 'Berry or mango smoothie',
      imageUrl: 'assets/images/smoothie.png',
      category: 'Beverages',
    ),
  ];

  final List<ChatMessage> _chatMessages = [
    ChatMessage(
      text: 'Welcome to Shine Car Wash! 🚗\nHow can I help you today?',
      isUser: false,
      timestamp: DateTime.now(),
    ),
  ];

  List<Service> get packages => _packages;
  List<Booking> get bookings => _bookings;
  Membership get membership => _membership;
  List<CafeItem> get cafeItems => _cafeItems;
  List<ChatMessage> get chatMessages => _chatMessages;

  void addBooking(Booking booking) {
    _bookings.add(booking);
    _membership.points += 50;
    notifyListeners();
  }

  void addChatMessage(String text, bool isUser) {
    _chatMessages.add(
      ChatMessage(
        text: text,
        isUser: isUser,
        timestamp: DateTime.now(),
      ),
    );

    if (!isUser) {
      Future.delayed(const Duration(seconds: 1), () {
        _chatMessages.add(
          ChatMessage(
            text: _getAutoReply(text),
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
        notifyListeners();
      });
    }
    notifyListeners();
  }

  String _getAutoReply(String message) {
    String msg = message.toLowerCase();
    if (msg.contains('price') || msg.contains('cost')) {
      return 'Our packages start from \$29.99. Check our Packages section for details! 💰';
    } else if (msg.contains('booking') || msg.contains('schedule')) {
      return 'You can book a service through our Booking section. Would you like me to guide you? 📅';
    } else if (msg.contains('membership') || msg.contains('reward')) {
      return 'You earn 50 points per booking. Redeem points for discounts and free services! ⭐';
    } else if (msg.contains('cafe')) {
      return 'We have a cozy cafe with coffee, pastries, and juices. Check our Cafe Menu! ☕';
    } else if (msg.contains('thank')) {
      return 'You\'re welcome! Happy to help 😊';
    } else {
      return 'I\'d be happy to help! You can ask me about packages, booking, membership, or our cafe. 🚗';
    }
  }
}
