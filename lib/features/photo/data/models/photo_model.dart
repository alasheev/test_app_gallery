import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_gallery/features/photo/data/models/photo_image_model.dart';
import 'package:test_app_gallery/features/photo/domain/entities/photo.dart';

part 'photo_model.g.dart';

@JsonSerializable(createToJson: false)
class PhotoModel implements Photo {
  const PhotoModel({
    required this.id,
    required this.name,
    required this.dateCreate,
    required this.description,
    required this.image,
    required this.isNew,
    required this.popular,
    required this.user,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);

  @override
  final int id;

  @override
  final String name;

  @override
  final DateTime dateCreate;

  @override
  final String description;

  @override
  final PhotoImageModel? image;

  @JsonKey(name: 'new')
  @override
  final bool isNew;

  @override
  final bool popular;

  @override
  final String? user;
}
