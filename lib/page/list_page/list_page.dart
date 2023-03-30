import 'package:cumt_news/page/content_page/content_page.dart';
import 'package:cumt_news/page/list_page/list_model.dart';
import 'package:flutter/material.dart';
import 'list_entity.dart';

class ListPage extends StatefulWidget {
  final String type;

  static List<Data> history = [];

  const ListPage({Key? key, required this.type}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  NewsListModel model = NewsListModel();
  List<Data>? _list;
  int _page = 1;
  final ScrollController _scrollController = ScrollController();

  Future<void> _onRefresh() async {
    // TODO: 在这里更新列表数据
    // 这里模拟一个异步操作等待1秒钟
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _list = null;
    });
    _page = 1;
    await _loadData();
  }

  Future<void> _loadData() async {
    final entity = await model.getDate(type: widget.type, page: _page);
    setState(() {
      _list = entity?.data;
    });
  }

  Future<void> _loadMore() async {
    final entity = await model.getDate(type: widget.type, page: _page + 1);
    setState(() {
      _page++;
      _list!.addAll(entity?.data ?? []);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 取消监听器
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: model.getDate(type: widget.type),
        builder: (BuildContext context, AsyncSnapshot<ListEntity?> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: RefreshIndicator(
                onRefresh: _onRefresh,
                child: _list == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: _list!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              toContentPage(context,
                                  link: _list![index].link!,
                                  title: _list![index].title!,
                                  date: _list![index].date!,
                                  index: index);
                              if (ListPage.history.contains(_list![index])) {
                                final int existingIndex =
                                    ListPage.history.indexOf(_list![index]);
                                ListPage.history.removeAt(existingIndex);
                                ListPage.history.add(_list![index]);
                              } else {
                                setState(() {
                                  ListPage.history.add(_list![index]);
                                });
                              }
                            },
                            title: Text(_list![index].title!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_list![index].date!),
                                const Divider(
                                  color: Colors.black12,
                                  thickness: 1,
                                ),
                              ],
                            ),
                          );
                        }),
              ),
              floatingActionButton: Stack(
                children: [
                  Positioned(
                    bottom: 45,
                    right: 5,
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white70.withOpacity(0.5),
                        onPressed: _scrollToTop,
                        child: const Icon(
                          Icons.vertical_align_top_sharp,
                          color: Colors.black87,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Scaffold(
              appBar: null,
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // 设置加载动画颜色为白色
                ),
              ),
            );
          }
        });
  }
}
