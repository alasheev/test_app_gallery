import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_gallery/core/errors.dart';
import 'package:test_app_gallery/features/photo/domain/entities/complete_photo.dart';
import 'package:test_app_gallery/features/photo/domain/usecases/get_image.dart';
import 'package:test_app_gallery/features/photo/domain/usecases/get_new_photos.dart';

part 'get_new_state.dart';

class GetNewPhotosCubit extends Cubit<GetNewState> {
  GetNewPhotosCubit({
    required this.getNewPhotos,
    required this.getImage,
  }) : super(GetNewEmpty());

  final GetNewPhotos getNewPhotos;
  final GetImage getImage;

  Future<void> getNew(int page) async {
    emit(GetNewLoading());
    final res = await getNewPhotos(page);
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

      emit(GetNewSuccess(photos: photos, totalPages: right.countOfPages));
    });
    res.mapLeft((left) => emit(GetNewError(left)));
  }
}
