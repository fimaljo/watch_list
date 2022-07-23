import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_list/application/wachlist/wachlist_cubit.dart';
import 'package:watch_list/core/colors.dart';
import 'package:watch_list/presentation/mainpage/widgets/bottom_naviagtion_widget.dart';

import '../../domain/watchlist/models/watchlist.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: const [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Watchlist",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: BlocBuilder<WachlistCubit, WachlistState>(
              builder: (context, state) {
                if (state.wachLists.isEmpty) {
                  return const Center(
                    child: Text(
                      "List is empty",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  );
                } else {
                  return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.wachLists.length,
                      itemBuilder: (BuildContext contex, index) {
                        final wachListData = state.wachLists[index];

                        BlocProvider.of<WachlistCubit>(contex)
                            .addToList(wachListData);
                        return SlidableListTile(
                          posterpath: wachListData.movieimage,
                          movierating: wachListData.movierating,
                          moviename: wachListData.moviename,
                        );
                      });
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}

class SlidableListTile extends StatelessWidget {
  final String posterpath;
  final String moviename;
  final String movierating;
  const SlidableListTile(
      {Key? key,
      required this.moviename,
      required this.movierating,
      required this.posterpath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 60, bottom: 20),
      child: Container(
          width: 200,
          height: 130,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  // Color.fromARGB(182, 62, 62, 64),
                  Color.fromARGB(182, 62, 62, 64),
                  Color.fromARGB(66, 22, 21, 21),
                ],
              ),
              borderRadius: BorderRadius.circular(17)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Container(
                      height: 105,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(posterpath),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 30),
                          child: Container(
                            width: 130,
                            height: 50,
                            child: Text(
                              moviename,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.fade,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Text(
                                movierating.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            BlocBuilder<WachlistCubit, WachlistState>(
                              builder: (context, state) {
                                return IconButton(
                                    onPressed: () {
                                      for (WatchList dat in state.wachLists) {
                                        int idx = state.wachLists.indexOf(dat);
                                        BlocProvider.of<WachlistCubit>(context)
                                            .deleteList(idx);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ));
                              },
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

//class BNBcustomePainter extends CustomPainter {
// @override
// void paint(Canvas canvas, Size size) {
//   Paint paint = Paint()
//     ..color = Color.fromARGB(196, 9, 10, 14)
//     ..style = PaintingStyle.fill;
//   Path path = Path()..moveTo(size.width * 0.20, 0);
//  path.arcToPoint(Offset(size.width * 0.40, 0),
//      radius: Radius.circular(3), clockwise: false);
//  canvas.drawPath(path, paint);
//}

// @override
// bool shouldRepaint(covariant CustomPainter oldDelegate) {
//   return false;
// }
//}
//child: CustomPaint(
//   size: Size(200, 120),
//   painter: BNBcustomePainter(),
//  ),
