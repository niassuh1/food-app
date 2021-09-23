import 'package:delivery/models/food.dart';
import 'package:flutter/material.dart';

class PopularCards extends StatelessWidget {
  const PopularCards({required this.foods});
  final List<Food> foods;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.foods.length,
        padding: EdgeInsets.symmetric(vertical: 14),
        itemBuilder: (context, index) {
          Food food = this.foods[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 12),
            shadowColor: Colors.black.withAlpha(65),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              splashColor: Theme.of(context).primaryColor.withOpacity(.1),
              highlightColor: Theme.of(context).accentColor.withOpacity(.2),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(food.imageUrl),
                        height: 120,
                        width: 125,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, right: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\u0024${food.price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  buildAddBtn(context)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildAddBtn(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withAlpha(105),
              blurRadius: 5,
              offset: Offset(1, 1))
        ],
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white.withOpacity(.5),
          highlightColor: Colors.white.withOpacity(.3),
          onTap: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
