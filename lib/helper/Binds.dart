import 'package:dilivirya/Pages/Address/address_view_model.dart';
import 'package:dilivirya/Pages/Authorization/Login/login_view_model.dart';
import 'package:dilivirya/Pages/Authorization/Password/password_view_model.dart';
import 'package:dilivirya/Pages/Authorization/SinUp/sign_view_model.dart';
import 'package:dilivirya/Pages/Authorization/Verfication/verfication_view_model.dart';
import 'package:dilivirya/Pages/Authorization/forget_password/forget_password_view_model.dart';
import 'package:dilivirya/Pages/Cart/cart_view_model.dart';
import 'package:dilivirya/Pages/Favorite/favorite_view_model.dart';
import 'package:dilivirya/Pages/Home/view_model/home_view_model.dart';
import 'package:dilivirya/Pages/Home/view_model/statuses_view_model.dart';
import 'package:dilivirya/Pages/Maps/googlemap_view_model.dart';
import 'package:dilivirya/Pages/Notifications/notifications_view_model.dart';
import 'package:dilivirya/Pages/Offer/offer_view_model.dart';
import 'package:dilivirya/Pages/Products/products_view_model.dart';
import 'package:dilivirya/Pages/Search/search_view_model.dart';
import 'package:dilivirya/Pages/Setting/setting_view_model.dart';
import 'package:get/get.dart';

class Binds extends Bindings {
  @override
  void dependencies() {
    Get.put(SerchController());
    Get.put(SignupController());
    Get.put(LoginController());
    Get.put(AddressController());
    Get.put(CartController());
    Get.put(ForgetController());
    Get.put(PasswordController());
    Get.put(VerficationController());
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(StatusesController());
    Get.put(CouponAndOfferController());
    Get.put(MapController());
    Get.put(FavoriteController());
    Get.put(ProductsController());
    Get.put(NotificationController());
  }
}
