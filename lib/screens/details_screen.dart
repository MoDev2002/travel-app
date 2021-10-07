import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/places.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';
  DetailsScreen({Key? key}) : super(key: key);
  final List<String> images = [
    'https://images.squarespace-cdn.com/content/v1/595480e9b6ac50caf3a9a016/1575857492115-Y8MMOYUWGWIMHZJYU780/Vida-16.jpg',
    'https://bambiniphoto.sg/wp-content/uploads/Graduation-Corporate-Photoshoot-in-studio-013.jpg',
    'https://celebmafia.com/wp-content/uploads/2018/05/park-min-young-namoo-actors-profile-photoshoot-2018-1.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9655bb83693347.5d441357a442c.jpg',
    'https://i.pinimg.com/474x/c3/8d/56/c38d567f1de24ed614d9fa2a0b23bcb2.jpg',
    'https://disaster-analytics.com/wp-content/uploads/2020/01/cropped-Feroz-Headshot-EOS-Website-Staff-Profile-Photoshoot-0089rc.jpg',
    'https://images.squarespace-cdn.com/content/v1/5607a923e4b02ca27d321d51/1592360146734-THUXPVUMZP74PSDZKSXT/Portrait+Profile+Photoshoot-200325-1.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBytQuWghUbwCyqbN9tHK4uqj9LAN7hgu_uQ&usqp=CAU',
    'https://i.imgur.com/73ivRTT.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWAP0SK4m2EYkGUPkJaTW5yt4-OK74SuDetw&usqp=CAU'
  ];
  @override
  Widget build(BuildContext context) {
    final placeId = ModalRoute.of(context)!.settings.arguments as String;
    final placeDetails = Provider.of<Places>(context).findById(placeId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            radius: 22,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 22,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.2),
              radius: 22,
              child: IconButton(
                icon: const Icon(
                  Icons.share_rounded,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.network(
            placeDetails.imageUrl,
            height: 400,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).scaffoldBackgroundColor,
              margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        placeDetails.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.40),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  '5.0',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Icon(
                                Icons.star_border_rounded,
                                color: Colors.white,
                                size: 22,
                              )
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 20,
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        placeDetails.location,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 10,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Details',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        'Facilities',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            fontSize: 22),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    placeDetails.details,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Connect With People Going',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (ctx, i) {
                          return Row(
                            children: [
                              ClipOval(
                                child: Image.network(
                                  images[i],
                                  fit: BoxFit.fill,
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                              const SizedBox(width: 10)
                            ],
                          );
                        }),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: '\$${placeDetails.price}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              )),
                          TextSpan(
                              text: '\n \t \t \t /Per person',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryVariant,
                                fontSize: 14,
                              ))
                        ])),
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                    Theme.of(context).colorScheme.secondary),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(15)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size.fromWidth(200)),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(fontSize: 18),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
