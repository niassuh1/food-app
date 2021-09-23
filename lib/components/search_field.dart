import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({this.onTextChange, this.filterOnTap});
  final Function(String)? onTextChange;
  final Function()? filterOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          buildTextField(context),
          SizedBox(
            width: 12,
          ),
          buildFilterButton(context),
        ],
      ),
    );
  }

  Container buildFilterButton(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white.withOpacity(.5),
          highlightColor: Colors.white.withOpacity(.3),
          onTap: this.filterOnTap,
          child: Icon(
            Icons.filter_list_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blueGrey[100]!, width: 1),
        ),
        child: TextField(
          cursorColor: Colors.red,
          onChanged: this.onTextChange,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              height: 1.35,
              color: Colors.blueGrey[100],
              fontSize: 14,
            ),
            hintText: 'Search Here',
            border: InputBorder.none,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/images/search.svg',
                color: Colors.blueGrey[100],
              ),
            ),
            hoverColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
