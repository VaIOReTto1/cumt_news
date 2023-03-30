/// author : "李居铭"
/// contents : [{"content":"https://xwzx.cumt.edu.cn/_upload/article/images/7c/a4/d70f58074e47b50311d79a36995c/d5d8557a-7cac-4470-ab1c-61eac2e14caf.jpg","type":"image"},{"content":"开班仪式","type":"text"},{"content":"https://xwzx.cumt.edu.cn/_upload/article/images/7c/a4/d70f58074e47b50311d79a36995c/0d9f1c3b-f8ee-42dc-8eaa-88eb6df89e04.png","type":"image"},{"content":"在孔子博物馆现场教学","type":"text"},{"content":"https://xwzx.cumt.edu.cn/_upload/article/images/7c/a4/d70f58074e47b50311d79a36995c/34f3464e-507b-4a76-b25e-59f4dcd1e394.jpg","type":"image"},{"content":"专家讲座","type":"text"},{"content":"https://xwzx.cumt.edu.cn/_upload/article/images/7c/a4/d70f58074e47b50311d79a36995c/97522b0c-23af-4cbf-9a8d-bdb7f5b2b51c.jpg","type":"image"},{"content":"在孔庙现场教学","type":"text"},{"content":"https://xwzx.cumt.edu.cn/_upload/article/images/7c/a4/d70f58074e47b50311d79a36995c/043997bc-8df5-4d51-beb2-c07d9be6add7.jpg","type":"image"},{"content":"《论语》诵读分享会现场","type":"text"},{"content":"3月17日至19日，我校2023年度首期师德专题教育培训活动在曲阜师范大学举行。活动由党委教师工作部主办，曲阜师范大学优秀传统文化教育中心承办，来自我校各学院共64名教师参加了培训。","type":"text"},{"content":"培训活动以坚定育人理想信念、铸炼育人高尚师德，弘扬优秀师德文化、担当立德树人使命为主旨，通过“师礼润德”仪式、专家主题报告、现场学习体悟、经典阅读研讨等形式引导教师向至圣先师学习，向大先生们学习，努力提升思想政治素质和职业道德自觉，不断增强“为党育人、为国育才”使命意识，争做培养时代新人的“四有”好老师。","type":"text"},{"content":"培训活动得到参训教师的充分肯定，取得良好效果。计算机学院教师尹雨晴说：“很荣幸参加专题培训，去往孔子故乡接受圣贤的思想洗礼。作为新入职老师，在刚刚提交青年基金这个时间点来参加培训，让我从精神上跳出了科研压力来反思自己的教师初心，孔子的伟大思想将会内化为我的教师职业生涯的仁爱担当之心。”信息与控制工程学院教师袁小平说：“参加培训，我的收获可以用‘爱’‘真’和‘变’三个字概括。‘爱’就是作为教师，要对学生充满爱心，不仅关注优秀的学生，更要关注后进的学生；‘真’就是要像至圣孔子那样为了追求真理而勇往直前，培养学生讲真话、做真事，求真务实；‘变’就是对于儒家思想兼收并蓄，推陈出新，在创新中发展，在创新中升华。总之，学习孔子的为‘仁’之道和教育思想，目的就在于努力把自己锻造成大先生，努力为党育人、为国育才！”","type":"text"},{"content":"曲阜师范大学是教育部确定的全国师德师风建设基地，地处“东方圣城”曲阜，建有中国教师博物馆，具有十分丰富的师德教育资源，学校将依托该基地分期分批持续组织教师开展专题教育培训活动。","type":"text"}]
/// date : "2023-03-21"
/// title : "学校举办2023年度首期师德专题教育培训活动"
/// visit_count : 142

class ContentEntity {
  ContentEntity({
      String? author, 
      List<Contents>? contents, 
      String? date, 
      String? title, 
      int? visitCount,}){
    _author = author;
    _contents = contents;
    _date = date;
    _title = title;
    _visitCount = visitCount;
}

  ContentEntity.fromJson(dynamic json) {
    _author = json['author'];
    if (json['contents'] != null) {
      _contents = [];
      json['contents'].forEach((v) {
        _contents?.add(Contents.fromJson(v));
      });
    }
    _date = json['date'];
    _title = json['title'];
    _visitCount = json['visit_count'];
  }
  String? _author;
  List<Contents>? _contents;
  String? _date;
  String? _title;
  int? _visitCount;
ContentEntity copyWith({  String? author,
  List<Contents>? contents,
  String? date,
  String? title,
  int? visitCount,
}) => ContentEntity(  author: author ?? _author,
  contents: contents ?? _contents,
  date: date ?? _date,
  title: title ?? _title,
  visitCount: visitCount ?? _visitCount,
);
  String? get author => _author;
  List<Contents>? get contents => _contents;
  String? get date => _date;
  String? get title => _title;
  int? get visitCount => _visitCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    if (_contents != null) {
      map['contents'] = _contents?.map((v) => v.toJson()).toList();
    }
    map['date'] = _date;
    map['title'] = _title;
    map['visit_count'] = _visitCount;
    return map;
  }

}

/// content : "https://xwzx.cumt.edu.cn/_upload/article/images/7c/a4/d70f58074e47b50311d79a36995c/d5d8557a-7cac-4470-ab1c-61eac2e14caf.jpg"
/// type : "image"

class Contents {
  Contents({
      String? content, 
      String? type,}){
    _content = content;
    _type = type;
}

  Contents.fromJson(dynamic json) {
    _content = json['content'];
    _type = json['type'];
  }
  String? _content;
  String? _type;
Contents copyWith({  String? content,
  String? type,
}) => Contents(  content: content ?? _content,
  type: type ?? _type,
);
  String? get content => _content;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    map['type'] = _type;
    return map;
  }

}