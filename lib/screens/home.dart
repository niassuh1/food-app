import 'package:delivery/components/category_view.dart';
import 'package:delivery/components/item_card.dart';
import 'package:delivery/components/popular_cards.dart';
import 'package:delivery/components/search_field.dart';
import 'package:delivery/components/tab_section.dart';
import 'package:delivery/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Food> foods = [
      Food(
        imageUrl: 'assets/images/meat-burger.png',
        price: 29,
        name: 'Spicy Meat Burger',
        rating: 4.8,
        energy: 820,
      ),
      Food(
        imageUrl: 'assets/images/fried-chicken.png',
        price: 18.23,
        name: 'Fried Chicken',
        rating: 4.8,
        energy: 820,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          buildAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SearchField(
                  filterOnTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 300,
                        );
                      },
                    );
                  },
                ),
                CategoryView(
                  categories: ['Food', 'Grocery', 'Fruits', 'Vegetables'],
                  currentIndex: _currentIndex,
                  onTab: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                ),
                TabSection(
                  leadingText: 'Popular',
                  onTab: () {},
                ),
                PopularCards(foods: foods),
                TabSection(
                  leadingText: 'New Essential Items',
                  onTab: () {},
                ),
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    ItemCard(
                      food: Food(
                        imageUrl: 'assets/images/acai-bowl.png',
                        price: 20,
                        name: 'Acai Bowl',
                        spec: 'Mixed Fruit',
                        rating: 4.8,
                        energy: 820,
                      ),
                    ),
                    ItemCard(
                      food: Food(
                        imageUrl: 'assets/images/pizza.png',
                        price: 28,
                        name: 'Pizza',
                        spec: 'Margarita Pizza',
                        rating: 4.8,
                        energy: 820,
                      ),
                    ),
                    ItemCard(
                      food: Food(
                        imageUrl: 'assets/images/noodle.png',
                        price: 15,
                        name: 'Noodle',
                        spec: 'Spicy Noodle',
                        rating: 4.8,
                        energy: 820,
                      ),
                    ),
                    ItemCard(
                      food: Food(
                        imageUrl: 'assets/images/cereal.png',
                        price: 12,
                        name: 'Cereal',
                        spec: 'Keto Cereal',
                        rating: 4.8,
                        energy: 820,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SliverAppBar buildAppBar() {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.white,
      shadowColor: Colors.black.withAlpha(40),
      leading: IconButton(
        onPressed: () {},
        splashRadius: 20,
        icon: SvgPicture.asset('assets/images/menu.svg'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 20,
          icon: Icon(
            Icons.shopping_bag,
            color: Colors.grey[900],
          ),
        )
      ],
    );
  }
}
