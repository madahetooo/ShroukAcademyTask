import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/posts_repisitory.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase {
  final PostsRepository postsRepository;

  UpdatePostUseCase(this.postsRepository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await postsRepository.updatePost(post);
  }
}
