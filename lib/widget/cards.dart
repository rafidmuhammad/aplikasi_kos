import 'package:aplikasi_kos/models/city.dart';
import 'package:aplikasi_kos/models/space.dart';
import 'package:aplikasi_kos/models/tips.dart';
import 'package:aplikasi_kos/pages/detail_page.dart';
import 'package:aplikasi_kos/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 150,
          width: 120,
          color: whiteGreyColor2,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    city.imageUrl,
                    height: 102,
                    width: 120,
                  ),
                  city.isFavorite
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: purpleColor,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30))),
                              child: Center(
                                child: Icon(
                                  Icons.star,
                                  color: orangeColor,
                                ),
                              )),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                city.location,
                style: blackTextStyle.copyWith(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpaceCard extends StatelessWidget {
  final Space space;
  const SpaceCard({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: InkWell(
        onTap: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        space: space,
                      )));
        }),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: 130,
                height: 110,
                child: Stack(
                  children: [
                    Image.network(
                      space.imageUrl,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: orangeColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${space.rating}/5",
                                style: whiteTextStyle.copyWith(fontSize: 13),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.name,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text.rich(
                  TextSpan(
                      text: "\$${space.price}",
                      style: purpleTextStyle.copyWith(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: " / month",
                            style: greyTextStyle.copyWith(fontSize: 16))
                      ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "${space.city}, ${space.country}",
                  style: greyTextStyle.copyWith(fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28, bottom: 20),
      child: Row(
        children: [
          Image.asset(
            tips.imageUrl,
            width: 80,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Updated ${tips.updatedAt}",
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              )
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: (() {}),
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: greyColor,
              ))
        ],
      ),
    );
  }
}
