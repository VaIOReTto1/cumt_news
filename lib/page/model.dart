import 'package:dio/dio.dart';

import 'Entity.dart';

class NewsTypeModel{
  Entity? entity;

  void testFunc({String? future,void Function(String snapshot)? builder}){
    builder!(future!);
  }

  Future<Entity?> getDate()async{
    try{
      Response res=await Dio().get("http://10.0.2.2:5000/news/type");
      entity=Entity.fromJson(res.data);
      return entity;
    }catch(e){
      return null;
    }
  }
}