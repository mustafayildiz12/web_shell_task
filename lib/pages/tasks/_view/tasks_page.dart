// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/task/task.dart';
import 'package:task_list_app/service/network_service.dart';

class TasksPage extends StatefulWidget {
  TasksPage({
    Key? key,
    required this.onChange,
  }) : super(key: key);
  final Function onChange;

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "tasks".tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              color: AppStyle.mediumBlue,
            ),
          ),
          Consumer(builder: (context, ref, child) {
            NetworkService data = ref.watch(networkServiceProvider);
            List<Task> taskList = data.getTasks();
            return ListView.builder(
                shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  var item = taskList[index];
                  return Card(
                    color: AppStyle.lightTextColor,
                    child: ListTile(
                      onTap: () {
                        widget.onChange(newTask: item);
                      },
                      leading: Text(item.id!),
                      title: Text(item.title!),
                      subtitle: Text(item.dateTime!.toIso8601String()),
                    ),
                  );
                });
          })
        ],
      ),
    );
  }
}
