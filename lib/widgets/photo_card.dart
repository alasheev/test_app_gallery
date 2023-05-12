import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_app_gallery/features/photo/domain/entities/complete_photo.dart';
import 'package:test_app_gallery/pages/photo_details.dart';

class PhotoCard extends StatefulWidget {
  const PhotoCard({required this.photo, super.key});

  final CompletePhoto photo;

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> with AutomaticKeepAliveClientMixin {
  BoxDecoration get decoration => const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.grey,
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PhotoDetailsPage(
                photo: widget.photo,
              ))),
      child: Container(
        decoration: decoration,
        clipBehavior: Clip.antiAlias,
        child: Builder(
          builder: (context) {
            if (widget.photo.file == null) {
              return const Center(child: Text('No Image'));
            }
            final byteImage = const Base64Decoder().convert(widget.photo.file!.file
                .substring(widget.photo.file!.file.indexOf(',') + 1)); //substring for correct parsing
            return Image.memory(
              byteImage,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
