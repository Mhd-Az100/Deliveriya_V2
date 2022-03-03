import 'package:dilivirya/helper/dialog_helper.dart';
import 'package:dilivirya/utils/Error/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    print(error);
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErroDialog(
          description: 'Oops! It took longer to respond.');
    } else {
      DialogHelper.showErroDialog(description: 'Oops! formatException.');
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
