import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/address_model.dart';
import 'package:dilivirya/model/delete_add_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class AddressService extends BaseController {
  List<ResponseAddress> address = [];
  DeleteResponse? deleteResponse;
  getDataAddress() async {
    address = [];
    try {
      var response = await BaseClient()
          .get(
              baseUrl: url,
              api: '/api/private/user/address',
              token: accessToken)
          .catchError((error) {
        handleError(error);
      });
      if (response['response'] != null) {
        for (var item in response['response']) {
          address.add(ResponseAddress.fromJson(item));
        }
      }
      if (response == null) return;
      return address;
    } catch (e) {
      handleError(e);
    }
  }

  deleteAddress(String id) async {
    try {
      var response = await BaseClient()
          .delete(
              baseUrl: url,
              api: '/api/private/user/address/' + id,
              token: accessToken)
          .catchError((error) {
        handleError(error);
      });
      // if (response['response'] != null) {
      //   deleteResponse!.result = response['response'];
      // }
      if (response == null) return false;
      return true;
    } catch (e) {
      handleError(e);
    }
  }

  postAddress(var map) async {
    try {
      var response = await BaseClient()
          .post(
              baseUrl: url,
              api: '/api/private/user/address',
              token: accessToken,
              body: map)
          .catchError((error) {
        handleError(error);
      });
      // if (response['response'] != null) {
      //   deleteResponse!.result = response['response'];
      // }
      if (response == null) false;
      return true;
    } catch (e) {
      handleError(e);
    }
  }

  editAddress(var map, String id) async {
    try {
      var response = await BaseClient()
          .put(
              baseUrl: url,
              api: '/api/private/user/address' + id,
              token: accessToken,
              body: map)
          .catchError((error) {
        handleError(error);
      });
      // if (response['response'] != null) {
      //   deleteResponse!.result = response['response'];
      // }
      if (response == null) false;
      return true;
    } catch (e) {
      handleError(e);
    }
  }
}
