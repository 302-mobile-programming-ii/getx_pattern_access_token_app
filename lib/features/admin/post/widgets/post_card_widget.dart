import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  VoidCallback? onClick, onDelete;
  String? title, urlImage, body;
  PostCardWidget({
    super.key,
    this.onClick,
    this.title,
    this.urlImage,
    this.body,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 10),
      child: ListTile(
        onTap: onClick,
        leading: Image.network(urlImage ?? ""),
        title: Text(title ?? ""),
        // subtitle: Text(body??""),
        trailing: IconButton(
          onPressed: onDelete,
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}
