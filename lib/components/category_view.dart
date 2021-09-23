import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView(
      {required this.categories, this.currentIndex = 0, this.onTab});
  final List<String> categories;
  final int currentIndex;
  final ValueChanged<int>? onTab;

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                widget.onTab!.call(index);
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    child: widget.currentIndex == index
                        ? buildCircle(context)
                        : SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 18, top: 5, bottom: 5),
                    child: Text(
                      widget.categories[index],
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: widget.currentIndex == index
                            ? Colors.grey[900]
                            : Colors.blueGrey[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildCircle(BuildContext context) {
    return Container(
      width: 40,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(105),
            blurRadius: 4,
          )
        ],
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(.6),
            Theme.of(context).accentColor.withOpacity(.6)
          ],
        ),
      ),
    );
  }
}
