part of 'get_popular_cubit.dart';

abstract class GetPopularState {}

class GetPopularEmpty extends GetPopularState {}

class GetPopularLoading extends GetPopularState {}

class GetPopularError extends GetPopularState {
  final Failure failure;

  GetPopularError(this.failure);
}

class GetPopularSuccess extends GetPopularState {
  final List<CompletePhoto> photos;

  final int totalPages;

  GetPopularSuccess({
    required this.photos,
    required this.totalPages,
  });
}
