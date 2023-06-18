import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/app_constants.dart';
import 'package:task_list_app/model/project/project.dart';
import 'package:task_list_app/model/task/task.dart';
import 'package:task_list_app/model/team/team.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

class NetworkService {
  NetworkService();

  List<Task> getTasks() {
    final now = DateTime.now();
    return [
      Task(
          id: "1",
          title: "title 1",
          dateTime: now,
          description: defaultTaskDescription),
      Task(
          id: "2",
          title: "title 2",
          dateTime: now,
          description: defaultTaskDescription),
      Task(
          id: "3",
          title: "title 3",
          dateTime: now,
          description: defaultTaskDescription),
      Task(
          id: "4",
          title: "title 4",
          dateTime: now,
          description: defaultTaskDescription)
    ];
  }

  List<Project> getProjects() {
    return [
      Project(
          id: "1",
          title: "Project title 1",
          dateTime: DateTime.now(),
          description: defaultProjectDescription),
      Project(
          id: "2",
          title: "Project title 2",
          dateTime: DateTime.now(),
          description: defaultProjectDescription),
      Project(
          id: "3",
          title: "Project title 3",
          dateTime: DateTime.now(),
          description: defaultProjectDescription),
      Project(
          id: "4",
          title: "Project title 4",
          dateTime: DateTime.now(),
          description: defaultProjectDescription)
    ];
  }

  List<Team> getTeams() {
    return [
      Team(
          id: "1",
          title: "Team title 1",
          dateTime: DateTime.now(),
          description: defaultTaskDescription),
      Team(
          id: "2",
          title: "Team title 2",
          dateTime: DateTime.now(),
          description: defaultTaskDescription),
      Team(
          id: "3",
          title: "Team title 3",
          dateTime: DateTime.now(),
          description: defaultTaskDescription),
      Team(
          id: "4",
          title: "Team title 4",
          dateTime: DateTime.now(),
          description: defaultTaskDescription)
    ];
  }
}
