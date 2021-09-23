import 'package:delivery/models/food.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(13), blurRadius: 5),
          ],
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width / 2.25,
      child: Column(
        children: [
          Image(
            image: AssetImage(food.imageUrl),
            height: 110,
          ),
          Text(
            food.name,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(.75),
                shadows: [
                  Shadow(
                      color: Colors.black.withAlpha(30),
                      blurRadius: 2,
                      offset: Offset(1, 1))
                ]),
          ),
          Text(
            food.spec,
            style: TextStyle(color: Colors.blueGrey[200]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '\u0024 ${food.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                onTap: () {},
                splashColor: Colors.white.withOpacity(.5),
                highlightColor: Colors.white.withOpacity(.3),
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
