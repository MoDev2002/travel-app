// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class Place {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final String details;
  final int price;
  Place(
      {required this.id,
      required this.name,
      required this.details,
      required this.location,
      required this.price,
      required this.imageUrl});
}

class Places with ChangeNotifier {
  List<Place> _places = [
    Place(
        id: 'p1',
        name: 'Baturiti',
        details:
            'Such rice fields are perfect if you want a break from Bali’s most touristic areas. Choose a motorcycle and enter the winding roads in the direction of rice fields of Jatiluwih; wind your hair on a tour of the most beautiful site in Bali. It’s so deep in green that you’re oblivious to it.',
        location: 'Bali, Indonesia',
        price: 15000,
        imageUrl:
            'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1171238184%2F0x0.jpg%3Ffit%3Dscale'),
    Place(
        id: 'p2',
        name: 'Rangali Island',
        details:
            'This tropical nation in the Indian Ocean is made up of more than 1,000 coral islands. It’s home to some of the world’s most luxurious hotel resorts, with white sandy beaches, underwater villas and restaurants and bright blue waters.',
        location: 'Conrad Maldives',
        price: 24999,
        imageUrl:
            'https://res.cloudinary.com/fleetnation/image/private/c_fit,w_1120/g_south,l_text:style_gothic2:%C2%A9%20robertharding,o_20,y_10/g_center,l_watermark4,o_25,y_50/v1532852502/ngyc7dyxg5ecihrpfcej.jpg'),
    Place(
        id: 'p3',
        name: 'Kyoto\'s Ginkaku-ji',
        details:
            'Referred to in English as the Silver Pavilion, Kyoto\'s Ginkaku-ji was constructed in 1482 by Ashikaga Yoshimasa, a shogun who built the home to mimic his great-grandfather\'s villa -- now known as the Golden Pavilion.',
        location: 'Kyoto, Japan',
        price: 18500,
        imageUrl:
            'https://cdn.cnn.com/cnnnext/dam/assets/160330151756-03-japan-temples.jpg'),
    Place(
        id: 'p4',
        name: 'Griekenland',
        details:
            'It is a perfect time to visit Greece, a country that is steeped in history & surrounded by the beauty of the Mediterranean Sea. The natural beauty of Greece with the largest coastline in Europe is unbeatable and the history you will witness in the archaeological sites of Athens and many other Greek cities will definitely stick with you for a long time.',
        location: 'Zakynthos, Greece',
        price: 23900,
        imageUrl:
            'https://d2csxpduxe849s.cloudfront.net/media/D9C47D27-CF22-4106-BDD62A07BB6C91E1/9853E297-020F-4702-9FADBE14D7CC5066/E1B078DB-24CE-4BDF-A88ADAD434FF1C6D/Header%203000-griekenland_santorini_wit-huis_kerk_klif_zee_getty-171574243.jpg'),
    Place(
        id: 'p5',
        name: 'Cape Town',
        details:
            'Cape Town is a dream location to visit: endless natural beauty and clifftop views, pastel pink neighborhoods and turquoise waters.',
        location: 'Cape Town, South Africa',
        price: 10450,
        imageUrl:
            'https://thompsonsafricadbn.files.wordpress.com/2015/11/cape-town_by-night_167962376.jpg?w=1200&h=800&crop=1'),
    Place(
        id: 'p6',
        name: 'Dubai',
        details:
            'The high-flying city of the U.A.E, Dubai is one of the most glamorous destinations you’ll ever visit, and is particularly popular with Big 7 Travel readers.',
        location: 'Dubai, UAE',
        price: 308000,
        imageUrl:
            'https://i.pinimg.com/736x/87/e1/ac/87e1acc21bd57ab9bcf9148f4cdb8a5d.jpg'),
    Place(
        id: 'p7',
        name: 'Cappadocia',
        details:
            'Ogle at the ethereal “fairy chimneys” of central Turkey’s Cappadocia region, where the striking limestone spires and pillars are now peppered with subterranean churches and dwellings etched into the rock. The ground level views wow, but this natural grandeur is best appreciated from above, traveling 16 to 3200-feet in the air with Kapadokya Balloons.',
        location: 'Cappadocia, Turkey',
        price: 8700,
        imageUrl:
            'https://media.cntraveler.com/photos/57bc9b34152835bd6f0b2ace/master/w_1600%2Cc_limit/04-balloons-Cappadocia-GettyImages-130611328.jpg'),
    Place(
        id: 'p8',
        name: 'Rome',
        details:
            'Whether it’s your first time in Rome or your 50th, the best thing about this city is that you’ll always discover something new each time you stroll the scenic streets.',
        location: 'Rome, Italy',
        price: 6500,
        imageUrl:
            'https://cdn.britannica.com/34/170734-050-78F73DE7/St-Peters-Basilica-Rome-Tiber-River.jpg'),
  ];
  List<Place> get places {
    return [..._places];
  }

  findById(String id) {
    return _places.firstWhere((place) => place.id == id);
  }
}
