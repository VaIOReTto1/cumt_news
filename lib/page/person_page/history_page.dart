import 'package:cumt_news/page/list_page/list_page.dart';
import 'package:cumt_news/page/navigator_page.dart';
import 'package:flutter/material.dart';
import '../content_page/content_page.dart';

toHistoryPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const HistoryPage(), fullscreenDialog: true, // 路由为全屏模式
  ));
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              toNavigatorPage(context, 1);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Clear the list
                setState(() {
                  ListPage.history.clear();
                });
              },
              icon: const Icon(Icons.delete),
            ),
          ],
          title: const Text('历史记录'),
        ),
        body: ListView.builder(
            controller: _scrollController,
            itemCount: ListPage.history.length,
            itemBuilder: (BuildContext context, int index) {
                var reversedIndex = ListPage.history.length - index - 1;
              return ListTile(
                onTap: () {
                  toContentPage(context,
                      link: ListPage.history[reversedIndex].link!,
                      title: ListPage.history[reversedIndex].title!,
                      date: ListPage.history[reversedIndex].date!,index: reversedIndex);
                  if (ListPage.history.contains(ListPage.history[reversedIndex])) {
                    final int existingIndex =
                    ListPage.history.indexOf(ListPage.history[reversedIndex]);
                    ListPage.history.removeAt(existingIndex);
                    ListPage.history.add(ListPage.history[reversedIndex]);
                  } else {
                    setState(() {
                      ListPage.history.add(ListPage.history[reversedIndex]);
                    });
                  }
                },
                title: Text(ListPage.history[reversedIndex].title!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ListPage.history[reversedIndex].date!),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                  ],
                ),
              );
            }),
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
        ));
  }
}
