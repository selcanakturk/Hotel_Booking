import 'package:flutter/material.dart';
import 'package:otel_anasayfa/screens/reservation_detail_page.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int? _guests;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    DateTime initialDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = pickedDate;
        } else {
          checkOutDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Saydamlaştırılmış Arka Plan Resmi
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4), // Resmi saydamlaştırmak için opaklık
            BlendMode.darken,
          ),
          child: Image.asset(
            'assets/images/slider1.jpg',
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // İçerik (Metin)
        Positioned(
          left: 50,
          top: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lüks Konaklama",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Oda servisi ve konforlu odalar ile konaklama deneyiminizi üst seviyeye çıkaralım",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  side: BorderSide(
                      color: Colors.white, width: 2), // Beyaz kenarlık
                  shadowColor: Colors.black,
                  elevation: 8,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReservationDetailPage()),
                  );
                },
                child: Text(
                  "REZERVASYON",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold, // Kalın beyaz yazı
                  ),
                ),
              ),
            ],
          ),
        ),

        Transform.translate(
          offset: Offset(0, 450),
          child: Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 50),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Giriş Tarihi
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: checkInDate == null
                              ? "Giriş Tarihi"
                              : "${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // Çıkış Tarihi
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: checkOutDate == null
                              ? "Çıkış Tarihi"
                              : "${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // Ziyaretçi Sayısı
                Expanded(
                  child: Row(
                    children: [
                      // Azaltma Butonu
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_guests != null && _guests! > 1) {
                              _guests = _guests! - 1;
                            }
                          });
                        },
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(
                              text: _guests?.toString() ?? ""),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Ziyaretçi",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _guests = int.tryParse(value);
                            });
                          },
                        ),
                      ),
                      // Artırma Butonu
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (_guests != null) {
                              _guests = _guests! + 1;
                            } else {
                              _guests =
                                  1; // Eğer başlangıçta null ise, 1 yapalım
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),

                // Rezervasyon Butonu
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
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
                  child: Text("REZERVASYON",
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
