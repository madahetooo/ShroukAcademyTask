part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

final class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostLoading extends AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostLoaded extends AddDeleteUpdatePostState {
  final String message;

  const AddDeleteUpdatePostLoaded({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddDeleteUpdatePostError extends AddDeleteUpdatePostState {
  final String message;

  const AddDeleteUpdatePostError({required this.message});

  @override
  List<Object> get props => [message];
}
