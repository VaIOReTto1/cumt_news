import 'package:cumt_news/page/person_page/search_page.dart';
import 'package:cumt_news/page/person_page/person_ui/theme_button.dart';
import 'package:flutter/material.dart';
import 'favourite_page.dart';
import 'history_page.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toHistoryPage(context);
      },
      child: const ListTile(
        title: Text('历史记录', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          toSearchPage(context);
        },
        child:SizedBox(
          width: 380,
          height: 65,
          child:Row(
            children: const [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.search),
              SizedBox(
                width: 8,
              ),
              VerticalDivider(
                color: Colors.black38,
                indent: 7,
                endIndent: 7,
              ),
              SizedBox(
                width: 8,
              ),
              Text('搜索', style: TextStyle(fontSize: 20)),
            ],
          ),
          ),
        );
  }
}

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toFavouritePage(context);
      },
      child: const ListTile(
        title: Text('我的收藏', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class ThemeCard extends StatefulWidget {
  const ThemeCard({Key? key}) : super(key: key);

  @override
  State<ThemeCard> createState() => _ThemeCardState();
}

class _ThemeCardState extends State<ThemeCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 58,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '主题颜色',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
              child: ThemeButton()
          ),
        ],
      ),
    );
  }
}

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text('如果对该软件有什么建议和改进，可以添加QQ：’1302140648‘或vx：‘y1302140648’提出',style: TextStyle(fontSize: 20),),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('确定',style: TextStyle(fontSize: 20),),
                ),
              ],
            );
          },
        );
      },
      child: const ListTile(
        title: Text('反馈与建议', style: TextStyle(fontSize: 20)),
      ),);
  }
}



