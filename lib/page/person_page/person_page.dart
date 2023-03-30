import 'package:cumt_news/page/person_page/card_list.dart';
import 'package:cumt_news/page/person_page/person_ui/gradient_border.dart';
import 'package:flutter/material.dart';

toPersonPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const Person(),
    fullscreenDialog: true, // 路由为全屏模式
  ));
}

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 禁用默认的返回箭头
        title: const Text('矿大新闻'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SizedBox(
                width: 18,
              ),
              GradientBound(width: 380, height: 65, border: 2, child: SearchCard()),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SizedBox(
                width: 18,
              ),
              GradientBound(width: 380, height: 65, border: 2, child: HistoryCard()),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SizedBox(
                width: 18,
              ),
              GradientBound(width: 380, height: 65, border: 2, child: FavouriteCard()),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SizedBox(
                width: 18,
              ),
              GradientBound(width: 380, height: 65, border: 2, child: ThemeCard()),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SizedBox(
                width: 18,
              ),
              GradientBound(width: 380, height: 65, border: 2, child: SuggestionCard()),
            ],
          ),
        ],
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
