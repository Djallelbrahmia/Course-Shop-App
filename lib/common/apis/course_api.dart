import 'package:shop_app/common/entities/entities.dart';
import 'package:shop_app/common/utils/http_util.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('/courseList');
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> coursesBought() async {
    var response = await HttpUtil().post('/coursesBought');
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> orderList() async {
    var response = await HttpUtil().post('/orderList');
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetails(
      CourseRequestEntity? params) async {
    var response = await HttpUtil()
        .post('/courseDetail', queryParametetrs: params?.toJson());
    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> coursePay(
      {CourseRequestEntity? params}) async {
    var response =
        await HttpUtil().post('/checkout', queryParametetrs: params?.toJson());
    return BaseResponseEntity.fromJson(response);
  }
}
