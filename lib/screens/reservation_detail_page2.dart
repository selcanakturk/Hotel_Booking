
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationDetailPage extends StatefulWidget {
  const ReservationDetailPage({super.key});

  @override
  State<ReservationDetailPage> createState() => _ReservationDetailPageState();
}

class _ReservationDetailPageState extends State<ReservationDetailPage> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int adults = 2;
  int children = 0;
  int nights = 0;

  Future<void> pickDate({required bool isCheckIn}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
          if (checkOutDate != null && checkOutDate!.isBefore(checkInDate!)) {
            checkOutDate = null;
          }
        } else {
          checkOutDate = picked;
        }

        if (checkInDate != null && checkOutDate != null) {
          nights = checkOutDate!.difference(checkInDate!).inDays;
        }
      });
    }
  }

  Widget dateBox(String title, DateTime? date, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, size: 20, color: Colors.black54),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(
                    date != null ? DateFormat('dd MMM yyyy').format(date) : 'Tarih seç',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget countBox(String label, int value, ValueChanged<int> onChanged) {
    return Expanded(
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          const Spacer(),
          IconButton(
            onPressed: value > 0 ? () => onChanged(value - 1) : null,
            icon: const Icon(Icons.remove_circle_outline),
          ),
          Text('$value'),
          IconButton(
            onPressed: () => onChanged(value + 1),
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Palm Bosphorus Hotel'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/room_main.jpg',
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      dateBox('Giriş', checkInDate, () => pickDate(isCheckIn: true)),
                      const SizedBox(width: 12),
                      dateBox('Çıkış', checkOutDate, () => pickDate(isCheckIn: false)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      countBox('Gece', nights, (_) {}),
                      const SizedBox(width: 12),
                      countBox('Yetişkin', adults, (val) => setState(() => adults = val)),
                      const SizedBox(width: 12),
                      countBox('Çocuk', children, (val) => setState(() => children = val)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          label: const Text('Ara'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_month_outlined),
                        label: const Text('Müsaitlik'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
