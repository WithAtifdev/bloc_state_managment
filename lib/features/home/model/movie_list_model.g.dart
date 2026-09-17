// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) =>
    _MovieListModel(
      total: (json['total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 0,
      tvShow:
          (json['tv_shows'] as List<dynamic>?)
              ?.map((e) => TvShows.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MovieListModelToJson(_MovieListModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'tv_shows': instance.tvShow,
    };

_TvShows _$TvShowsFromJson(Map<String, dynamic> json) => _TvShows(
  name: json['name'] as String? ?? '',
  permalink: json['permalink'] as String? ?? '',
  endDate: json['endDate'] as String? ?? '',
  network: json['network'] as String? ?? '',
  imageThumbnailPath: json['imageThumbnailPath'] as String? ?? '',
  status: json['status'] as String? ?? '',
);

Map<String, dynamic> _$TvShowsToJson(_TvShows instance) => <String, dynamic>{
  'name': instance.name,
  'permalink': instance.permalink,
  'endDate': instance.endDate,
  'network': instance.network,
  'imageThumbnailPath': instance.imageThumbnailPath,
  'status': instance.status,
};
