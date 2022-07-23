import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_list/application/HomePage/homepagedata_bloc.dart';
import 'package:watch_list/application/overView/overview_bloc.dart';
import 'package:watch_list/application/search/search_bloc.dart';
import 'package:watch_list/application/wachlist/wachlist_cubit.dart';
import 'package:watch_list/domain/core/di/injectable.dart';
import 'package:watch_list/presentation/mainpage/main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'domain/watchlist/models/watchlist.dart';

final dbBox = Hive.box<WatchList>('wachlist');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WatchListAdapter());
  await Hive.openBox<WatchList>('wachlist');
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomepagedataBloc>()),
        BlocProvider(create: (context) => getIt<OverviewBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(
          create: (context) => WachlistCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Color.fromARGB(196, 9, 10, 14)),
          home: ScreenMainPage()),
    );
  }
}
