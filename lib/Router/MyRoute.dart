enum MyRoute { home, search, like, setting }

class MyConfiguration {
final MyRoute myRoute;
final int tab;

const MyConfiguration(this.myRoute, this.tab);
}
