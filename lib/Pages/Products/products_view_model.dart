import 'package:dilivirya/model/product_model.dart';
import 'package:dilivirya/services/products_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with BaseController {
  var indexCategory = 0.obs;
  var indexSubCategory = 0.obs;

  ProductService productService = ProductService();
  var productid = Responseproduct().obs;
  var isEmptyproductid = false.obs;

  getdataproductid(var id) async {
    isEmptyproductid = false.obs;

    productid.value = await productService.getDataproductid(id);

    if (productid.value != null) isEmptyproductid.value = true;
  }
}
