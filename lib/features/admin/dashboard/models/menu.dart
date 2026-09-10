import 'package:getx_pattern_access_token_app/routes/route_name.dart';

class Menu {
  int? id;
  String? name;
  String? nameKh;
  String? routeName;

  Menu({this.id, this.name, this.nameKh, this.routeName});

  static List<Menu> getAllMenus() {
    return [
      Menu(
        id: 1,
        name: "Posts",
        nameKh: "ប្រកាស",
        routeName: RouteName.adminPost,
      ),
      Menu(id: 2, name: "Post Category", nameKh: "ប្រភេទប្រកាស", routeName: RouteName.adminCategoryList),
      Menu(id: 3, name: "Articles", nameKh: "អត្ថបទ"),
      Menu(id: 4, name: "Settings", nameKh: "ការកំណត់"),
    ];
  }
}
