import 'package:flutter/material.dart';
import 'package:otel_anasayfa/screens/reservation_detail_page.dart';
import 'package:otel_anasayfa/widgets/customappbar.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/room_header.jpg',
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 400,
                  color: Colors.black.withOpacity(0.3),
                ),
                const Positioned(
                  left: 30,
                  bottom: 30,
                  child: Text(
                    'Odalarımız',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ODALARIMIZ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sizin için tasarlandı...',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Modern ve şık tasarımıyla size daha keyifli bir deneyim yaşatmak için tasarlandı.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: RoomCard(
                          image: 'assets/images/room1.jpg',
                          title: 'Suit 1',
                          subtitle: '2 KİŞİLİK',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: RoomCard(
                          image: 'assets/images/room2.jpg',
                          title: 'Suit 2',
                          subtitle: '2 KİŞİLİK',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: RoomCard(
                          image: 'assets/images/room3.jpg',
                          title: 'Connection',
                          subtitle: '2 YETİŞKİN & 2 ÇOCUK',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50), // Sayfanın altına boşluk eklendi
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const RoomCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.orange, // Kırmızı yerine turuncu yapıldı
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            shadowColor: Colors.black,
            elevation: 6,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ReservationDetailPage()),
            );
          },
          child:
              const Text("REZERVASYON", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
