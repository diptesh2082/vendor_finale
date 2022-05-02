import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam_vandor/Screens/booking_summary_screen.dart';
import 'package:vyam_vandor/Screens/order_details_screen.dart';

class ActiveBookingCard extends StatefulWidget {
  const ActiveBookingCard({
    Key? key,
    required this.userName,
    required this.bookingID,
    required this.bookingdate,
    required this.bookingPlan,
    required this.bookingPrice,
    required this.userID,
    this.tempYear,
    this.tempDay,
    this.tempMonth,
    this.id,
  }) : super(key: key);
  final String? userName;
  final String? bookingID;
  final String? bookingdate;
  final String? bookingPlan;
  final double? bookingPrice;
  final String? userID;
  final dynamic tempYear;
  final dynamic tempDay;
  final dynamic tempMonth;
  final String? id;

  @override
  State<ActiveBookingCard> createState() => _ActiveBookingCardState();
}

class _ActiveBookingCardState extends State<ActiveBookingCard> {
  @override
  void initState() {
    print(widget.tempDay);
    print(widget.tempYear);
    print(widget.tempMonth);
    super.initState();
    print("//////////////////");
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Get.to(
              () => OrderDetails(
                    // otp: widget.otp,
                    bookingID: widget.bookingID,
                    userID: widget.userID,
                  ),
              arguments: {
                "booking_id": widget.bookingID,
              });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Booking ID - ${widget.id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  Text(
                    widget.userName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  Text(
                    widget.bookingdate!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.bookingPlan!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      '\$${widget.bookingPrice}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Text(
                    '${DateTime.now().difference(DateTime(int.parse(widget.tempYear), int.parse(widget.tempMonth), int.parse(widget.tempDay))).inDays} days remaining',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(
                        width: 3.5,
                      ),
                      Text(
                        'Active',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
