import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/delete_add_model.dart';
import 'package:dilivirya/model/favorite_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class FavoriteService extends BaseController {
  List<Responsefavorite> favorite = [];
  DeleteResponse? defavorite;
  DeleteResponse? adfavorite;

  getDatafavorite(int offset, int limit) async {
    var response = await BaseClient()
        .get(
            baseUrl: url,
            api: '/api/private/user/favorite?offset=$offset&limit=$limit',
            token: accessToken)
        .catchError((error) {
      handleError(error);
    });
    if (response['response'] != null) {
      for (var item in response['response']) {
        favorite.add(Responsefavorite.fromJson(item));
      }
    }

    if (response == null) return;
    (response);
    return favorite;
  }

  deletefavorite(int id) async {
    var response = await BaseClient()
        .delete(
            baseUrl: url,
            api: '/api/private/user/favorite/$id',
            token: accessToken)
        .catchError((error) {
      handleError(error);
    });
    if (response['response'] != null) {
      defavorite = (DeleteResponse.fromJson(response));
    }

    if (response == null) return;

    return defavorite;
  }

  addfavorite(int id, String type) async {
    var response = await BaseClient()
        .post(
            baseUrl: url,
            api: '/api/private/user/favorite/$id?type=$type',
            body: '',
            token: accessToken)
        .catchError((error) {
      handleError(error);
    });
    print(response);
    if (response['response'] != null) {
      adfavorite = (DeleteResponse.fromJson(response));
    }

    if (response == null) return;

    return adfavorite;
  }
}
