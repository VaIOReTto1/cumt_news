import 'package:cumt_news/page/person_page/search_page.dart';
import 'package:flutter/material.dart';
import '../content_page/content_page.dart';
import '../list_page/list_page.dart';
import '../navigator_page.dart';

toSearchResult(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => SearchResult(),
    fullscreenDialog: true, // 路由为全屏模式
  ));
}

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SearchPage.search.isNotEmpty?Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              toNavigatorPage(context, 1);
            },
          ),
          title: const Text('搜索结果'),
        ),
        body: ListView.builder(
            controller: _scrollController,
            itemCount: SearchPage.search.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  toContentPage(context,
                      link: SearchPage.search[index].link!,
                      title: SearchPage.search[index].title!,
                      date: SearchPage.search[index].date!,
                      index: index);
                  if (ListPage.history.contains(SearchPage.search[index])) {
                    final int existingIndex =
                    ListPage.history.indexOf(SearchPage.search[index]);
                    ListPage.history.removeAt(existingIndex);
                    ListPage.history.add(SearchPage.search[index]);
                  } else {
                    setState(() {
                      ListPage.history.add(SearchPage.search[index]);
                    });
                  }
                },
                title: Text(SearchPage.search[index].title!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(SearchPage.search[index].date!),
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
        )
    ):Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            toNavigatorPage(context, 1);
          },
        ),
        title: const Text('搜索结果'),
      ),
      body: const Center(
        child: Text("未搜索到相关结果",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}


