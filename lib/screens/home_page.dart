import 'package:flutter/material.dart';
import 'package:otel_anasayfa/widgets/customappbar.dart';
import 'package:otel_anasayfa/widgets/featuressection.dart';
import 'package:otel_anasayfa/widgets/herosection.dart';
import 'package:otel_anasayfa/widgets/hotelinfosection.dart';
import 'package:otel_anasayfa/widgets/reservationform.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroSection(),
                  //ReservationForm(),
                  HotelInfoSection(),
                  FeaturesSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
