import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/post.dart';
import '../../bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'form_submit_button_widget.dart';
import 'text_form_field_widget.dart';

class FormWidget extends StatefulWidget {
  final Post? post;

  const FormWidget({super.key, this.post});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool isEditMode = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isEditMode = widget.post != null;
    if (isEditMode) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
  }

  void validateAndSubmit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    final post = Post(
      id: widget.post?.id,
      title: titleController.text,
      body: bodyController.text,
    );
    if (isEditMode) {
      BlocProvider.of<AddDeleteUpdatePostBloc>(context)
          .add(UpdatePostEvent(post: post));
    } else {
      BlocProvider.of<AddDeleteUpdatePostBloc>(context)
          .add(AddPostEvent(post: post));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
              name: 'Title', controller: titleController, multiLine: false),
          TextFormFieldWidget(
              name: 'Body', controller: bodyController, multiLine: true),
          FormSubmitButtonWidget(
            isEditMode: isEditMode,
            onSubmit: validateAndSubmit,
          )
        ],
      ),
    );
  }
}
