import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatProvider extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  TextEditingController chatingController = TextEditingController();

  bool isFabVisible = false;
  List<Map<String, String>> messages = [];
  Map<String, String> predefinedMessages = {
    "How does smart check-in work?" :"When you book a hotel, you submit your passport or any ID proof for verification. Our AI system then verifies your proof, making the check-in process quick and seamless.?",
    "How are you?": "I'm a bot, but I'm functioning as expected!",
    "Tell me a joke":
        "Why don't scientists trust atoms? Because they make up everything!",
  };

  ChatProvider() {
    scrollController.addListener(_toggleFabVisibility);
  }

  void _toggleFabVisibility() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (isFabVisible) {
        isFabVisible = false;
        notifyListeners();
      }
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!isFabVisible) {
        isFabVisible = true;
        notifyListeners();
      }
    }
  }

  void sendMessage(String text) {
    if (text.isEmpty) {
      return;
    }
    messages.add({'sender': 'user', 'text': text});
    if (predefinedMessages.containsKey(text)) {
      messages.add({'sender': 'bot', 'text': predefinedMessages[text]!});
    }
    scrollToBottom();
    notifyListeners();
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    ).then((_) {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        isFabVisible = false;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(_toggleFabVisibility);
    scrollController.dispose();
    super.dispose();
  }
}
