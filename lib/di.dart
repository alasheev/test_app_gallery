import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_app_gallery/core/api/api_client.dart';
import 'package:test_app_gallery/core/services/network_service.dart';
import 'package:test_app_gallery/features/photo/data/datasources/photo_remote_datasource.dart';
import 'package:test_app_gallery/features/photo/data/repositories/photo_repository_impl.dart';
import 'package:test_app_gallery/features/photo/domain/repositories/photo_repository.dart';
import 'package:test_app_gallery/features/photo/domain/usecases/get_popular_photos.dart';
import 'package:test_app_gallery/features/photo/domain/usecases/get_image.dart';
import 'package:test_app_gallery/features/photo/domain/usecases/get_new_photos.dart';
import 'package:test_app_gallery/features/photo/presentation/bloc/get_new/get_new_cubit.dart';
import 'package:test_app_gallery/features/photo/presentation/bloc/get_popular/get_popular_cubit.dart';


final GetIt sl = GetIt.instance;

Future<void> injectDependencies() async {
  sl.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(InternetConnectionChecker()),
  );

  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(
      dio: Dio(),
      baseUrl: 'https://gallery.prod1.webant.ru/',
      networkService: sl(),
    ),
  );

  sl.registerLazySingleton<PhotoRemoteDatasource>(() => PhotoRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<PhotoRepository>(() => PhotoRepositoryImpl(sl()));

  sl.registerLazySingleton<GetImage>(() => GetImage(sl()));
  sl.registerLazySingleton<GetNewPhotos>(() => GetNewPhotos(sl()));
  sl.registerLazySingleton<GetPopularPhotos>(() => GetPopularPhotos(sl()));

  sl.registerLazySingleton<GetNewPhotosCubit>(() => GetNewPhotosCubit(getImage: sl(), getNewPhotos: sl()));
  sl.registerLazySingleton<GetPopularPhotosCubit>(() => GetPopularPhotosCubit(getImage: sl(), getPopularPhotos: sl()));
}
