import 'package:flutter/material.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  String selectedGuest = '1';

  Future<void> _selectDate({required bool isCheckIn}) async {
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
      margin: const EdgeInsets.only(top: -40, left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(isCheckIn: true),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      checkInDate != null
                          ? 'Giriş: ${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}'
                          : 'Giriş Tarihi',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(isCheckIn: false),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      checkOutDate != null
                          ? 'Çıkış: ${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}'
                          : 'Çıkış Tarihi',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  value: selectedGuest.isNotEmpty ? selectedGuest : null,
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: '${index + 1}',
                      child: Text('${index + 1} Ziyaretçi'),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedGuest = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                ),
                onPressed: () {
                  // Rezervasyon işlemi yapılabilir
                },
                child: const Text('REZERVASYON'),
              )
            ],
          )
        ],
      ),
    );
  }
}
