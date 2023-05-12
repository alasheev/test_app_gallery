import 'package:test_app_gallery/core/api/api_errors.dart';
import 'package:test_app_gallery/features/photo/data/datasources/photo_remote_datasource.dart';
import 'package:test_app_gallery/features/photo/domain/entities/get_photos_responce.dart';
import 'package:test_app_gallery/features/photo/domain/entities/photo_file.dart';
import 'package:test_app_gallery/core/errors.dart';
import 'package:either_dart/either.dart';
import 'package:test_app_gallery/features/photo/domain/repositories/photo_repository.dart';


class PhotoRepositoryImpl implements PhotoRepository {
  const PhotoRepositoryImpl(this.remoteDataSource);

  final PhotoRemoteDatasource remoteDataSource;

  @override
  Future<Either<Failure, PhotoFile>> getImage(int id) async {
    try {
      final res = await remoteDataSource.getImage(id);
      return Right(res);
    } on ApiNetworkException {
      return Left(ApiNetworkFailure());
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, GetPhotosResponce>> getNewPhotos(int page) async {
    try {
      final res = await remoteDataSource.getNewPhotos(page);
      return Right(res);
    } on ApiNetworkException {
      return Left(ApiNetworkFailure());
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, GetPhotosResponce>> getPopularPhotos(int page) async {
    try {
      final res = await remoteDataSource.getPopularPhotos(page);
      return Right(res);
    } on ApiNetworkException {
      return Left(ApiNetworkFailure());
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
