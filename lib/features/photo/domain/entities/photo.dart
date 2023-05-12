import 'package:test_app_gallery/features/photo/domain/entities/photo_image.dart';

class Photo {
  final int id;
  final String name;
  final DateTime dateCreate;
  final String description;
  final bool isNew;
  final bool popular;
  final PhotoImage? image;
  final String? user;

  const Photo({
    required this.id,
    required this.name,
    required this.dateCreate,
    required this.description,
    required this.isNew,
    required this.popular,
    required this.image,
    required this.user,
  });
}
