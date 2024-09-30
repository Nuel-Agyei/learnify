import 'package:flutter/material.dart';
class FlashcardProvider extends ChangeNotifier {
  List<String> decks = [];

  void addDeck(String deck) {
    decks.add(deck);
    notifyListeners();
  }


}
