import 'package:etourist/app/data/models/place.dart';
import 'package:etourist/app/modules/principal/home/widgets/custom_search_bar.dart';
import 'package:etourist/app/modules/principal/home/widgets/filter_item.dart';
import 'package:etourist/app/modules/principal/home/widgets/place_card.dart';
import 'package:etourist/app/modules/principal/home/widgets/pub_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController searchController = TextEditingController();

  List<Place> places = [
    Place(
      name: 'Place Amazone',
      description: 'La place Amazone est un lieu de rencontre et de détente',
      location: 'Cotonou ,, Bénin',
      language: 'Français',
      distance: 2.5,
      images: [
        'assets/images/place_1.png',
        'assets/images/image_2.png',
        'assets/images/image_3.png',
      ],
    ),
    Place(
      name: 'Place Bio Guerra',
      description: 'La place Amazone est un lieu de rencontre et de détente',
      location: 'Cotonou ,, Bénin',
      language: 'Français',
      distance: 2.5,
      images: [
        'assets/images/image_1.png',
        'assets/images/image_2.png',
        'assets/images/image_3.png',
      ],
    ),
    Place(
      name: 'Place Amazone',
      description: 'La place Amazone est un lieu de rencontre et de détente',
      location: 'Cotonou ,, Bénin',
      language: 'Français',
      distance: 2.5,
      images: [
        'assets/images/image_1.png',
        'assets/images/image_2.png',
        'assets/images/image_3.png',
      ],
    ),
    Place(
      name: 'Place Amazone',
      description: 'La place Amazone est un lieu de rencontre et de détente',
      location: 'Cotonou ,, Bénin',
      language: 'Français',
      distance: 2.5,
      images: [
        'assets/images/image_1.png',
        'assets/images/image_2.png',
        'assets/images/image_3.png',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSearchBar(
                controller: searchController,
                testInputType: TextInputType.text,
                hintText: "Rechercher une place",
                validator: (value) {
                  return null;
                },
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(7),
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/Avatar.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 70,
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Bienvenue sur\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'E',
                    style: TextStyle(
                      color: Color(0xFF0B4D00),
                      fontSize: 27,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: '-',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'TOUR',
                    style: TextStyle(
                      color: Color(0xFF0B4D00),
                      fontSize: 27,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'ISME',
                    style: TextStyle(
                      color: Color(0xFFFF7020),
                      fontSize: 27,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          PubWidget(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterItem(
                    index: 0,
                    iconVal: 'assets/icons/hide.png',
                    text: 'Populaire',
                  ),
                  FilterItem(
                    index: 1,
                    iconVal: 'assets/icons/lac.png',
                    text: 'Lac',
                  ),
                  FilterItem(
                    index: 2,
                    iconVal: 'assets/icons/plage.png',
                    text: 'Plage',
                  ),
                  FilterItem(
                    index: 3,
                    iconVal: 'assets/icons/monument.png',
                    text: 'Monument',
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.34,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PlaceCard(
                    place: places[0],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PlaceCard(
                    place: places[1],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
