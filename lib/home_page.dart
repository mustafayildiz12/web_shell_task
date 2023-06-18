// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:task_list_app/app_navigation_bar.dart';
import 'package:task_list_app/model/project/project.dart';
import 'package:task_list_app/model/task/task.dart';
import 'package:task_list_app/model/team/team.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';

// This class does not have to be used. It should be replaced with class
// handling navigation using go_router package
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.child,
    required this.state,
  }) : super(key: key);
  final Widget child;
  final GoRouterState state;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
            child: AppNavigationBar(
              state: widget.state,
            ),
          ),
          widget.state.fullPath!.contains("task")
              ? Expanded(
                  flex: 2,
                  child: TasksPage(
                    onChange: updateTaskList,
                  ))
              : widget.state.fullPath!.contains("project")
                  ? Expanded(
                      flex: 2,
                      child: ProjectsPage(
                        onChange: updateProjectList,
                      ))
                  : Expanded(
                      flex: 2,
                      child: TeamsPage(
                        onChange: updateTeamList,
                      ),
                    ),
          VerticalDivider(
            color: Colors.grey,
          ),
          Expanded(flex: 3, child: widget.child)
        ],
      ),
    );
  }

  void updateTaskList({required Task newTask}) {
    context.goNamed("taskDetail", extra: newTask, pathParameters: {
      "id": newTask.id!,
    });
  }

  void updateProjectList({required Project project}) {
    context.goNamed("projectDetail", extra: project, pathParameters: {
      "id": project.id!,
    });
  }

  void updateTeamList({required Team team}) {
    context.goNamed("teamDetail", extra: team, pathParameters: {
      "id": team.id!,
    });
  }
}
