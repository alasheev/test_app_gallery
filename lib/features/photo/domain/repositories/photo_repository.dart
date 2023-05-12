import 'package:test_app_gallery/core/errors.dart';
import 'package:either_dart/either.dart';
import 'package:test_app_gallery/features/photo/domain/entities/get_photos_responce.dart';
import 'package:test_app_gallery/features/photo/domain/entities/photo_file.dart';

abstract class PhotoRepository{
  Future<Either<Failure, GetPhotosResponce>> getNewPhotos(int page);

  Future<Either<Failure, GetPhotosResponce>> getPopularPhotos(int page);

  Future<Either<Failure, PhotoFile>> getImage(int id);
}