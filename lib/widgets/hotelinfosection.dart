import 'package:flutter/material.dart';

class HotelInfoSection extends StatelessWidget {
  const HotelInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/images/hotel_night.jpg',
              width: 400, // Görsel boyutunu ayarla
              height: 450,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "THE PALM BOSPHORUS OTEL",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Yaşadığınız tüm deneyimlerin ötesinde...",
                  style: TextStyle(
                    fontSize: 35, // Başlığı büyüt
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Palm Bosphorus Otel'de eşsiz boğaz manzarası sizleri bekliyor. Üsküdar’ın göbeğinde modern tasarımı ve eşsiz dokusuyla siz misafirlerimizi ağırlamaktan mutluluk duyuyoruz.  Yüksek kalite hizmet anlayışımız ile sizi mutlu etmek için çalışmaya devam ediyoruz. Türk misafirperverliğini önde tutan anlayışımız siz seçkin ve özel misafirlerimiz için The Palm Bosphorus’ta…",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700], // Açıklama rengi
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      "0536 884 4878",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
