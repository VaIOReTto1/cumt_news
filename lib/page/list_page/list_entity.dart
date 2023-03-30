/// current_page : 1
/// data : [{"date":"2023-03-21","link":"https://www.cumt.edu.cn/cd/23/c19676a642339/page.htm","title":"深地科学论坛（第五十一讲）：地下储存石油和天然气"},{"date":"2023-03-15","link":"https://www.cumt.edu.cn/cb/32/c19676a641842/page.htm","title":"城市的愿景——中国当代城市发展的实践与探索"},{"date":"2023-03-13","link":"https://www.cumt.edu.cn/c9/84/c19676a641412/page.htm","title":"【杰出学者彭城讲坛】造船焊接技术现状及发展、磁场辅助激光焊接技术研究"},{"date":"2023-03-11","link":"https://www.cumt.edu.cn/c9/3c/c19676a641340/page.htm","title":"【研究生教育创新发展论坛】第二届“流态化研究与应用”青年学者学术沙龙"},{"date":"2023-03-08","link":"https://www.cumt.edu.cn/c8/8a/c19676a641162/page.htm","title":"【研究生教育创新发展论坛】Fundermentals of Fluidization and Regimes of Gas-solid Systems"},{"date":"2023-03-07","link":"https://www.cumt.edu.cn/c8/31/c19676a641073/page.htm","title":"高能量密度、大功率相变储热技术及应用"},{"date":"2023-03-07","link":"https://www.cumt.edu.cn/c8/2a/c19676a641066/page.htm","title":"【研究生教育创新发展论坛】创新专业学位研究生培养模式，加强基地内涵建设"},{"date":"2023-03-03","link":"https://www.cumt.edu.cn/c7/81/c19676a640897/page.htm","title":"科技论文写作规范及发表过程——语言组织、发表步骤"},{"date":"2023-03-01","link":"https://www.cumt.edu.cn/c6/e2/c19676a640738/page.htm","title":"【研究生教育创新发展论坛】研究生选题与研究方法"},{"date":"2023-02-24","link":"https://www.cumt.edu.cn/c6/24/c19676a640548/page.htm","title":"【“强优拓新”学科发展系列】撰写基金申请书的一点体会"},{"date":"2023-02-23","link":"https://www.cumt.edu.cn/c5/f4/c19676a640500/page.htm","title":"【学科建设高端论坛】红土镍矿资源制备不锈钢和能源材料新进展"},{"date":"2023-02-23","link":"https://www.cumt.edu.cn/c5/e5/c19676a640485/page.htm","title":"科技论文写作规范及发表过程-文章分类与结构"},{"date":"2023-02-16","link":"https://www.cumt.edu.cn/c4/6f/c19676a640111/page.htm","title":"【学科建设高端论坛】BGRIMM浮选装备体系发展历程"},{"date":"2022-12-28","link":"https://www.cumt.edu.cn/c1/68/c19676a639336/page.htm","title":"深地科学论坛（第四十九讲）：Seismic Analysis of Tunnels in Himalayan Mixed Geology"}]
/// max_page : 47
/// type : "学术报告"

class ListEntity {
  ListEntity({
      int? currentPage, 
      List<Data>? data, 
      int? maxPage, 
      String? type,}){
    _currentPage = currentPage;
    _data = data;
    _maxPage = maxPage;
    _type = type;
}

  ListEntity.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _maxPage = json['max_page'];
    _type = json['type'];
  }
  int? _currentPage;
  List<Data>? _data;
  int? _maxPage;
  String? _type;
ListEntity copyWith({  int? currentPage,
  List<Data>? data,
  int? maxPage,
  String? type,
}) => ListEntity(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  maxPage: maxPage ?? _maxPage,
  type: type ?? _type,
);
  int? get currentPage => _currentPage;
  List<Data>? get data => _data;
  int? get maxPage => _maxPage;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['max_page'] = _maxPage;
    map['type'] = _type;
    return map;
  }

}

/// date : "2023-03-21"
/// link : "https://www.cumt.edu.cn/cd/23/c19676a642339/page.htm"
/// title : "深地科学论坛（第五十一讲）：地下储存石油和天然气"

class Data {
  Data({
      String? date, 
      String? link, 
      String? title,}){
    _date = date;
    _link = link;
    _title = title;
}

  Data.fromJson(dynamic json) {
    _date = json['date'];
    _link = json['link'];
    _title = json['title'];
  }
  String? _date;
  String? _link;
  String? _title;
Data copyWith({  String? date,
  String? link,
  String? title,
}) => Data(  date: date ?? _date,
  link: link ?? _link,
  title: title ?? _title,
);
  String? get date => _date;
  String? get link => _link;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['link'] = _link;
    map['title'] = _title;
    return map;
  }

}