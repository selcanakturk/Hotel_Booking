import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
        child: Column(
          children: [
            const Text(
              'THE PALM BOSPHORUSTA',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ayrıcalıklar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The Palm Bosphorus Otel’de ayrıcalıklar sizleri bekliyor.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _FeatureBox(
                  icon: Icons.phone_in_talk_outlined,
                  title: '7/24 Oda Servisi',
                  description:
                      '7/24 oda servisi ile tüm ihtiyaçlarınızı karşılayalım.',
                ),
                _FeatureBox(
                  icon: Icons.wifi,
                  title: 'Wi-Fi',
                  description: 'Ücretsiz wifi erişimi.',
                ),
                _FeatureBox(
                  icon: Icons.videocam_outlined,
                  title: 'Yüksek Koruma',
                  description:
                      'Otelimiz 7/24 güvenlik sistemleri ile korunmaktadır.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureBox({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 48, color: Colors.grey),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
