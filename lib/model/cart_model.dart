import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier {
  Map<int, int> _cartItems = {};
  Map<int, int> get cartItems => _cartItems;
  double current = 0;



  void addItem(index) {
    if (_cartItems.containsKey(index)) {
      _cartItems[index] += 1;
    } else {
      _cartItems[index] = 1;
    }
    notifyListeners();
  }

  void  totalPrice(price) {
     current = price + current;
     notifyListeners();
  }

  void clear(index) {
    if (_cartItems.containsKey(index)) {
      _cartItems.remove(index);
      notifyListeners();
    }
  }
}
