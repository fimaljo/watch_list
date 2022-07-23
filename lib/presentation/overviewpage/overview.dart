import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_list/application/wachlist/wachlist_cubit.dart';

import 'package:watch_list/core/colors.dart';
import 'package:watch_list/domain/homepage/models/homedata.dart';
import 'package:watch_list/domain/watchlist/models/watchlist.dart';

import '../../application/overView/overview_bloc.dart';

class OverViewPage extends StatelessWidget {
  final MainData movie;
  final String moviename;
  final String movieimage;
  final String movierating;
  final String moviedescription;
  const OverViewPage(
      {Key? key,
      required this.movie,
      required this.moviename,
      required this.movieimage,
      required this.movierating,
      required this.moviedescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<OverviewBloc>(context)
          .add(OverviewEvent.movieDetileEvent(movie.id ?? 0));
    });
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                bottom: height * 0.0,
                left: -50,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(82, 156, 164, 173),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 50,
                      sigmaY: 50,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              BlocBuilder<OverviewBloc, OverviewState>(
                builder: (context, state) {
                  final datatv = state.trendingdata;
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.hasError) {
                    return const Center(
                      child: Text("something error"),
                    );
                  } else if (state.trendingdata.isEmpty) {
                    return const Center(
                      child: Text("List is empty"),
                    );
                  } else {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 350,
                                    height: 100,
                                    child: Text(
                                      moviename,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(movieimage),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  movierating,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: const [
                Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 360,
                  child: Text(
                    moviedescription,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 95, top: 40),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    final _transacton = WatchList(
                        movieimage: movieimage,
                        moviename: moviename,
                        movierating: movierating);

                    BlocProvider.of<WachlistCubit>(context)
                        .addToList(_transacton);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 200,
                    child: Text(
                      "Add to List",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                      color: Constants.buttonclour,
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(110, 62, 62, 64),
                            Color.fromARGB(143, 62, 62, 64),
                            Color.fromARGB(110, 62, 62, 64),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Future buttonClickedToAdd(
  //   String mname,
  //  String mimg,
  // String mrting,
  // ) {
  //   final transaction = WatchList()
  //    ..moviename = mname
  //    ..movieimage = mimg
  //    ..movierating = mrting;
  ///  final box = Boxes.getList();
  //  box.add(transaction);
  // }
}
