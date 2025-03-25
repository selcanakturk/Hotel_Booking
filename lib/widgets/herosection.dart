import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/slider1.jpg',
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 400,
          width: double.infinity,
          color: const Color.fromRGBO(0, 0, 0, 0.3),
        ),
        Positioned(
          left: 30,
          top: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lüks Konaklama',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Oda servisi ve konforlu odalar ile konaklama deneyiminizi üst seviyeye çıkaralım.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('REZERVASYON'),
              )
            ],
          ),
        )
      ],
    );
  }
}
