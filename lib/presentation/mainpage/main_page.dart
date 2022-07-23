import 'package:flutter/material.dart';
import 'package:watch_list/presentation/home%20screen/home_page.dart';
import 'package:watch_list/presentation/mainpage/widgets/bottom_naviagtion_widget.dart';
import 'package:watch_list/presentation/watch%20List%20Page/watch_list.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    HomePage(),
    WatchListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }),
        bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }
}
