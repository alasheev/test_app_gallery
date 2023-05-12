import 'package:test_app_gallery/features/photo/domain/entities/photo.dart';
import 'package:test_app_gallery/features/photo/domain/entities/photo_file.dart';

class CompletePhoto {
  const CompletePhoto(
    this.photo,
    this.file,
  );

  final Photo photo;

  final PhotoFile? file;
}
