// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/team/team.dart';

class TeamDetailPage extends StatelessWidget {
  const TeamDetailPage({
    Key? key,
    this.id,
    this.team,
  }) : super(key: key);
  final String? id;
  final Team? team;

  @override
  Widget build(BuildContext context) {
    return id != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "team".tr() + " " + id!,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: AppStyle.darkBlue,
                  ),
                ),
                Text(team != null ? team!.description! : "no_result")
              ],
            ),
          )
        : SizedBox();
  }
}
