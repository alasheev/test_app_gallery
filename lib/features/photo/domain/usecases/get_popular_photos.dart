import 'package:either_dart/either.dart';
import 'package:test_app_gallery/core/errors.dart';
import 'package:test_app_gallery/features/photo/domain/entities/get_photos_responce.dart';
import 'package:test_app_gallery/features/photo/domain/repositories/photo_repository.dart';

class GetPopularPhotos {
  const GetPopularPhotos(this.repo);

  final PhotoRepository repo;

  Future<Either<Failure, GetPhotosResponce>> call(int page) async {
    return await repo.getPopularPhotos(page);
  }
}

