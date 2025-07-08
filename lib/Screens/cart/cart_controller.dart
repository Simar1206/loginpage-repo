import 'package:burgerapp/Screens/AboutMenu/product_discription_card.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<ProductDiscriptionCard> cartItems =
      <ProductDiscriptionCard>[].obs;

  void AddtoCart(ProductDiscriptionCard product) {
    cartItems.add(product);
    Get.snackbar(
      'Added to cart',
      '${product.card_title} has been added your cart',
    );
  }

  void RemovefromCart(ProductDiscriptionCard product) {
    cartItems.remove(product);
    Get.snackbar(
      'Removed From The Cart',
      '${product.card_title} has been removed from your cart.',
    );
  }
}
