import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_list/application/HomePage/homepagedata_bloc.dart';
import 'package:watch_list/core/colors.dart';
import 'package:watch_list/core/string.dart';
import 'package:watch_list/presentation/searchscreen/search_screen.dart';
import 'package:watch_list/presentation/overviewpage/overview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomepagedataBloc>(context)
          .add(const HomepagedataEvent.getTrendingImage());
    });
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          bgcolor1(height),
          bgcolor2(height),
          bgcolor3(height),
          welcomeCard(height),
          welcomeCardProfileIcon(height),
          SearchField(height, context),
          heading1(height),
          trendingMovieCards(height)
        ],
      ),
    );
  }

  BlocBuilder<HomepagedataBloc, HomepagedataState> trendingMovieCards(
      double height) {
    return BlocBuilder<HomepagedataBloc, HomepagedataState>(
      builder: (context, state) {
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
          return Positioned(
            bottom: height * 0.1,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 350,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: state.trendingdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    final tv = state.trendingdata[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OverViewPage(
                              movie: tv,
                              moviename: tv.originalTitle ?? "No title",
                              movieimage: '$imageAppendUrl${tv.backdropPath}',
                              movierating: tv.voteAverage.toString(),
                              moviedescription: tv.overview ?? "No Description",
                            ),
                          ),
                        );
                      },
                      child: MovieCard(
                        posterpath: '$imageAppendUrl${tv.posterPath}',
                      ),
                    );
                  }),
            ),
          );
        }
      },
    );
  }

  Positioned heading1(double height) {
    return Positioned(
      top: height * 0.2,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ),
            child: Row(
              children: const [
                Text(
                  "Trending ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  "Movies/Shows",
                  style: TextStyle(
                      color: Color.fromARGB(145, 255, 255, 255), fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Positioned SearchField(double height, BuildContext context) {
    return Positioned(
      top: height * 0.1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 34),
            child: Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(110, 62, 62, 64),
                      Color.fromARGB(143, 62, 62, 64),
                      Color.fromARGB(110, 62, 62, 64),
                    ]),
                // color: Constans.blueColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                readOnly: true,
                showCursor: true,
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 96, 96, 100)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned welcomeCardProfileIcon(double height) {
    return Positioned(
        bottom: height * 0.81,
        left: 280,
        child: Row(
          children: [
            Container(
              width: 105,
              height: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C4D03AQEHkEnCRSnfNA/profile-displayphoto-shrink_100_100/0/1656916877603?e=1662595200&v=beta&t=e6CkcEff1rWgYGKVwBGPRdysi5GzWOaygXkUsCt3NqU'))),
            ),
          ],
        ));
  }

  Positioned welcomeCard(double height) {
    return Positioned(
      top: height * 0.0,
      left: -10,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Hello ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  'Fimal',
                  style: TextStyle(
                      color: Color.fromARGB(120, 255, 255, 255), fontSize: 18),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  '        Watch your favorite',
                  style: TextStyle(
                    color: Constants.bgrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned bgcolor3(double height) {
    return Positioned(
      bottom: height * 0.1,
      left: 131,
      child: Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Constants.bgrey2,
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
    );
  }

  Positioned bgcolor2(double height) {
    return Positioned(
      bottom: height * 0.5,
      right: -90,
      child: Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(97, 156, 164, 173),
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
    );
  }

  Positioned bgcolor1(double height) {
    return Positioned(
      bottom: height * 0.6,
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
    );
  }
}

class MovieCard extends StatelessWidget {
  final String posterpath;
  const MovieCard({Key? key, required this.posterpath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 350,
              width: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(posterpath),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
