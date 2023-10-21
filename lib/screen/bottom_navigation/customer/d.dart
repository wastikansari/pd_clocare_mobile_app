// import 'package:new_clocare_delivery_boy/screen/widget/dropdown_button.dart';
// import 'package:flutter/material.dart';

// class DropdownButtonExample extends StatefulWidget {
//   @override
//   _DropdownButtonExampleState createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   List _pickupDates = [];
//   List _deliveryDates = [];
//   var _selectedPickupDate = '';
//   var _selectedDeliveryDate = '';

//   @override
//   void initState() {
//     super.initState();
//     _generateDates();
//   }

//   void _generateDates() {
//     _pickupDates.clear();
//     DateTime currentDate = DateTime.now();

//     // Generate a list of dates for one week
//     for (int i = 0; i < 7; i++) {
//       _pickupDates.add(currentDate.add(Duration(days: i)));
//     }
//   }

//   // void _updateDeliveryDates(selectedPickupDate) {
//   //   print('ddddddddddddd $selectedPickupDate');
//   //   _deliveryDates.clear();

//   //   // Generate a list of dates starting from one week after the selected pickup date
//   //   DateTime deliveryStartDate = selectedPickupDate.add(const Duration(days: 7));
//   //   for (int i = 0; i < 7; i++) {
//   //     _deliveryDates.add(deliveryStartDate.add(Duration(days: i)).toString());
//   //   }

//   //   // Select the first delivery date by default
//   //   _selectedDeliveryDate = _deliveryDates[0].toString();
//   // }

//   // void _updateDeliveryDates(DateTime selectedPickupDate) {
//   //   print('uppp $selectedPickupDate and ${selectedPickupDate.runtimeType}');
//   //   _deliveryDates.clear();

//   //   // Generate a list of dates starting from one week after the selected pickup date
//   //   DateTime deliveryStartDate =
//   //       selectedPickupDate.add(const Duration(days: 7));
//   //       print('dataa $deliveryStartDate and ${deliveryStartDate.runtimeType}');
//   //   for (int i = 0; i < 7; i++) {
//   //     _deliveryDates.add(deliveryStartDate.add(Duration(days: i)));
//   //   }

//   //   // // Select the first delivery date by default
//   //   // _selectedDeliveryDate = _deliveryDates[0];
//   // }

//   void _updateDeliveryDates(DateTime selectedPickupDate) {
//   _deliveryDates.clear();

//   // Generate a list of dates starting from one week after the selected pickup date
//   // DateTime deliveryStartDate = selectedPickupDate.add(Duration(days: 7));
//   for (int i = 0; i < 7; i++) {
//     _deliveryDates.add(selectedPickupDate.add(Duration(days: i)));
//   }

//   // Select the first delivery date by default
//   // _selectedDeliveryDate = _deliveryDates[0];
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown Button Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomFormDropDown(
//                 title: 'Delivery Time',
//                 hintText: _selectedPickupDate.isEmpty
//                     ? 'Select time'
//                     : _selectedPickupDate,
//                 hintColor:
//                     _selectedPickupDate.isEmpty ? Colors.black38 : Colors.black,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedPickupDate = newValue.toString();
//                     print(newValue.runtimeType);
//                     _updateDeliveryDates(DateTime.parse(newValue.toString()));
//                   });
//                 },
//                 items: _pickupDates.map((e) {
//                   String formattedDate = '${e.year}-${e.month}-${e.day}';
//                   return DropdownMenuItem<String>(
//                       value: e.toString(), child: Text(formattedDate));
//                 }).toList()),
//             // DropdownButton(
//             //   value: _selectedPickupDate,
//             //   items: _pickupDates.map((date) {
//             //     String formattedDate = '${date.year}-${date.month}-${date.day}';
//             //     // String formattedDate = DateFormat('dd-MM-yyyy').format(date);
//             //     return DropdownMenuItem(
//             //       value: date,
//             //       child: Text(formattedDate),
//             //     );
//             //   }).toList(),
//             //   onChanged: (newValue) {
//             //     setState(() {
//             //       _selectedPickupDate = newValue.toString();
//             //       // _updateDeliveryDates(newValue);
//             //     });
//             //   },
//             // ),
//             const SizedBox(height: 16),
//             CustomFormDropDown(
//                 title: 'Delivery Time',
//                 hintText: _selectedDeliveryDate.isEmpty
//                     ? 'Select time'
//                     : _selectedDeliveryDate,
//                 hintColor: _selectedDeliveryDate.isEmpty
//                     ? Colors.black38
//                     : Colors.black,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedDeliveryDate = newValue.toString();
//                   });
//                 },
//                 items: _deliveryDates.map((e) {
//                   String formattedDate = '${e.year}-${e.month}-${e.day}';
//                   return DropdownMenuItem<String>(
//                       value: e.toString(), child: Text(formattedDate));
//                 }).toList()),
//             // DropdownButton(
//             //   value: _selectedDeliveryDate,
//             //   items: _deliveryDates.map((date) {
//             //     String formattedDate = '${date.year}-${date.month}-${date.day}';
//             //     // String formattedDate = date('dd-MM-yyyy').format(date);
//             //     return DropdownMenuItem<DateTime>(
//             //       value: date,
//             //       child: Text(formattedDate),
//             //     );
//             //   }).toList(),
//             //   onChanged: (newValue) {
//             //     setState(() {
//             //       _selectedDeliveryDate = newValue!.toString();
//             //     });
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
