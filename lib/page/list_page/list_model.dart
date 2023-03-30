import 'package:dio/dio.dart';

import 'list_entity.dart';

class NewsListModel {
  ListEntity? entity;

  void testFunc({String? future, void Function(String snapshot)? builder}) {
    builder!(future!);
  }

  Future<ListEntity?> getDate({required String type, int page = 1}) async {
    try {
      Response res = await Dio().get("http://10.0.2.2:5000/news/list",
          queryParameters: {"type": type, "page": page});
      entity = ListEntity.fromJson(res.data);
      return entity;
    } catch (e) {
      return null;
    }
  }
}
