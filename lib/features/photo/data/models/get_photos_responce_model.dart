import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_gallery/features/photo/data/models/photo_model.dart';
import 'package:test_app_gallery/features/photo/domain/entities/get_photos_responce.dart';

part 'get_photos_responce_model.g.dart';

@JsonSerializable(createToJson: false)
class GetPhotosResponceModel implements GetPhotosResponce {
  const GetPhotosResponceModel({
    required this.countOfPages,
    required this.data,
  });

  @override
  final int countOfPages;

  @override
  final List<PhotoModel> data;

  factory GetPhotosResponceModel.fromJson(Map<String, dynamic> json) => _$GetPhotosResponceModelFromJson(json);
}
