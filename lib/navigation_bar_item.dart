final navigationBarItems = [
  NavigationBarItem(name: 'tasks', url: 'tasks'),
  NavigationBarItem(name: 'projects', url: 'projects'),
  NavigationBarItem(name: 'teams', url: 'teams'),
];

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
