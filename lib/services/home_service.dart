import 'dart:developer';

import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/home_model.dart';
import 'package:dilivirya/model/product_model.dart';
import 'package:dilivirya/model/story_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class HomeService extends BaseController {
  List<ResponseStory> story = [];
  getDataStory() async {
    story = [];
    try {
      var response = await BaseClient()
          .get(baseUrl: url, api: '/api/public/ad', token: accessToken)
          .catchError((error) {
        handleError(error);
      });
      if (response['response'] != null) {
        for (var item in response['response']) {
          story.add(ResponseStory.fromJson(item));
        }
      }
      if (response == null) return;
      return story;
    } catch (e) {
      handleError(e);
    }
  }

  List<Responseproduct> responseproductnew = [];
  getDataHomenew() async {
    responseproductnew = [];
    try {
      var response = await BaseClient()
          .get(
              baseUrl: url,
              api: '/api/public/product/status?status=new',
              token: '')
          .catchError((error) {
        handleError(error);
      });

      if (response['response'] != []) {
        for (var item in response['response']) {
          responseproductnew.add(Responseproduct.fromJson(item));
        }
      }
      if (response == null) return;
      return responseproductnew;
    } catch (e) {
      handleError(e);
    }
  }

  List<Responseproduct> responseproductmost = [];
  getDataHomemostorder() async {
    responseproductmost = [];
    try {
      var response = await BaseClient()
          .get(
              baseUrl: url,
              api: '/api/public/product/status?status=mostOrder',
              token: '')
          .catchError((error) {
        handleError(error);
      });
      if (response['response'] != []) {
        for (var item in response['response']) {
          responseproductmost.add(Responseproduct.fromJson(item));
        }
      }
      if (response == null) return;
      return responseproductmost;
    } catch (e) {
      handleError(e);
    }
  }

  List<Responseproduct> responseproductrecommend = [];
  getDataHomerecommend() async {
    responseproductrecommend = [];
    try {
      var response = await BaseClient()
          .get(
              baseUrl: url,
              api: '/api/public/product/status?status=recommended',
              token: '')
          .catchError((error) {
        handleError(error);
      });

      if (response['response'] != []) {
        for (var item in response['response']) {
          responseproductrecommend.add(Responseproduct.fromJson(item));
        }
      }
      if (response == null) return;
      return responseproductrecommend;
    } catch (e) {
      handleError(e);
    }
  }
}
