class ShoppingCart {

  final Map<String, CartItem> _items = {};

  void addItem(String productId, String name, double price, int quantity) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity += quantity;
    } else {
      _items[productId] = CartItem(
        productId: productId,
        name: name,
        price: price,
        quantity: quantity,
      );
    }
  }


  void removeItem(String productId) {
    _items.remove(productId);
  }


  void updateQuantity(String productId, int quantity) {
    if (_items.containsKey(productId)) {
      if (quantity <= 0) {
        removeItem(productId);
      } else {
        _items[productId]!.quantity = quantity;
      }
    }
  }

  double calculateTotal() {
    return _items.values
        .fold(0.0, (total, item) => total + (item.price * item.quantity));
  }

  int get itemCount => _items.length;

  bool get isEmpty => _items.isEmpty;

  List<CartItem> get items => _items.values.toList();

  void clear() {
    _items.clear();
  }

  void displayCart() {
    if (isEmpty) {
      print('Cart is empty');
      return;
    }

    print('\nShopping Cart:');
    print('-------------');
    for (var item in _items.values) {
      print(
          '${item.name} x${item.quantity} - \$${(item.price * item.quantity).toStringAsFixed(2)}');
    }
    print('-------------');
    print('Total: \$${calculateTotal().toStringAsFixed(2)}\n');
  }
}

class CartItem {
  final String productId;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });
}
