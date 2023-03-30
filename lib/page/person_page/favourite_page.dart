import 'package:flutter/material.dart';
import '../content_page/content_page.dart';
import '../navigator_page.dart';

toFavouritePage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const FavouritePage(), fullscreenDialog: true, // 路由为全屏模式
  ));
}

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
          title: const Text('我的收藏'),
        ),
        body: ListView.builder(
            controller: _scrollController,
            itemCount: ContentPage.title1.length,
            itemBuilder: (BuildContext context, int index) {
              final reversedIndex = ContentPage.title1.length - index - 1; // 计算反向索引
              return ListTile(
                onTap: () {
                  toContentPage(context,
                      link: ContentPage.link1[reversedIndex],
                      title: ContentPage.title1[reversedIndex],
                      date: ContentPage.date1[reversedIndex],
                  index: reversedIndex);
                },
                title: Text(ContentPage.title1[reversedIndex]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ContentPage.date1[reversedIndex]),
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
