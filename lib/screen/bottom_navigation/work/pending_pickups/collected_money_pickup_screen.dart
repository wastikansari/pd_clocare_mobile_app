import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/customer_wallet_api.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/complete_pickup_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';


class CollectMoneyPickupScreen extends StatefulWidget {
  final int unpaidAmount;
  final String customerIds;
  final String orderId;
  final double totalPrice;
  final int totalPickupItems;
  final List garmentCollection;
  CollectMoneyPickupScreen(
      {super.key,
      required this.unpaidAmount,
      required this.customerIds,
      required this.orderId,
      required this.totalPrice,
      required this.garmentCollection, required this.totalPickupItems});

  @override
  State<CollectMoneyPickupScreen> createState() =>
      _CollectMoneyPickupScreenState();
}

class _CollectMoneyPickupScreenState extends State<CollectMoneyPickupScreen> {
  TextEditingController _amountController = TextEditingController();
  CustomerWalletApi customerWalletApi = CustomerWalletApi();
  int totalAmount = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      totalAmount = widget.unpaidAmount;
    });
    _amountController = TextEditingController();
    _amountController.text = totalAmount.toString();
  }

  void addToTotal(int amount) {
    setState(() {
      totalAmount += amount;
      _amountController.text = totalAmount.toString();
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  collectMoney() async {
    setState(() {
      isLoading = true;
    });
    var customerId = widget.customerIds;
    var amount = totalAmount;
    await customerWalletApi.collectCash(customerId, amount).then((value) {
      var data = value.data;
      if (data!.status == 'ok') {
        String msg = data.msg.toString();
        print('collect money ${value.data!.status} $msg and ${value.data}');
        setState(() {
          isLoading = false;
        });
        dialogBox(msg, 'Ok');
      } else if (data.status == 'errors') {
        String msg = data.list![0].toString();
        setState(() {
          isLoading = false;
        });
        dialogBox(msg, 'Cancel');
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  dialogBox(String msg, String status) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Thank You'),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () => status == 'Ok'
                ? Get.to(CompletePickupOrderScreen(
                    orderId: widget.orderId,
                    totalPrice: widget.totalPrice,
                    garmentCollection: widget.garmentCollection, totalPickupItems: widget.totalPickupItems,
                  ))
                : Navigator.pop(context, 'Ok'),
            child: Text(status),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collect cash from customer'),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Height(20),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Select amount',
                  size: 18,
                  fontweights: FontWeight.w500,
                )),
            const Height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => addToTotal(10),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(1),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  child: SmallText(text: '+ ₹10'),
                ),
                ElevatedButton(
                  onPressed: () => addToTotal(20),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(1),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  child: SmallText(text: '+ ₹20'),
                ),
                ElevatedButton(
                  onPressed: () => addToTotal(50),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(1),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  child: SmallText(text: '+ ₹50'),
                ),
                ElevatedButton(
                  onPressed: () => addToTotal(100),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(1),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  child: SmallText(text: '+ ₹100'),
                ),
              ],
            ),
            const Height(20),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  totalAmount = int.tryParse(value) ?? 0;
                });
              },
              decoration: const InputDecoration(
                prefix: Text('  ₹ '),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                // labelText: 'Amount',S
                hintText: 'Enter amount',
              ),
            ),
            const Height(40),
            InkWell(
              onTap: () {
                collectMoney();
              },
              child: Container(
                decoration: const BoxDecoration(
                  // color: Color.fromARGB(203, 70, 178, 236),
                  color: Color.fromARGB(229, 51, 106, 188),
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 15, bottom: 15),
                      child: isLoading
                          ? Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                              color: Colors.white,
                              size: 20,
                            ))
                          : SmallText(
                              text: 'Collect money',
                              color: Colors.white,
                              fontweights: FontWeight.bold,
                            )),
                ),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {},
            //     child: const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Text('Collect money'),
            //     ))
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CollectMoneyPickupScreen extends StatefulWidget {
//   @override
//   _CollectMoneyPickupScreenState createState() => _CollectMoneyPickupScreenState();
// }

// class _CollectMoneyPickupScreenState extends State<CollectMoneyPickupScreen> {
//   TextEditingController _amountController = TextEditingController();
//   int totalAmount = 0;

//   @override
//   void initState() {
//     super.initState();
//     _amountController = TextEditingController();
//     _amountController.text = totalAmount.toString();
//   }

//   void addToTotal(int amount) {
//     setState(() {
//       totalAmount += amount;
//       _amountController.text = totalAmount.toString();
//     });
//   }

//   @override
//   void dispose() {
//     _amountController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Amount Selection'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _amountController,
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   totalAmount = int.tryParse(value) ?? 0;
//                 });
//               },
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => addToTotal(10),
//                   child: Text('+ ₹10'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => addToTotal(20),
//                   child: Text('+ ₹20'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => addToTotal(50),
//                   child: Text('+ ₹50'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => addToTotal(100),
//                   child: Text('+ ₹100'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // Save button functionality goes here
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
