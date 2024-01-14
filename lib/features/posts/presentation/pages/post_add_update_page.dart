import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../widgets/post_add_update_page/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;

  const PostAddUpdatePage({super.key, this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(post == null ? 'Add Post' : 'Update Post'),
    );
  }

  Widget _buildBody() {
    return Center(
      child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
        listener: (BuildContext context, AddDeleteUpdatePostState state) {
          if (state is AddDeleteUpdatePostLoaded) {
            SnackBarMessage.showSuccessMessage(
                message: state.message, context: context);
            Navigator.of(context).pop();
          } else if (state is AddDeleteUpdatePostError) {
            SnackBarMessage.showErrorMessage(
                message: state.message, context: context);
          }
        },
        builder: (BuildContext context, AddDeleteUpdatePostState state) {
          if (state is AddDeleteUpdatePostLoading) {
            return const LoadingWidget();
          }
          return FormWidget(post: post);
        },
      ),
    );
  }
}
