import 'package:shop_app/common/entities/entities.dart';
import 'package:shop_app/common/utils/http_util.dart';

class LessonApi {
  static Future<LessonListResponseEntity> lessonList(
      LessonRequestEntity? params) async {
    var response = await HttpUtil()
        .post('/lessonList', queryParametetrs: params?.toJson());
    return LessonListResponseEntity.fromJson(response);
  }

  static Future<LessonDetailResponseEntity> lessonDetail(
      LessonRequestEntity? params) async {
    var response = await HttpUtil()
        .post('/lessonDetail', queryParametetrs: params?.toJson());
    return LessonDetailResponseEntity.fromJson(response);
  }
}
