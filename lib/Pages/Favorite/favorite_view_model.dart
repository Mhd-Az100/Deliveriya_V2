import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/delete_add_model.dart';
import 'package:dilivirya/model/favorite_model.dart';
import 'package:dilivirya/services/favorite_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController with BaseController {
  List<Responsefavorite> favorite = <Responsefavorite>[].obs;
  FavoriteService favoriteService = FavoriteService();
  DeleteResponse? defavorite;
  DeleteResponse? adfavorite;

  var isEmptyfavorite = false.obs;
  getdatafavorite() async {
    isEmptyfavorite = false.obs;
    favorite = await favoriteService.getDatafavorite(0, 8);

    if (favorite.isNotEmpty) {
      print(favorite.isNotEmpty);
      isEmptyfavorite.value = true;
    }
  }

  deletefavorite(id) async {
    defavorite = await favoriteService.deletefavorite(id);
  }

  addfavorite(id, type) async {
    adfavorite = await favoriteService.addfavorite(id, type);
  }
}
