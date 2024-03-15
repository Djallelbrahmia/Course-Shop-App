import 'package:shop_app/common/entities/user.dart';
import 'package:shop_app/common/utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? param}) async {
    var response =
        await HttpUtil().post('/login', queryParametetrs: param?.toJson());
    return UserLoginResponseEntity.fromJson(response);
  }
}
