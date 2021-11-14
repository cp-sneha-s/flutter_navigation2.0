enum MyRoute { home, search, like, setting, detail }

class MyConfiguration {
  final MyRoute myRoute;
  final int tab;

  const MyConfiguration(this.myRoute, this.tab);
}
