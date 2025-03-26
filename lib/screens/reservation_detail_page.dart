import 'package:flutter/material.dart';
import 'package:otel_anasayfa/widgets/customappbar.dart';
import 'package:intl/intl.dart';

class ReservationDetailPage extends StatelessWidget {
  const ReservationDetailPage({super.key});

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: InteractiveViewer(
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/vision.jpg',
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text('info@thepalmbosphorus.com',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              Text('+905368844878',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'The Palm Bosphorus Hotel',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Üsküdar | İstanbul, Turkey',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Palm Bosphorus Otel’de eşsiz boğaz manzarası sizleri bekliyor. '
                          'Üsküdarın göbeğinde modern tasarımı ve eşsiz dokusuyla '
                          'siz misafirlerimizi ağırlamaktan mutluluk duyuyoruz.',
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.percent,
                                size: 18, color: Colors.black54),
                            SizedBox(width: 4),
                            Text(
                              'Minimum Ödeme: %50',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: List.generate(
                    8,
                    (index) => GestureDetector(
                      onTap: () => _showImageDialog(
                          context, 'assets/images/room$index.jpg'),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/room$index.jpg',
                            height: 100,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
