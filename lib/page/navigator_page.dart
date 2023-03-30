import 'package:cumt_news/page/list_page/list_page.dart';
import 'package:cumt_news/page/person_page/person_page.dart';
import 'package:flutter/material.dart';
import 'Entity.dart';
import 'model.dart';

toNavigatorPage(BuildContext context, int currentPageIndex) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => NavigatorPage(
      currentPageIndex: currentPageIndex,
    ),
    fullscreenDialog: true, // 路由为全屏模式
  ));
}

class NavigatorPage extends StatefulWidget {
  int currentPageIndex; // 默认显示第一个子组件
  NavigatorPage({Key? key, this.currentPageIndex = 0}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller =
      TabController(length: model.entity!.data!.length, vsync: this);
  NewsTypeModel model = NewsTypeModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: model.getDate(),
        builder: (BuildContext context, AsyncSnapshot<Entity?> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: widget.currentPageIndex == 0
                    ? AppBar(
                        automaticallyImplyLeading: false, // 禁用默认的返回箭头
                        title: const Text('矿大新闻'),
                        bottom: TabBar(
                          isScrollable: true,
                          controller: _controller,
                          tabs: snapshot.data!.data!.map((item) {
                            return Tab(
                              text: item.name,
                            );
                          }).toList(),
                        ),
                        flexibleSpace: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.yellowAccent.withOpacity(0.3),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    : null,
                body: IndexedStack(
                  index: widget.currentPageIndex,
                  children: [
                    TabBarView(
                      controller: _controller,
                      children: snapshot.data!.data!.map((item) {
                        return ListPage(
                          type: item.type!,
                        );
                      }).toList(),
                    ),
                    const Person(),
                  ],
                ),
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.pink, Colors.orange],
                    ),
                  ),
                  child: BottomAppBar(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.home),
                          onPressed: () {
                            setState(() {
                              widget.currentPageIndex = 0;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.person),
                          onPressed: () {
                            setState(() {
                              widget.currentPageIndex = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
