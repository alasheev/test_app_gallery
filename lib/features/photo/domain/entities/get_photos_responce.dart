import 'package:test_app_gallery/features/photo/domain/entities/photo.dart';

class GetPhotosResponce {
  const GetPhotosResponce({
    required this.countOfPages,
    required this.data,
  });

  final int countOfPages;
  final List<Photo> data;
}
