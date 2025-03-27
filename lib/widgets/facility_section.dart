import 'package:flutter/material.dart';

class FacilityIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const FacilityIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.indigo),
        const SizedBox(width: 6),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 14)),
        )
      ],
    );
  }
}

class FacilityGroup extends StatelessWidget {
  final String title;
  final List<FacilityIconText> items;

  const FacilityGroup({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            ...items,
          ],
        ),
      ),
    );
  }
}

class FacilitySection extends StatelessWidget {
  const FacilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tesis Özellikleri',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Divider(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FacilityGroup(
                title: 'Servisler',
                items: const [
                  FacilityIconText(icon: Icons.wifi, text: 'Ortak lobi'),
                  FacilityIconText(
                      icon: Icons.local_taxi, text: 'Transfer Hizmetleri'),
                  FacilityIconText(
                      icon: Icons.business_center, text: 'Bagaj Teslim'),
                  FacilityIconText(icon: Icons.call, text: 'Otel Hizmetleri'),
                  FacilityIconText(
                      icon: Icons.room_service, text: 'Oda Servisi'),
                ],
              ),
              FacilityGroup(
                title: 'Genel',
                items: const [
                  FacilityIconText(
                      icon: Icons.local_cafe, text: '7/24 Oda Bürosu'),
                  FacilityIconText(icon: Icons.ac_unit, text: 'Klima'),
                  FacilityIconText(
                      icon: Icons.smoke_free, text: 'Sigara İçilmeyen Odalar'),
                  FacilityIconText(icon: Icons.tv, text: 'Televizyon'),
                ],
              ),
              FacilityGroup(
                title: 'Diğer',
                items: const [
                  FacilityIconText(
                      icon: Icons.satellite, text: 'Uydu Yayınları'),
                  FacilityIconText(
                      icon: Icons.shield, text: 'Güvenlik Kamerası'),
                  FacilityIconText(icon: Icons.local_parking, text: 'Otopark'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
