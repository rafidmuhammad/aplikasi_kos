import 'package:aplikasi_kos/models/city.dart';
import 'package:aplikasi_kos/models/space.dart';
import 'package:aplikasi_kos/models/tips.dart';
import 'package:aplikasi_kos/providers/space_provider.dart';
import 'package:aplikasi_kos/theme.dart';
import 'package:aplikasi_kos/widget/cards.dart';
import 'package:aplikasi_kos/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          //NOTE: Title/Header
          padding: EdgeInsets.only(left: edge, top: edge),
          child: ListView(
            children: [
              Text(
                "Explore Now",
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Mencari kosan yang cozy",
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              //NOTE: Popular Spaces
              Text(
                "Popular Cities",
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(
                      city: City(
                        id: 1,
                        location: "Jakarta",
                        imageUrl: "assets/images/image1.png",
                      ),
                    ),
                    CityCard(
                      city: City(
                          id: 1,
                          location: "Bandung",
                          imageUrl: "assets/images/image2.png",
                          isFavorite: true),
                    ),
                    CityCard(
                      city: City(
                        id: 1,
                        location: "Surabaya",
                        imageUrl: "assets/images/image3.png",
                      ),
                    ),
                    CityCard(
                      city: City(
                        id: 1,
                        location: "Palembang",
                        imageUrl: "assets/images/image4.png",
                      ),
                    ),
                    CityCard(
                      city: City(
                          id: 1,
                          location: "Aceh",
                          imageUrl: "assets/images/image5.png",
                          isFavorite: true),
                    ),
                    CityCard(
                      city: City(
                        id: 1,
                        location: "Bogor",
                        imageUrl: "assets/images/image6.png",
                      ),
                    ),
                  ],
                ),
              ),
              //NOTE : Recommended Spaces
              const SizedBox(
                height: 30,
              ),
              Text(
                "Recommended Space",
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: ((context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;
                      return Column(
                          children: data
                              .map((item) => SpaceCard(space: item))
                              .toList());
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })),

              const SizedBox(
                height: 2,
              ),
              Text(
                "Tips & Guidance",
                style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              TipsCard(
                  tips: Tips(
                      id: 1,
                      imageUrl: "assets/images/icon1.png",
                      title: "City Guidelines",
                      updatedAt: "20 Apr")),
              TipsCard(
                  tips: Tips(
                      id: 2,
                      imageUrl: "assets/images/icon2.png",
                      title: "Jakarta Fairship",
                      updatedAt: "8 Dec")),
              SizedBox(
                height: 50 + edge,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.only(right: edge),
        decoration: BoxDecoration(
            color: whiteGreyColor2, borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            NavBar(imageUrl: "assets/images/homebtn.png", isActive: true),
            NavBar(imageUrl: "assets/images/mail_btn.png"),
            NavBar(imageUrl: "assets/images/card_btn.png"),
            NavBar(imageUrl: "assets/images/btn_love.png")
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
