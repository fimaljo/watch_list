import 'package:json_annotation/json_annotation.dart';

part 'homedata.g.dart';

@JsonSerializable()
class Homedata {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<MainData> results;

  Homedata({this.page, this.results = const []});

  factory Homedata.fromJson(Map<String, dynamic> json) {
    return _$HomedataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomedataToJson(this);
}

@JsonSerializable()
class MainData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  MainData({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.voteAverage,
  });

  factory MainData.fromJson(Map<String, dynamic> json) {
    return _$MainDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}
