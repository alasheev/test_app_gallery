import 'package:either_dart/either.dart';
import 'package:test_app_gallery/core/errors.dart';
import 'package:test_app_gallery/features/photo/domain/entities/photo_file.dart';

import '../repositories/photo_repository.dart';

class GetImage {
  const GetImage(this.repo);

  final PhotoRepository repo;

  Future<Either<Failure, PhotoFile>> call(int id) async {
    return await repo.getImage(id);
  }
}
