// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/task/task.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({
    Key? key,
    this.id,
    this.task,
  }) : super(key: key);
  final String? id;
  final Task? task;

  @override
  Widget build(BuildContext context) {
    return id != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "task".tr() + " " + id!,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: AppStyle.darkBlue,
                  ),
                ),
                Text(task != null ? task!.description! : "no_result".tr())
              ],
            ),
          )
        : SizedBox();
  }
}
