import 'package:cumt_news/page/person_page/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cumt_news/page/list_page/list_model.dart';
import 'package:cumt_news/page/list_page/list_entity.dart';
import '../navigator_page.dart';

toSearchPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const SearchPage(),
    fullscreenDialog: true, // 路由为全屏模式
  ));
}

List<String> history_search = [];

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static List<Data> search = [];

  static bool complete_load = false;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  NewsListModel model = NewsListModel();
  int _page = 1;
  late String text = '';
  final TextEditingController _controller = new TextEditingController();
  final List<String> _type = ["SDXW", "XSJJ", "XSBG", "RWKT", "XWGG", "XYKX"];

  @override
  void initState() {
    // TODO: implement initState
    SearchPage.complete_load = false;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //3min
  Future<void> _load({required String text}) async {
    SearchPage.complete_load = true;
    for (int i = 0; i < _type.length - 5; i++) {
      _page = 1;
      for (; _page < 10; _page++) {
        final entity = await model.getDate(type: _type[i], page: _page);
        if (entity?.data?.isNotEmpty ?? false) {
          for (int i = 0; i < entity!.data!.length; i++) {
            if (entity.data![i].title!.contains(text)) {
              // 匹配成功
              setState(() {
                SearchPage.search.add(entity.data![i]); // 将该元素添加到搜索结果列表中
              });
            }
          }
        } else {
          print(_type[i]);
          break;
        }
      }
    }
    toSearchResult(context);
  }

  @override
  Widget build(BuildContext context) {
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              toNavigatorPage(context, 1);
            },
          ),
          title: const Text(''),
        ),
        body: SearchPage.complete_load
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.blue), // 设置加载动画颜色为白色
                ),
              )
            : Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(16, statusHeight, 16, 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(36)),
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 6),
                                const Icon(Icons.search),
                                const SizedBox(width: 6),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        hintText: '请输入你想搜索的新闻',
                                        border: InputBorder.none),
                                    style: const TextStyle(fontSize: 20),
                                    onChanged: (value) {
                                      setState(() {
                                        SearchPage.search = [];
                                        // 每次文本框改变时，清空搜索结果列表
                                        if (value.isNotEmpty) {
                                          text = value;
                                        }
                                      });
                                    },
                                    controller: _controller,
                                  ),
                                ),
                                text != ""
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {
                                            text = "";
                                          });
                                          _controller.text = text;
                                        },
                                        child: const Icon(Icons.close, size: 18),
                                      )
                                    : Container(),
                                const SizedBox(width: 6)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            if (text.isNotEmpty) {
                              _load(text: text);
                              if (!history_search.contains(text)) {
                                history_search.add(text);
                              }
                            } else {
                              toSearchResult(context);
                            }
                          },
                          child: const Text("搜索",style: TextStyle(fontSize: 18),),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    history_search.isNotEmpty ? ShowHistory() : Container()
                  ],
                ),
              ));
  }

  Widget ShowHistory() {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "搜索历史",
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: showClearDialog,
                  child: const Icon(Icons.delete_forever,
                      color: Colors.redAccent, size: 20),
                )
              ],
            )),
        const SizedBox(
          height: 26,
        ),
        SingleChildScrollView(
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: List.generate(history_search.length, (index) {
              return InkWell(
                onTap: () {
                  _load(text: history_search[index]);
                },
                child: Chip(
                  backgroundColor: Colors.grey[200],
                  label: Text(history_search[index],
                      style: const TextStyle(fontSize: 18)),
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  showClearDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text(""),
            content: const Text("确认清除所有搜索记录吗？\n",style: TextStyle(fontSize: 20),),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text("取消"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: const Text("确定"),
                onPressed: () {
                  setState(() {
                    history_search = [];
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
