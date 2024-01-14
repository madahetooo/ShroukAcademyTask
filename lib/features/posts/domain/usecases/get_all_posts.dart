import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/posts_repisitory.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase {
  final PostsRepository postsRepository;

  GetAllPostsUseCase(this.postsRepository);

  Future<Either<Failure, List<Post>>> call() async {
    return await postsRepository.getAllPosts();
  }
}
