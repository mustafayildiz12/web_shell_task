import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/model/project/project.dart';
import 'package:task_list_app/model/task/task.dart';
import 'package:task_list_app/model/team/team.dart';
import 'package:task_list_app/pages/projects/_view/project_detail_page.dart';
import 'package:task_list_app/pages/teams/_view/team_detail_page.dart';

import 'pages/tasks/_view/task_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        startLocale: Locale("tr", "TR"),
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
  );
}

final router = GoRouter(
    // ... diğer ayarlar
    initialLocation: '/tasks',
    routes: [
      ShellRoute(
          builder: (context, state, child) {
            return HomePage(
              child: child,
              state: state,
            );
          },
          routes: [
            GoRoute(
                name: "tasks",
                path: "/tasks",
                builder: (context, state) {
                  return TaskDetailPage();
                },
                routes: [
                  GoRoute(
                    name: "taskDetail",
                    path: ":id",
                    builder: (context, state) {
                      String id = state.pathParameters['id']!;
                      return TaskDetailPage(
                        id: id,
                        task: state.extra as Task?,
                      );
                    },
                  ),
                ]),
          ]),
      ShellRoute(
          builder: (context, state, child) {
            return HomePage(child: child, state: state);
          },
          routes: [
            GoRoute(
                name: "projects",
                path: "/projects",
                builder: (context, state) {
                  return ProjectDetailPage();
                },
                routes: [
                  GoRoute(
                    name: "projectDetail",
                    path: ":id",
                    builder: (context, state) {
                      String id = state.pathParameters['id']!;
                      return ProjectDetailPage(
                        id: id,
                        project: state.extra as Project?,
                      );
                    },
                  ),
                ]),
          ]),
      ShellRoute(
          builder: (context, state, child) {
            return HomePage(child: child, state: state);
          },
          routes: [
            GoRoute(
                name: "teams",
                path: "/teams",
                builder: (context, state) {
                  return TeamDetailPage();
                },
                routes: [
                  GoRoute(
                    name: "teamDetail",
                    path: ":id",
                    builder: (context, state) {
                      String id = state.pathParameters['id']!;
                      return TeamDetailPage(
                        id: id,
                        team: state.extra as Team?,
                      );
                    },
                  ),
                ]),
          ]),
    ]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Task list App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routerConfig: router,
    );
  }
}
