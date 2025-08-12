import 'package:flutter/material.dart';

class AddSomething extends StatelessWidget {
  const AddSomething({
    super.key,
    required this.leading,
    required this.title,
    this.trailing,
  });

  final Widget leading;
  final Widget title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // selected: true,
      // mouseCursor: MouseCurso,
      autofocus: true,
      leading: leading,

      title: title,
      trailing: trailing,
    );
  }
}
