import 'package:flutter/material.dart';
class SettingRow extends StatelessWidget {
  SettingRow({
    this.icon,
    this.title = '',
    this.memo = '',
    this.onTab
  });
  Widget icon;
  String title;
  String memo;
  void Function() onTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
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
      ),
    );
  }
}
