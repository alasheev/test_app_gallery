import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_gallery/features/photo/domain/entities/photo_file.dart';

part 'photo_file_model.g.dart';

@JsonSerializable(createToJson: false)
class PhotoFileModel implements PhotoFile {
  const PhotoFileModel({
    required this.file,
    required this.id,
    required this.name,
  });

  factory PhotoFileModel.fromJson(Map<String, dynamic> json) => _$PhotoFileModelFromJson(json);

  @override
  final String file;

  @override
  final int id;

  @override
  final String name;
}
