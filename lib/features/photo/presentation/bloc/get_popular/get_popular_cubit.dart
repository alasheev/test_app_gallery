import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_gallery/core/errors.dart';
import 'package:test_app_gallery/features/photo/domain/entities/complete_photo.dart';
import 'package:test_app_gallery/features/photo/domain/usecases/get_image.dart';
import 'package:test_app_gallery/features/photo/domain/usecases/get_popular_photos.dart';

part 'get_popular_state.dart';

class GetPopularPhotosCubit extends Cubit<GetPopularState> {
  GetPopularPhotosCubit({
    required this.getPopularPhotos,
    required this.getImage,
  }) : super(GetPopularEmpty());

  final GetPopularPhotos getPopularPhotos;
  final GetImage getImage;

  Future<void> getPopular(int page) async {
    emit(GetPopularLoading());
    final res = await getPopularPhotos(page);
    await res.mapAsync((right) async {
      final List<CompletePhoto> photos = [];
      await Future.forEach(right.data, (photo) async {
        if (photo.image == null) {
          photos.add(CompletePhoto(photo, null));
          return;
        }
        final res = await getImage(photo.image!.id);
        res.fold((left) => null, (right) => photos.add(CompletePhoto(photo, right)));
      });

      emit(GetPopularSuccess(photos: photos, totalPages: right.countOfPages));
    });
    res.mapLeft((left) => emit(GetPopularError(left)));
  }
}
