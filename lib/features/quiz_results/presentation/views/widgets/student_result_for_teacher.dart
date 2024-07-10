import 'package:flutter/material.dart';

class StudentResultForTeacher extends StatelessWidget {
  const StudentResultForTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(
        Icons.bookmark_sharp,
        size: 30,
      ),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topLeft,
        child: Text(
          'Mina Yasser Shiker',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      subtitle: Text(
        'Section : 5',
      ),
      trailing: Text(
        '5/5',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
