import 'package:flutter/material.dart';
import 'main.dart';
class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController controller= new TextEditingController();

  // List<String> listName=['${data['الإسم بالعربية']}'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
      child: Theme(
          child: TextField(
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                // gapPadding: 200,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              prefixIcon: Icon(Icons.search),
              fillColor: Color(0xFFF2F4F5),
              hintStyle: new TextStyle(color: Colors.grey[600]),
              hintText: "ابحث عما تريد",
            ),
            autofocus: false,
          ),
          data: Theme.of(context).copyWith(
            primaryColor: Colors.grey[600],
          )
          ),
    );
  }
}