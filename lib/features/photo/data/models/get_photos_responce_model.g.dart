// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_photos_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPhotosResponceModel _$GetPhotosResponceModelFromJson(
        Map<String, dynamic> json) =>
    GetPhotosResponceModel(
      countOfPages: json['countOfPages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
