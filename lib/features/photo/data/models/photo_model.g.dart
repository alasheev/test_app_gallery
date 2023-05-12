// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      id: json['id'] as int,
      name: json['name'] as String,
      dateCreate: DateTime.parse(json['dateCreate'] as String),
      description: json['description'] as String,
      image: json['image'] == null
          ? null
          : PhotoImageModel.fromJson(json['image'] as Map<String, dynamic>),
      isNew: json['new'] as bool,
      popular: json['popular'] as bool,
      user: json['user'] as String?,
    );
