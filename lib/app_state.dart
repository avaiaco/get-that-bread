import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// Gemini Recipe Response from API
  String _GeminiResponse = '';
  String get GeminiResponse => _GeminiResponse;
  set GeminiResponse(String value) {
    _GeminiResponse = value;
  }

  String _ReceiptPic =
      'https://www.shutterstock.com/image-illustration/no-picture-available-placeholder-thumbnail-600nw-2179364083.jpg';
  String get ReceiptPic => _ReceiptPic;
  set ReceiptPic(String value) {
    _ReceiptPic = value;
  }

  String _ChatBotResponse = '';
  String get ChatBotResponse => _ChatBotResponse;
  set ChatBotResponse(String value) {
    _ChatBotResponse = value;
  }

  /// current amount of money saved from gluten tax-reductions
  double _moneySaved = 0.0;
  double get moneySaved => _moneySaved;
  set moneySaved(double value) {
    _moneySaved = value;
  }

  /// amount of recipe's cooked
  int _cookedRecipe = 0;
  int get cookedRecipe => _cookedRecipe;
  set cookedRecipe(int value) {
    _cookedRecipe = value;
  }

  /// amount of recipes saved
  int _savedRecipes = 0;
  int get savedRecipes => _savedRecipes;
  set savedRecipes(int value) {
    _savedRecipes = value;
  }

  int _numOfShopLists = 0;
  int get numOfShopLists => _numOfShopLists;
  set numOfShopLists(int value) {
    _numOfShopLists = value;
  }

  int _sharedRecipes = 0;
  int get sharedRecipes => _sharedRecipes;
  set sharedRecipes(int value) {
    _sharedRecipes = value;
  }

  int _itemsCooked = 0;
  int get itemsCooked => _itemsCooked;
  set itemsCooked(int value) {
    _itemsCooked = value;
  }

  int _purchasedItems = 0;
  int get purchasedItems => _purchasedItems;
  set purchasedItems(int value) {
    _purchasedItems = value;
  }

  String _placeholderPFP = 'https://i.imgur.com/kH4Rro7.png';
  String get placeholderPFP => _placeholderPFP;
  set placeholderPFP(String value) {
    _placeholderPFP = value;
  }

  bool _IsSideBarExpanded = false;
  bool get IsSideBarExpanded => _IsSideBarExpanded;
  set IsSideBarExpanded(bool value) {
    _IsSideBarExpanded = value;
  }
}
