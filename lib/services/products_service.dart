// import 'dart:developer';

import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/product_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class ProductService extends BaseController {
  List<Responseproduct> product = [];
  late Responseproduct productid;

  getDataStory() async {
    product = [];
    var response = await BaseClient()
        .get(
            baseUrl: url,
            api: '/api/public/product?lang=ar&subCategoryId=1&categoryId=1',
            token: '')
        .catchError((error) {
      handleError(error);
    });
    if (response['response'] != null) {
      for (var item in response['response']) {
        product.add(Responseproduct.fromJson(item));
      }
    }
    if (response == null) return;
    return product;
  }

  getDataproductid(var id) async {
    try {
      var response = await BaseClient()
          .get(baseUrl: url, api: '/api/public/product/$id', token: accessToken)
          .catchError((error) {
        handleError(error);
      });

      if (response['response'] != []) {
        productid = Responseproduct.fromJson(response['response']);
      }
      if (response == null) return;
      return productid;
    } catch (e) {
      handleError(e);
    }
  }
}
// class ProductService extends BaseController {
//   List<ResponseProduct> product = [];
//   getDataStory() async {
//     var response = await BaseClient()
//         .get(
//             baseUrl: url,
//             api: '/api/public/product?lang=ar&subCategoryId=1&categoryId=1',
//             token: '')
//         .catchError((error) {
//       handleError(error);
//     });
//     if (response['response'] != null) {
//       for (var item in response['response']) {
//         product.add(ResponseProduct.fromJson(item));
//       }
//     }
//     if (response == null) return;
//     return product;
//   }
// }
