import 'package:flutter/material.dart';

import '../screens/details_screen.dart';

class GridItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String id;
  const GridItem(
      {Key? key, required this.imageUrl, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: id);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill)),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.60),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: const [
                    Text(
                      '5.0',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color: Colors.white,
                      size: 18,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
