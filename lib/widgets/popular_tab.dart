import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_app_gallery/core/api/api_errors.dart';
import 'package:test_app_gallery/di.dart';
import 'package:test_app_gallery/features/photo/domain/entities/complete_photo.dart';
import 'package:test_app_gallery/features/photo/domain/entities/photo_file.dart';
import 'package:test_app_gallery/features/photo/presentation/bloc/get_popular/get_popular_cubit.dart';
import 'package:test_app_gallery/widgets/photo_card.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({super.key});

  @override
  State<PopularTab> createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  final List<PhotoFile?> photos = [];

  int? pages;

  final pagingController = PagingController<int, CompletePhoto>(firstPageKey: 1);

  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    await sl<GetPopularPhotosCubit>().getPopular(pageKey);
    final state = sl<GetPopularPhotosCubit>().state;
    if (state is GetPopularSuccess) {
      pages = state.totalPages;
      final isLastPage = pages == null ? false : pages! < pageKey;
      if (isLastPage) {
        pagingController.appendLastPage(state.photos);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(state.photos, nextPageKey);
      }
    }
    if (state is GetPopularError) {
      pagingController.error = state.failure;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetPopularPhotosCubit, GetPopularState>(
      listener: (context, state) {
        if (state is GetPopularError) {
          final failure = state.failure;
          String text;
          if (failure is ApiFailure){
            text = 'ApiFailure: ${failure.data.toString().substring(0, 50)}';
          } else{
            text = 'no internet';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(text),
            ),
          );
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => Future.sync(
            () => pagingController.refresh(),
          ),
          child: PagedGridView<int, CompletePhoto>(
            padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<CompletePhoto>(
              itemBuilder: (context, item, index) {
                return PhotoCard(photo: item);
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.59,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
          ),
        );
      },
    );
  }
}
