import 'package:flutter/material.dart';

class TabSection extends StatelessWidget {
  const TabSection(
      {required this.leadingText, this.tabText = 'View All', this.onTab});
  final String leadingText;
  final String tabText;
  final Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leadingText,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800]),
          ),
          Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTab,
              splashColor: Theme.of(context).primaryColor.withAlpha(45),
              highlightColor: Theme.of(context).primaryColor.withAlpha(35),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tabText,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
