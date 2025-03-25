import 'package:flutter/material.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int selectedGuest = 1;

  Future<void> _selectDate({required bool isCheckIn}) async {
    if (!mounted) return;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null && mounted) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
        } else {
          checkOutDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 0, left: 200, right: 200),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Boşlukları eşit yap
        children: [
          // Giriş Tarihi
          GestureDetector(
            onTap: () => _selectDate(isCheckIn: true),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 160,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.zero,
              ),
              child: Text(
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
                checkInDate != null
                    ? 'Giriş: ${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}'
                    : 'Giriş Tarihi',
              ),
            ),
          ),
          // Çıkış Tarihi
          GestureDetector(
            onTap: () => _selectDate(isCheckIn: false),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 160,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.zero,
              ),
              child: Text(
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
                checkOutDate != null
                    ? 'Çıkış: ${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}'
                    : 'Çıkış Tarihi',
              ),
            ),
          ),
          // Ziyaretçi Sayısı
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (selectedGuest > 1) {
                        selectedGuest--;
                      }
                    });
                  },
                ),
                Text(
                  '$selectedGuest Ziyaretçi',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      selectedGuest++;
                    });
                  },
                ),
              ],
            ),
          ),
          // Rezervasyon Butonu
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 28,
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () {
              print('checkInDate: $checkInDate');
              print('checkOutDate: $checkOutDate');
              if (checkInDate == null || checkOutDate == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Lütfen giriş ve çıkış tarihlerini seçin."),
                  ),
                );
                return;
              }

              if (checkInDate!.isAfter(checkOutDate!)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text("Giriş tarihi çıkış tarihinden sonra olamaz."),
                  ),
                );
                return;
              }
            },
            child: const Text(
              'REZERVASYON',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
