import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/usecases/get_all_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;
  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(PostsLoading());
        final postsOrFailure = await getAllPosts();
        emit(
          _mapFailureOrPostsToState(postsOrFailure),
        );
      } else if (event is RefreshPostsEvent) {
        emit(PostsLoading());
        final postsOrFailure = await getAllPosts();
        emit(
          _mapFailureOrPostsToState(postsOrFailure),
        );
      }
    });
  }

  PostsState _mapFailureOrPostsToState(
      Either<Failure, List<Post>> failureOrPosts) {
    return failureOrPosts.fold(
      (failure) => PostsError(message: _mapFailureToMessage(failure)),
      (posts) => PostsLoaded(posts: posts),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_ERROR;
    }
  }
}
