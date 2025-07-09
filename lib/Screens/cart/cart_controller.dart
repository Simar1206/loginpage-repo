import 'package:burgerapp/Screens/AboutMenu/product_discription_card.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //! Use a Map to store product and its quantity
  //! Key: ProductDiscriptionCard, Value: Quantity (int)
  final RxMap<ProductDiscriptionCard, int> cartItems =
      <ProductDiscriptionCard, int>{}.obs;

  void AddtoCart(ProductDiscriptionCard product) {
    if (cartItems.containsKey(product)) {
      //!checking if the card already exisit
      //! If product already in cart, increment quantity
      cartItems[product] = (cartItems[product] ?? 0) + 1;
    } else {
      //! If new product, add with quantity 1
      cartItems[product] = 1;
    }
    Get.snackbar(
      'Added to cart',
      '${product.card_title} has been added your cart',
    );
  }

  void RemovefromCart(ProductDiscriptionCard product) {
    if (cartItems.containsKey(product)) {
      if ((cartItems[product] ?? 0) > 1) {
        //! Decrement quantity if more than 1
        cartItems[product] = (cartItems[product] ?? 0) - 1;
      } else {
        cartItems.remove(product);
      }
    }
    Get.snackbar(
      'Removed From The Cart',
      '${product.card_title} has been removed from your cart.',
    );
  }

  //!inc dec handling
  void IncrementProductQuantity(ProductDiscriptionCard product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = (cartItems[product] ?? 0) + 1;
    }
  }

  void DecrementProductQuantity(ProductDiscriptionCard product) {
    if (cartItems.containsKey(product)) {
      if ((cartItems[product] ?? 0) > 1) {
        cartItems[product] = (cartItems[product] ?? 0) - 1;
      } else {
        // If quantity becomes 0 or less, remove the item
        cartItems.remove(product);
      }
    }
  }

  double get totalCost {
    double total = 0.0;
    cartItems.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  int get totalQuantity {
    int total = 0;
    cartItems.forEach((product, quantity) {
      total += quantity;
    });
    return total;
  }
}
