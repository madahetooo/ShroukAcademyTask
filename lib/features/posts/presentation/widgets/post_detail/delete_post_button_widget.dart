import '../../../../../core/util/snackbar_message.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../../pages/posts_page.dart';
import 'delete_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeletePostButtonWidget extends StatelessWidget {
  final int postId;

  const DeletePostButtonWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => deleteDialog(context),
      icon: const Icon(Icons.delete),
      label: const Text('Delete'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
    );
  }

  void deleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (BuildContext context, AddDeleteUpdatePostState state) {
            if (state is AddDeleteUpdatePostLoaded) {
              SnackBarMessage.showSuccessMessage(
                message: state.message,
                context: context,
              );

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const PostsPage(),
                ),
                (route) => false,
              );
            } else if (state is AddDeleteUpdatePostError) {
              SnackBarMessage.showErrorMessage(
                message: state.message,
                context: context,
              );

              Navigator.of(context).pop();
            }
          },
          builder: (BuildContext context, AddDeleteUpdatePostState state) {
            if (state is AddDeleteUpdatePostLoading) {
              return const AlertDialog(
                content: LoadingWidget(),
              );
            }

            return DeleteDialogWidget(postId: postId);
          },
        );
      },
    );
  }
}
