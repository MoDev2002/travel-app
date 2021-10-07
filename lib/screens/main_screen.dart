import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/widgets/grid_item.dart';

import '../models/places.dart';
import '../models/categories.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final List<Category> categories = [
    Category('HOTELS', Icons.king_bed_rounded),
    Category('FLIGHTS', Icons.local_airport_outlined),
    Category('FOODS', Icons.restaurant_rounded),
    Category('EVENTS', Icons.event_note_rounded)
  ];
  Widget _buildSearchBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(
              color: Theme.of(context).colorScheme.primaryVariant, width: 1)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            prefixIcon: Icon(Icons.search_rounded,
                size: 24, color: Theme.of(context).colorScheme.primaryVariant),
            hintText: ' Looking for',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.primaryVariant,
              fontSize: 14,
            )),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    width: 75,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: categories[0] == categories[index]
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                    ),
                    child: Icon(
                      categories[index].icon,
                      color: categories[0] == categories[index]
                          ? Colors.white
                          : Theme.of(context).colorScheme.primaryVariant,
                      size: 35,
                    ),
                  ),
                  Text(
                    categories[index].title,
                    style: TextStyle(
                        color: categories[0] == categories[index]
                            ? Colors.white
                            : Theme.of(context).colorScheme.primaryVariant,
                        fontSize: 18),
                  )
                ],
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<Places>(context).places;
    return Padding(
      padding: const EdgeInsets.only(
        top: 45,
        left: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildSearchBar(context),
              const SizedBox(
                width: 20,
              ),
              const CircleAvatar(
                child: null,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Category',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          _buildCategoryList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Best Destination',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                      size: 32,
                    )),
              )
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(2, index.isOdd ? 1.5 : 2),
                  crossAxisCount: 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  itemCount: places.length,
                  itemBuilder: (context, i) => GridItem(
                      imageUrl: places[i].imageUrl,
                      name: places[i].name,
                      id: places[i].id)),
            ),
          ))
        ],
      ),
    );
  }
}
