part of 'api_cubit.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}


class ApiDataLoading extends ApiState {}

class ApiDataEmpty extends ApiState {}

class ApiDataLoaded extends ApiState {
  final Model model;
  ApiDataLoaded(this.model);
}

class ApiError extends ApiState {
  final String message;
  ApiError(this.message);
}
