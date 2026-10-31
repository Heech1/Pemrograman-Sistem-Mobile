import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistController extends GetxController {
  var favoriteIds = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadWishlist();
  }

  Future<void> loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedFavorites = prefs.getStringList('wishlist_data');

    if (savedFavorites != null) {
      favoriteIds.assignAll(savedFavorites);
    }
  }

  Future<void> toggleWishlist(String productId) async {
    final prefs = await SharedPreferences.getInstance();

    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }

    await prefs.setStringList('wishlist_data', favoriteIds.toList());
  }

  bool isFavorite(String productId) {
    return favoriteIds.contains(productId);
  }
}
