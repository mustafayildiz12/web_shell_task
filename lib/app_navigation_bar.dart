// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:task_list_app/common/app_style.dart';

import 'navigation_bar_item.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({
    Key? key,
    required this.state,
  }) : super(key: key);
  final GoRouterState state;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  List<String> languages = ["TR", "EN"];
  String selectedLanguage = "TR";

  @override
  Widget build(BuildContext context) {
    selectedLanguage = context.locale.languageCode == "tr" ? "TR" : "EN";
    return ColoredBox(
      color: AppStyle.darkBlue,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 64),
              itemCount: navigationBarItems.length,
              itemBuilder: (context, index) => _NavigationBarListItem(
                item: navigationBarItems[index],
                state: widget.state,
              ),
              separatorBuilder: (context, index) => Divider(
                color: AppStyle.mediumBlue,
                height: 1,
                endIndent: 16,
                indent: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  dropdownColor: Colors.amber,
                  isExpanded: true,
                  value: selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                    if (selectedLanguage == "TR") {
                      context.setLocale(Locale("tr", "TR"));
                    } else {
                      context.setLocale(Locale("en", "US"));
                    }
                  },
                  items:
                      languages.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.white)),
                    );
                  }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    Key? key,
    required this.item,
    required this.state,
  }) : super(key: key);
  final GoRouterState state;
  final NavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(item.url);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: state.fullPath!.contains(item.url)
              ? Colors.amber
              : AppStyle.darkBlue,
        ),
        child: Text(
          item.name.tr().toUpperCase(),
          style: TextStyle(
            color: AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
