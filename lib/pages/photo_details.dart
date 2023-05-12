import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app_gallery/features/photo/domain/entities/complete_photo.dart';

class PhotoDetailsPage extends StatelessWidget {
  const PhotoDetailsPage({required this.photo, super.key});

  final CompletePhoto photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPhoto(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    photo.photo.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF2F1767)),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    photo.photo.user ?? 'null',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xFFED5992)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    photo.photo.description,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black38),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    DateFormat('dd MMM. yyyy').format(photo.photo.dateCreate.toLocal()),
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black38),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto() {
    if (photo.file == null) {
      return const Center(child: Text('No Image'));
    }
    final byteImage = const Base64Decoder()
        .convert(photo.file!.file.substring(photo.file!.file.indexOf(',') + 1)); //substring for correct parsing
    return Image.memory(
      byteImage,
      fit: BoxFit.cover,
    );
  }
}
