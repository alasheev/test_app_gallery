import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_gallery/features/photo/domain/entities/photo_image.dart';

part 'photo_image_model.g.dart';

@JsonSerializable(createToJson: false)
class PhotoImageModel implements PhotoImage {
  const PhotoImageModel({
    required this.id,
    required this.name,
  });

  factory PhotoImageModel.fromJson(Map<String, dynamic> json) => _$PhotoImageModelFromJson(json);

  @override
  final int id;

  @override
  final String name;
}
