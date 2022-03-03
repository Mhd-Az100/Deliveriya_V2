import 'package:dilivirya/model/notification_model.dart';
import 'package:dilivirya/services/notification_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController with BaseController {
  List<ResponseNotification> notification = <ResponseNotification>[].obs;
  NotificationService notificationService = NotificationService();

  var isEmptynotification = false.obs;

  getdatanotification() async {
    notification = [];
    isEmptynotification = false.obs;
    notification = await notificationService.getDataNotification();
    isEmptynotification.value = true;
  }
}
