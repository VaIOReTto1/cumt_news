import 'package:cumt_news/page/person_page/person_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_theme.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () {Provider.of<ThemeProvider>(context, listen: false)
                .setThemeData(ThemeData.dark());
            },
            child: Row(
              children: const [
                Icon(
                  Icons.dark_mode,
                  size: 30,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {Provider.of<ThemeProvider>(context, listen: false)
                .setThemeData(ThemeData.light());
            },
            child: Row(
              children: const [
                Icon(
                  Icons.sunny,
                  size: 30,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeData(
                  AppTheme.greenTheme().themeData);
            },
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 30,
                  color: Colors.greenAccent,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeData(
                  AppTheme.yellowTheme().themeData);
            },
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 30,
                  color: Colors.yellowAccent,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeData(AppTheme.greyTheme().themeData);
            },
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 30,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeData(AppTheme.blueTheme().themeData);
            },
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 30,
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeData(AppTheme.redTheme().themeData);
            },
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 30,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeData(AppTheme.pinkTheme().themeData);
            },
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 30,
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeData(
                  AppTheme.purpleTheme().themeData);
            },
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 30,
                  color: Colors.purpleAccent,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
