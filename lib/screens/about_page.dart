import 'package:flutter/material.dart';
import 'package:otel_anasayfa/widgets/customappbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/about_header.jpg',
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
                  'Hakkımızda',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset('assets/images/hotel_outside.jpg'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'THE PALM BOSPHORUS HOTEL',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Üsküdarın göbeğinde eşsiz bir deneyim',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Üsküdar’ın kalbinde yer alan otelimiz, şehrin tarihi ve kültürel zenginliklerini keşfetmek isteyen misafirler için ideal bir konumda bulunmaktadır. Modern tasarımı, rahat ve şık odaları ile konuklarına ev konforunda bir deneyim sunmayı amaçlayan otelimiz, konaklamanızı unutulmaz kılmak için her detayı özenle düşünmüştür.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Misafirlerimize sunduğumuz geniş olanaklar arasında, gurme restoranımızda sunulan lezzetli yemekler, tam donanımlı fitness merkezi ve huzur dolu spa hizmetleri bulunmaktadır.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Otelimiz, Üsküdar’ın tarihi mekanlarına, Boğaz manzarasına ve canlı sosyal hayatına kolay erişim imkanı sunmaktadır.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.phone, size: 20, color: Colors.grey),
                          SizedBox(width: 8),
                          Text('Rezervasyon: 0536 884 48 78'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset('assets/images/mission.jpg'),
                ),
                const SizedBox(width: 24),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Misyonumuz',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                          '• Misafirlerimize konforlu, güvenli ve samimi bir ortam sağlamak.'),
                      Text(
                          '• Yüksek kaliteli hizmet anlayışı ile misafir memnuniyetini en üst seviyede tutmak.'),
                      Text(
                          '• Çalışanlarımızın sürekli gelişimini destekleyerek, güler yüzlü ve profesyonel hizmet sunmalarını sağlamak.'),
                      Text(
                          '• Çevreye duyarlı uygulamalarla sürdürülebilir turizme katkıda bulunmak.'),
                      Text(
                          '• Üsküdar’ın kültürel ve tarihi mirasını tanıtarak, yerel ekonomiye katkıda bulunmak.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vizyonumuz',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Üsküdar’ın eşsiz tarihi dokusu ve modern yaşamını bir araya getirerek, misafirlerimize unutulmaz bir konaklama deneyimi sunmayı hedefliyoruz. Yüksek kaliteli hizmet anlayışımızla sektörde lider konuma gelmek ve hem yerli hem de yabancı turistler için tercih edilen ilk otel olmayı amaçlıyoruz.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Image.asset('assets/images/vision.jpg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
