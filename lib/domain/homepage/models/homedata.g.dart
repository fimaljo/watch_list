// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homedata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Homedata _$HomedataFromJson(Map<String, dynamic> json) => Homedata(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => MainData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomedataToJson(Homedata instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

MainData _$MainDataFromJson(Map<String, dynamic> json) => MainData(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainDataToJson(MainData instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };
