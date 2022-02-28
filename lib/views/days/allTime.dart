// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../payment_history.dart';
// import 'package:vyam/views/payment_history.dart';

class AllTime extends StatefulWidget {
  const AllTime({Key? key}) : super(key: key);

  @override
  AllTimeState createState() => AllTimeState();
}

class AllTimeState extends State<AllTime> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor("292F3D"),
                        ),
                        width: size.width * 0.47,
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Sales",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 240,
                                    ),
                                    Image.asset("Assets/trend-down.png"),
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
                                  height: 80,
                                ),
                                const Text(
                                  "₹ 500",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                  ),
                                ),
                                const SizedBox(
                                  height: 80,
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
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: HexColor("292F3D"),
                            ),
                            width: size.width * 0.47,
                            height: 190,
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
                                        const SizedBox(
                                          width: 220,
                                        ),
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
                                      height: 30,
                                    ),
                                    const Text(
                                      "22",
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
                            width: size.width * 0.47,
                            height: 190,
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
                                      height: 30,
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
                    height: size.height / 15,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            const Text(
                              'View payment history',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              onTap: () => Get.to(const PaymentHistory()),
                            ),
                          ],
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
  }
}
