import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otel_anasayfa/widgets/customappbar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/slider2.jpg',
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 250,
                color: Colors.black.withOpacity(0.3),
              ),
              const Positioned(
                left: 30,
                bottom: 30,
                child: Text(
                  'İletişim',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Sizin için buradayız...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Yüksek kalite hizmet anlayışımız ile sizi mutlu etmek için çalışmaya devam ediyoruz. Türk misafirperverliğini önde tutan anlayışımız siz seçkin ve özel misafirlerimiz için The Palm Bosphorus’ta...',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _ContactInfoCard(
                icon: Icons.location_on,
                title: 'Adres',
                content: 'Üsküdar/İstanbul',
              ),
              _ContactInfoCard(
                icon: Icons.phone,
                title: 'Telefon',
                content: '0536 884 48 78',
              ),
              _ContactInfoCard(
                icon: Icons.email,
                title: 'E-Mail',
                content: 'info@thepalmbosphorus.com',
              ),
            ],
          ),
          const SizedBox(height: 32),
          //Image.asset('assets/images/map_placeholder.jpg'),
          const SizedBox(height: 32),
          const ContactForm(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bize mesajınızı iletin.',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Bize ulaşmak için aşağıdaki formu doldurabilirsiniz.'),
            const SizedBox(height: 16),
            _buildTextField('İsim'),
            const SizedBox(height: 12),
            _buildTextField('Telefon Numaranız',
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            const SizedBox(height: 12),
            _buildTextField('Email', keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            _buildTextField('Mesajınız', maxLines: 5),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                shadowColor: Colors.black,
                elevation: 8,
              ),
              onPressed: () {},
              child:
                  const Text("GÖNDER", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
