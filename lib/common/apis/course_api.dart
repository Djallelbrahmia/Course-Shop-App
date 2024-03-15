import 'package:shop_app/common/entities/entities.dart';
import 'package:shop_app/common/utils/http_util.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('/courseList');
    return CourseListResponseEntity.fromJson(response);
  }
}
