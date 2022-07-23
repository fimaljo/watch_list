import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_list/application/search/search_bloc.dart';
import 'package:watch_list/application/search/search_state.dart';
import 'package:watch_list/core/string.dart';
import 'package:watch_list/presentation/overviewpage/overview.dart';

import '../../application/HomePage/homepagedata_bloc.dart';
import '../../application/overView/overview_bloc.dart';
import '../../core/debounse.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const SearchEvent.initialize());
    });
    final _debouncer = Debouncer(milliseconds: 1 * 1000);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              Container(
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
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
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
                  onChanged: (value) {
                    if (value.isEmpty) {
                      return;
                    }
                    _debouncer.run(() {
                      BlocProvider.of<SearchBloc>(context)
                          .add(SearchEvent.searchMovie(movieQuery: value));
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                final tv = state.searchtrendingdata;
                if (state.searchtrendingdata.isEmpty) {
                  return ResultGridview();
                } else {
                  return ResultGridview2();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ResultGridview extends StatelessWidget {
  const ResultGridview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomepagedataBloc>(context)
          .add(const HomepagedataEvent.getTrendingImage());
    });

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
          return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              children: List.generate(
                state.trendingdata.length,
                (index) {
                  // final movie = state.trendingdataforsearch[index];

                  final movie = state.trendingdata[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OverViewPage(
                                movie: movie,
                                moviename: movie.originalTitle ?? "No title",
                                movieimage:
                                    '$imageAppendUrl${movie.posterPath}',
                                movierating: movie.voteAverage.toString(),
                                moviedescription: movie.overview!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '$imageAppendUrl${movie.posterPath}'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
        }
      },
    );
  }
}

class ResultGridview2 extends StatelessWidget {
  const ResultGridview2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(
              state.searchtrendingdata.length,
              (index) {
                final movie = state.searchtrendingdata[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OverViewPage(
                                movie: movie,
                                moviename: movie.originalTitle ?? "",
                                movieimage:
                                    '$imageAppendUrl${movie.posterPath}',
                                movierating: movie.voteAverage.toString(),
                                moviedescription: movie.overview!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                '$imageAppendUrl${movie.posterPath}',
                              ),
                            ),
                          ),
                        )),
                  ),
                );
              },
            ));
      },
    );
  }
}
