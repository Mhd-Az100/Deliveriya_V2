import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/password_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class LoginService extends BaseController {
  postData(var body) async {
    var response = await BaseClient()
        .post(
            baseUrl: url,
            api: '/api/public/auth/login',
            body: body,
            token: accessToken)
        .catchError((error) {
      handleError(error);
    });

    if (response == null) return;
    return Password.fromJson(response['response']['data']);
  }
}
