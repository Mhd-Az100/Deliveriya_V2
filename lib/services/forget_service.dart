import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/sign_up_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class ForgetService extends BaseController {
  postData(var body) async {
    var response = await BaseClient()
        .post(
            baseUrl: url,
            api: '/api/public/auth/get-code?signup=false',
            body: body,
            token: accessToken)
        .catchError((error) {
      handleError(error);
    });
    if (response == null) return;
    return ResponseSignup.fromJson(response['response']);
  }
}
