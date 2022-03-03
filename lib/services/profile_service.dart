import 'dart:developer';

import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/profile.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class ProfileService extends BaseController {
  Responseprofile? profile;

  getDataprofile() async {
    print(accessToken);
    var response = await BaseClient()
        .get(baseUrl: url, api: '/api/private/user/profile', token: accessToken)
        .catchError((error) {
      handleError(error);
    });
    if (response['response'] != null) {
      profile = Responseprofile.fromJson(response['response']);
    }
    if (response == null) return;
    inspect(profile);
    return profile;
  }
}
