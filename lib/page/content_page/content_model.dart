import 'package:dio/dio.dart';

import 'content_entity.dart';

class NewsContentModel {
  ContentEntity? entity;

  void testFunc({String? future, void Function(String snapshot)? builder}) {
    builder!(future!);
  }

  Future<ContentEntity?> getDate({required String link}) async {
    try {
      Response res = await Dio().get("http://10.0.2.2:5000/news/content",
          queryParameters: {"link": link});
      entity = ContentEntity.fromJson(res.data);
      return entity;
    } catch (e) {
      return null;
    }
  }
}
