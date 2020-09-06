import 'package:flutter/material.dart';
class SettingRow extends StatelessWidget {
  SettingRow({
    this.icon,
    this.title = '',
    this.memo = ''
  });
  Widget icon;
  String title;
  String memo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: icon ?? Icon(Icons.folder_outlined),
            margin: EdgeInsets.only(right: 10),
          ),
          Container(
            child: Text(title, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(memo, style: TextStyle(
                color: Color(0xffcbcbcb)
              ),),
            )
          ),
          Container(
            child: Icon(Icons.chevron_right, color: Color(0xffcbcbcb)),
          )
        ],
      ),
    );
  }
}
