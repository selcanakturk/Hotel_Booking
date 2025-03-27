// import 'package:flutter/material.dart';
// import 'dart:math';

// class AvailabilityMatrix extends StatefulWidget {
//   const AvailabilityMatrix({super.key});

//   @override
//   State<AvailabilityMatrix> createState() => _AvailabilityMatrixState();
// }

// class _AvailabilityMatrixState extends State<AvailabilityMatrix> {
//   final int daysPerPage = 7;
//   int startIndex = 0;
//   final Random random = Random();

//   final List<String> dates = generateDates();

//   final List<Map<String, dynamic>> rooms = [
//     {
//       "name": "Deluxe Balcony Room",
//       "capacity": 2,
//       "range": [1, 2],
//     },
//     {
//       "name": "Exclusive Suite",
//       "capacity": 2,
//       "range": [1, 2],
//     },
//     {
//       "name": "Deluxe Double Room",
//       "capacity": 2,
//       "range": [4, 6],
//     },
//     {
//       "name": "Deluxe Twin Room",
//       "capacity": 2,
//       "range": [4, 6],
//     },
//     {
//       "name": "Superior Family Room with Sea View",
//       "capacity": 5,
//       "range": [1, 2],
//     },
//     {
//       "name": "Deluxe Family Room",
//       "capacity": 4,
//       "range": [3, 3],
//     },
//     {
//       "name": "Superior Tripple Room",
//       "capacity": 3,
//       "range": [1, 2],
//     },
//     {
//       "name": "Superior Double Room with Sea View",
//       "capacity": 2,
//       "range": [5, 6],
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     generateAvailability();
//   }

//   void generateAvailability() {
//     for (var room in rooms) {
//       room["availability"] = List.generate(dates.length, (index) {
//         if (random.nextDouble() < 0.1) return "🚫"; // %10 Kapalı Gün
//         if (random.nextDouble() < 0.15) return "X"; // %15 Müsait Değil
//         return (room["range"][0] +
//                 random.nextInt(room["range"][1] - room["range"][0] + 1))
//             .toString();
//       });
//     }
//   }

//   static List<String> generateDates() {
//     List<String> dateList = [];
//     DateTime now = DateTime.now();
//     DateTime end = DateTime(now.year, 6, 30);

//     while (now.isBefore(end)) {
//       dateList.add("${now.day} ${_monthName(now.month)}");
//       now = now.add(const Duration(days: 1));
//     }
//     return dateList;
//   }

//   static String _monthName(int month) {
//     const months = ["Oca", "Şub", "Mar", "Nis", "May", "Haz"];
//     return months[month - 1];
//   }

//   Color cellColor(String value) {
//     if (value == "X") return Colors.red.shade200;
//     if (value == "🚫") return Colors.grey.shade300;
//     return Colors.green.shade100;
//   }

//   Widget buildCell(String value) {
//     if (value == "X") {
//       return const Icon(Icons.clear, color: Colors.red);
//     } else if (value == "🚫") {
//       return const Icon(Icons.block, color: Colors.black45);
//     } else {
//       return Text(value, style: const TextStyle(fontWeight: FontWeight.bold));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final endIndex = (startIndex + daysPerPage > dates.length)
//         ? dates.length
//         : startIndex + daysPerPage;
//     final visibleDates = dates.sublist(startIndex, endIndex);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             IconButton(
//               onPressed: startIndex > 0
//                   ? () => setState(() => startIndex -= daysPerPage)
//                   : null,
//               icon: const Icon(Icons.arrow_back_ios),
//             ),
//             const SizedBox(width: 5),
//             const Text("Odalar", style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(width: 95),
//             ...visibleDates.map((d) => Container(
//                   width: 75,
//                   alignment: Alignment.center,
//                   child: Text(
//                     d,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 )),
//             IconButton(
//               onPressed: endIndex < dates.length
//                   ? () => setState(() => startIndex += daysPerPage)
//                   : null,
//               icon: const Icon(Icons.arrow_forward_ios),
//             ),
//           ],
//         ),
//         const Divider(),
//         ...rooms.map((room) {
//           final visibleAvail =
//               room["availability"].sublist(startIndex, endIndex);
//           return Row(
//             children: [
//               Container(
//                 width: 180,
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                 decoration:
//                     BoxDecoration(border: Border.all(color: Colors.black12)),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.person, size: 16),
//                     const SizedBox(width: 4),
//                     Text('${room["capacity"]}'),
//                     const SizedBox(width: 8),
//                     Flexible(
//                       child: Text(room["name"],
//                           style: const TextStyle(fontSize: 13),
//                           overflow: TextOverflow.ellipsis),
//                     ),
//                   ],
//                 ),
//               ),
//               ...visibleAvail.map((val) => Container(
//                     width: 75,
//                     height: 55,
//                     alignment: Alignment.center,
//                     margin: const EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       color: cellColor(val),
//                       border: Border.all(color: Colors.black12),
//                     ),
//                     child: buildCell(val),
//                   )),
//             ],
//           );
//         }).toList(),
//         const SizedBox(height: 15),
//         const Row(
//           children: [
//             Icon(Icons.check, color: Colors.green),
//             Text(" Müsait Günler  "),
//             Icon(Icons.clear, color: Colors.red),
//             Text(" Müsait Değil  "),
//             Icon(Icons.block, color: Colors.grey),
//             Text(" Satışa Kapalı"),
//           ],
//         )
//       ],
//     );
//   }
// }
