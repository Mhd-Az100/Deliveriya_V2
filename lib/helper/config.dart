import 'package:dilivirya/helper/constant.dart';
import 'package:get_storage/get_storage.dart';

String accessToken = '';
String refreshToken = '';
String mapkey = "AIzaSyDUYiMp-AWm0TMsuRRWLOFCyRWkgzj8M_I";
String urlimage = 'https://dilivreya.herokuapp.com/';
String url = 'https://dilivreya.herokuapp.com';
bool chickinopenapp = true;
String? code;
String? phonenumber;
String? password;
final box = GetStorage();
postStorageToken(accessToken, refreshToken) async {
  await box.write('accessToken', accessToken);
  await box.write('refreshToken', refreshToken);
}

bool chickToken() {
  bool chick = true;
  accessToken != '' ? chick = false : chick = true;
  return chick;
}

getStorageToken() async {
  accessToken = await box.read(
    'accessToken',
  );
  refreshToken = await box.read(
    'refreshToken',
  );
}
