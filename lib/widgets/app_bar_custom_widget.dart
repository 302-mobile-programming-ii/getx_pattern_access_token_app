import 'package:flutter/material.dart';

class AppBarCustomWidget extends StatelessWidget  implements PreferredSizeWidget{
  Color? backgroundColor;
  String? title;
  List<Widget>? actions;
  Widget? leading;
  bool? centerTitle;
  AppBarCustomWidget({
    super.key,
    this.backgroundColor,
    this.title,
    this.actions,
    this.leading,
    this.centerTitle
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.cyan,
      title: Text(title ?? "", style: TextStyle(color: Colors.white)),
      actions: actions ?? [],
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
