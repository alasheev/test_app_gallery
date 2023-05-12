import 'package:test_app_gallery/core/api/api_client.dart';
import 'package:test_app_gallery/features/photo/data/models/get_photos_responce_model.dart';
import 'package:test_app_gallery/features/photo/data/models/photo_file_model.dart';

abstract class PhotoRemoteDatasource {
  Future<GetPhotosResponceModel> getNewPhotos(int page);

  Future<GetPhotosResponceModel> getPopularPhotos(int page);

  Future<PhotoFileModel> getImage(int id);
}

class PhotoRemoteDatasourceImpl implements PhotoRemoteDatasource {
  const PhotoRemoteDatasourceImpl(this.client);

  final ApiClient client;

  @override
  Future<PhotoFileModel> getImage(int id) async {
    final res = await client.sendRequest(
      request: (client) => client.get(
        'api/media_objects/$id',
      ),
    );

    return PhotoFileModel.fromJson(res.data);
  }

  @override
  Future<GetPhotosResponceModel> getNewPhotos(int page) async {
    final res = await client.sendRequest(
      request: (client) => client.get('api/photos', queryParameters: {
        'page': page,
        'limit': 10,
        'new': true,
      }),
    );

    return GetPhotosResponceModel.fromJson(res.data);
  }

  @override
  Future<GetPhotosResponceModel> getPopularPhotos(int page) async {
    final res = await client.sendRequest(
      request: (client) => client.get('api/photos', queryParameters: {
        'page': page,
        'limit': 10,
        'popular': true,
      }),
    );

    return GetPhotosResponceModel.fromJson(res.data);
  }
}