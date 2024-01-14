import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_theme.dart';
import 'features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'features/posts/presentation/pages/posts_page.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<PostsBloc>()..add(GetAllPostsEvent()),
        ),
        BlocProvider(create: (_) => locator<AddDeleteUpdatePostBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        home: const PostsPage(),
      ),
    );
  }
}
