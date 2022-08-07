import 'package:aplikasi_kos/models/space.dart';
import 'package:aplikasi_kos/pages/error_page.dart';
import 'package:aplikasi_kos/theme.dart';
import 'package:aplikasi_kos/widget/detail_photos.dart';
import 'package:aplikasi_kos/widget/facility_item.dart';
import 'package:aplikasi_kos/widget/favorite_button.dart';
import 'package:aplikasi_kos/widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  const DetailPage({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    Future<void> launchAll(Uri url) async {
      try {
        await launchUrl(url);
      } catch (error) {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const ErrorPage())));
      }
    }

    final Uri mapUrl = Uri.parse('${space.mapUrl}');
    final Uri telUrl = Uri(scheme: 'tel', path: '${space.phone}');
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Image.network(
            space.imageUrl,
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              const SizedBox(
                height: 300,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  color: whiteColor,
                ),
                //NOTE: Title
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  overflow: TextOverflow.visible,
                                  space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                              ),
                              Text.rich(TextSpan(
                                  text: "\$${space.price}",
                                  style: purpleTextStyle.copyWith(fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text: " / month", style: greyTextStyle)
                                  ]))
                            ],
                          ),
                          Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                            return Container(
                              margin: const EdgeInsets.only(left: 2),
                              child: RatingItem(
                                index: index,
                                rating: space.rating,
                              ),
                            );
                          }).toList())
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //NOTE: Main Facilities
                      Text(
                        "Main Facilities",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem(
                              imageUrl: "assets/images/bar-counter.png",
                              name: "Kitchen",
                              number: "${space.numberOfKitchen}"),
                          FacilityItem(
                              imageUrl: "assets/images/double-bed.png",
                              name: "Bedroom",
                              number: "${space.numberOfBedrooms}"),
                          FacilityItem(
                              imageUrl: "assets/images/cupboard.png",
                              name: "Big Lemari",
                              number: "${space.numberOfCupboards}"),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Photos",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: space.photos!
                                .map((item) => DetailPhotos(imageUrl: item))
                                .toList()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Location",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${space.address}\n${space.city}",
                            textAlign: TextAlign.left,
                            style: greyTextStyle.copyWith(fontSize: 14),
                          ),
                          InkWell(
                            onTap: (() {
                              launchAll(mapUrl);
                            }),
                            child: Image.asset(
                              "assets/images/btn_map.png",
                              width: 40,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog<String>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text("Konfirmasi"),
                                        content: const Text(
                                            "Apakah anda ingin menghubungi pemilik?"),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Batal")),
                                          TextButton(
                                              onPressed: () {
                                                launchAll(telUrl);
                                              },
                                              child: const Text("Hubungi")),
                                        ],
                                      ));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: purpleColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17))),
                            child: Text(
                              "Book Now",
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Image.asset(
                      "assets/images/btn_back.png",
                      width: 40,
                    ),
                  ),
                  //NOTE : Button Favorite
                  const FavoriteButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
