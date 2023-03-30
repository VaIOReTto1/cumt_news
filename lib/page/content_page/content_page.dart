import 'package:cumt_news/page/content_page/content_ui/content_pdf.dart';
import 'package:cumt_news/page/content_page/content_ui/content_text.dart';
import 'package:cumt_news/page/content_page/content_model.dart';
import 'package:flutter/material.dart';
import 'content_entity.dart';

List<Map<String, dynamic>> favourite = [];

toContentPage(BuildContext context,
    {required String link,
    required String title,
    required String date,
    required int index}) {
  Navigator.of(context).push(_createRoute(
    link: link,
    title: title,
    date: date,
    index: index,
  ));
}

Route _createRoute(
    {required String link,
    required String title,
    required String date,
    required int index}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ContentPage(
      link: link,
      title: title,
      date: date,
      index: index,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class ContentPage extends StatefulWidget {
  static List<String> title1 = [];
  static List<String> date1 = [];
  static List<String> link1 = [];

  final String link;

  final String title;

  final String date;

  final int index;

  const ContentPage(
      {Key? key,
      required this.link,
      required this.title,
      required this.date,
      required this.index})
      : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  NewsContentModel model = NewsContentModel();
  final ScrollController _scrollController = ScrollController();

  Future<ContentEntity?> _refresh() async {
    await Future.delayed(const Duration(seconds: 1)); // 模拟刷新操作
    return await model.getDate(link: widget.link);
  }

  @override
  void initState() {
    super.initState();
    while (favourite.length <= widget.index) {
      favourite.add({'value': '', 'checked': false});
    }
    if (favourite[widget.index]['checked']) {
      return;
    } else {
      favourite[widget.index] = {'value': '', 'checked': false};
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: model.getDate(link: widget.link),
      builder: (BuildContext context, AsyncSnapshot<ContentEntity?> snapshot) {
        return RefreshIndicator(
          onRefresh: _refresh,
          child: snapshot.hasData
              ? Scaffold(
                  appBar: AppBar(
                    title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [Text(widget.title)],
                        )),
                  ),
                  body: ListView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data!.contents!.length,
                    itemBuilder: (BuildContext context, int index) {
                      switch (snapshot.data!.contents![index].type) {
                        case 'text':
                          if (index > 0 &&
                              (snapshot.data!.contents![index - 1].type ==
                                      'image' ||
                                  snapshot.data!.contents![index - 1].type ==
                                      'pdf')) {
                            return Text(
                              snapshot.data!.contents![index].content!,
                              style: const TextStyle(fontSize: 16),
                            );
                          } else {
                            return ContentText(
                                text: snapshot.data!.contents![index].content!);
                          }
                        case 'image':
                          return Image(
                              image: NetworkImage(
                                  snapshot.data!.contents![index].content!));
                        case 'pdf':
                          return ContentPDF(
                              url: snapshot.data!.contents![index].content!);
                        default:
                          return const Text('');
                      }
                    },
                  ),
                  floatingActionButton: Stack(
                    children: [
                      Positioned(
                        bottom: 20,
                        right: 16,
                        child: SizedBox(
                            width: 45,
                            height: 150,
                            child: Column(
                              children: [
                                FloatingActionButton(
                                  backgroundColor:
                                      Colors.white70.withOpacity(0.5),
                                  onPressed: _scrollToTop,
                                  child: const Icon(
                                    Icons.vertical_align_top_sharp,
                                    color: Colors.black87,
                                    size: 30,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3.0,
                                ),
                                FloatingActionButton(
                                  backgroundColor:
                                      Colors.white70.withOpacity(0.5),
                                  onPressed: () {
                                    setState(() {
                                      favourite[widget.index]['checked'] =
                                          !favourite[widget.index]['checked'];
                                      if (!favourite[widget.index]['checked']) {
                                        final int existingIndex = ContentPage
                                            .title1
                                            .indexOf(widget.title);
                                        ContentPage.title1
                                            .removeAt(existingIndex);
                                        final int existingIndex1 = ContentPage
                                            .date1
                                            .indexOf(widget.date);
                                        ContentPage.date1
                                            .removeAt(existingIndex1);
                                        final int existingIndex2 = ContentPage
                                            .link1
                                            .indexOf(widget.link);
                                        ContentPage.link1
                                            .removeAt(existingIndex2);
                                      } else if (favourite[widget.index]
                                              ['checked'] &&
                                          !ContentPage.title1
                                              .contains(widget.title)) {
                                        ContentPage.title1.add(widget.title);
                                        ContentPage.date1.add(widget.date);
                                        ContentPage.link1.add(widget.link);
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: favourite[widget.index]['checked']
                                        ? Colors.redAccent
                                        : Colors.black87,
                                    size: 30,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ))
              : Scaffold(
                  appBar: AppBar(),
                  body: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        );
      },
    );
  }
}
