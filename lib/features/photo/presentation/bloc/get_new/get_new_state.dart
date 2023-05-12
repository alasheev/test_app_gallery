part of 'get_new_cubit.dart';

abstract class GetNewState {}

class GetNewEmpty extends GetNewState {}

class GetNewLoading extends GetNewState {}

class GetNewError extends GetNewState {
  final Failure failure;

  GetNewError(this.failure);
}

class GetNewSuccess extends GetNewState {
  final List<CompletePhoto> photos;

  final int totalPages;

  GetNewSuccess({
    required this.photos,
    required this.totalPages,
  });
}
