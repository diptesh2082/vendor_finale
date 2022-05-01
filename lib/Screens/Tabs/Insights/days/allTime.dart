// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vyam_vandor/Services/firebase_firestore_api.dart';
import 'package:vyam_vandor/sales/sales_main_page.dart';

import '../payment_history.dart';
// import 'package:vyam/Insights/payment_history.dart';

class AllTime extends StatefulWidget {
  const AllTime({Key? key}) : super(key: key);

  @override
  AllTimeState createState() => AllTimeState();
}

class AllTimeState extends State<AllTime> {
  final _auth = FirebaseAuth.instance;
  String totalBooking = '';
  getDocumentsLength() async {
    QuerySnapshot docStream =
        await FirebaseFirestore.instance.collection('bookings').get();
    totalBooking = docStream.docs.length.toString();
    print(totalBooking);
  }

  @override
  void initState() {
    print(_auth.currentUser!.email.toString());
    super.initState();
    getDocumentsLength();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('product_details')
            .doc(gymId.toString())
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: 500,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const Sales());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: HexColor("292F3D"),
                                ),
                                width: size.width * 0.45,
                                height: 290,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Sales",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Spacer(),
                                            // const SizedBox(
                                            //   width: 240,
                                            // ),
                                            Image.asset(
                                                "Assets/trend-down.png"),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            const Text(
                                              "₹ 100",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Total sales",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 42,
                                        ),
                                        Text(
                                          snapshot.data.get(
                                              'total_sales'), // DATABASE CALLLING FOR TOTAL SALES VALUE
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 54,
                                        ),
                                        Image.asset(
                                          "Assets/Vector 7.png",
                                          width: size.width * 0.4,
                                          fit: BoxFit.fitWidth,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: HexColor("292F3D"),
                                  ),
                                  width: size.width * 0.45,
                                  height: 135,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Total bookings",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const Spacer(),
                                              // const SizedBox(
                                              //   width: 220,
                                              // ),
                                              Image.asset(
                                                  "Assets/trend-up.png"),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              const Text(
                                                "8",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Text(
                                            totalBooking, //DATABASE CALLING FOR TOTAL BOOKING VALUE
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: HexColor("292F3D"),
                                  ),
                                  width: size.width * 0.45,
                                  height: 135,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      child: Column(
                                        children: const [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Reviews",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 21,
                                          ),
                                          Text(
                                            "144",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 63,
                          child: GestureDetector(
                            onTap: () => Get.to(const PaymentHistory()),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      'View payment history',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
