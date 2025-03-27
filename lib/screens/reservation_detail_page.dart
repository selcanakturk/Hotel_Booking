import 'package:flutter/material.dart';
import 'package:otel_anasayfa/widgets/availability_matrix.dart';
import 'package:otel_anasayfa/widgets/customappbar.dart';
import 'package:intl/intl.dart';
import 'package:otel_anasayfa/widgets/facility_section.dart';

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
  bool showAvailabilityTable = false; // Müsaitlik tablosu görünürlüğü

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
                  Text(title,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(
                    date != null
                        ? DateFormat('dd MMM yyyy').format(date)
                        : 'Tarih seç',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
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
              const SizedBox(height: 16),
              Row(
                children: [
                  dateBox(
                      'Giriş', checkInDate, () => pickDate(isCheckIn: true)),
                  const SizedBox(width: 12),
                  dateBox(
                      'Çıkış', checkOutDate, () => pickDate(isCheckIn: false)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  countBox('Gece', nights, (_) {}),
                  const SizedBox(width: 12),
                  countBox('Yetişkin', adults,
                      (val) => setState(() => adults = val)),
                  const SizedBox(width: 12),
                  countBox('Çocuk', children,
                      (val) => setState(() => children = val)),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Ara',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showAvailabilityTable = !showAvailabilityTable;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        showAvailabilityTable ? 'Kapat' : 'Müsaitlik',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Müsaitlik tablosu yalnızca showAvailabilityTable true olduğunda gösterilecek
              if (showAvailabilityTable) const AvailabilityMatrix(),

              const FacilitySection(),
            ],
          ),
        ),
      ),
    );
  }
}
