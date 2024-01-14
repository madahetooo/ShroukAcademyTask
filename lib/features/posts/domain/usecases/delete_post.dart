import '../../../../core/error/failures.dart';
import '../repositories/posts_repisitory.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase {
  final PostsRepository postsRepository;

  DeletePostUseCase(this.postsRepository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await postsRepository.deletePost(postId);
  }
}
