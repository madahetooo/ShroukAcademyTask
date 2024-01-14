import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/posts/data/datasources/local_data_source.dart';
import 'features/posts/data/datasources/remote_data_source.dart';
import 'features/posts/data/respositories/posts_repository_impl.dart';
import 'features/posts/domain/repositories/posts_repisitory.dart';
import 'features/posts/domain/usecases/add_post.dart';
import 'features/posts/domain/usecases/delete_post.dart';
import 'features/posts/domain/usecases/get_all_posts.dart';
import 'features/posts/domain/usecases/update_post.dart';
import 'features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  //! Core
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(locator()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);

  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => InternetConnectionChecker());

  //! Features - Posts
  // Blocs
  locator.registerLazySingleton(
    () => PostsBloc(getAllPosts: locator()),
  );

  locator.registerLazySingleton(
    () => AddDeleteUpdatePostBloc(
      addPost: locator(),
      updatePost: locator(),
      deletePost: locator(),
    ),
  );

  // UseCases
  locator.registerLazySingleton(() => GetAllPostsUseCase(locator()));
  locator.registerLazySingleton(() => AddPostUseCase(locator()));
  locator.registerLazySingleton(() => UpdatePostUseCase(locator()));
  locator.registerLazySingleton(() => DeletePostUseCase(locator()));

  // Repositories
  locator.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      networkInfo: locator(),
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // DataSources
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: locator()),
  );

  locator.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(
      sharedPreferences: locator(),
    ),
  );
}
