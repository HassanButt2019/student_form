import 'package:flutter/cupertino.dart';

class TextStylee extends StatelessWidget {
  TextStylee(this.title , this.value);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 8, 8, 8),
      child: Column(children: [
        Row(
          children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            SizedBox(width: 10.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
