import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/notification_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class NotificationService extends BaseController {
  List<ResponseNotification> notification = [];

  getDataNotification() async {
    notification = [];
    try {
      var response = await BaseClient()
          .get(
              baseUrl: url,
              api:
                  '/api/private/notification?limit=8&offset=0&item=true&count=true',
              token: accessToken)
          .catchError((error) {
        handleError(error);
      });
      if (response['response'] != []) {
        for (var item in response['response']['notification']) {
          notification.add(ResponseNotification.fromJson(item));
        }
      }
      if (response == null) return;
      return notification;
    } catch (e) {
      handleError(e);
    }
  }
}
