import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vyam_vandor/Services/firebase_firestore_api.dart';
import 'package:vyam_vandor/constants.dart';
import 'package:vyam_vandor/widgets/active_booking.dart';
import 'package:vyam_vandor/widgets/card_details.dart';

import '../Screens/home__screen.dart';
import '../Screens/login_screen.dart';
import '../Screens/order_details_screen.dart';

class MonthSales extends StatefulWidget {
  const MonthSales({Key? key}) : super(key: key);

  @override
  State<MonthSales> createState() => _MonthSalesState();
}

class _MonthSalesState extends State<MonthSales> {
  // bool isLoading=true;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String salesTotal = '\$260';
    String salesStatus = '+ \$20';
    String bookingsTotal = '70';
    String bookingsStatus = '+ 3';
    // sales() async{
    final stream =
    FirebaseFirestore.instance.collectionGroup('user_booking').snapshots();

    final _auth=FirebaseAuth.instance;
    Size size=MediaQuery.of(context).size;

    // .where("vendorId", isEqualTo: "dipteshmandal555@gmail.com").where("booking_accepted", isEqualTo: true)

    // return stream;
    // }

    int sum = 0;
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("product_details").doc(gymId).snapshots(),
            //     .where((event){
            //
            // }),
            // FirebaseFirestore.instance
            //     .collectionGroup('user_booking')
            // .orderBy("order_time",descending: true)
            //     .where("vendorId", isEqualTo: "T@gmail.com")
            //     .where("booking_accepted", isEqualTo: true)
            //     .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var document = snapshot.data;
              // document = document.where((element) {
              //   return element.get("vendorId").toString().toLowerCase().contains("$gymId");
              // }).toList();
              // print("yooo yooo $document");
              // print("//////////////////////////");

              return
                // document!.exists
                //   ?
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 110,
                              width: size.width*0.42,

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 5,
                                    left: 10,
                                    child: Text(
                                      "Sales",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "₹ ${document!.get("total_sales")}",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 110,
                              width: size.width*0.42,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 5,
                                    left: 10,
                                    child: Text(
                                      "Bookings",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "${document.get("total_booking")}",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('bookings')
                            .where("vendorId",isEqualTo: gymId)
                          .orderBy("booking_date",descending: true)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot snap) {

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snap.data == null) {
                            return const Text("No Active Bookings");
                          }
                          var doc = snap.data.docs;
                          // if (snapshot.data!.exists){
                          //
                          // }

                          // doc = doc.where((element) {
                          //   print(element.get("order_date").toDate().difference(DateTime.now()).inDays > -2);
                          //   // return element.get("order_date").toDate().difference(DateTime.now()).inDays > -2;
                          //
                          //
                          // });
                          return ListView.builder(
                            physics:
                            const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: doc.length,
                            itemBuilder: (context, index) {

                              if (doc[index]['booking_status'] ==
                                  'active' || doc[index]['booking_status'] =='completed'
                                  || doc[index]['booking_status'] =='upcoming'
                                  // &&
                                  // doc[index]['booking_accepted'] ==
                                  //     true
                                  // &&
                                  // doc[index]["vendorId"] ==
                                  //     gymId.toString()
                                  && doc[index]["booking_date"].toDate().difference(DateTime.now()).inDays>-30
                              )
                              {
                                // print(doc[index]["booking_date"].toDate().difference(DateTime.now()).inDays);
                                return GestureDetector(
                                  onTap: () async {
                                    // print("wewe");
                                    await OrderDetails(
                                      userID: doc[index]['userId'],
                                      bookingID: doc[index]
                                      ['booking_id'],
                                      imageUrl: doc[index]
                                      ["gym_details"]["images"],
                                    );
                                  },
                                  child: CardDetails(
                                    userID:
                                    doc[index]['userId'] ?? "",
                                    userName:
                                    doc[index]['user_name'] ?? "",
                                    bookingID: doc[index]
                                    ['booking_id'] ??
                                        "",
                                    bookingPlan: doc[index]
                                    ['booking_plan'] ??
                                        "",
                                    bookingPrice: double.parse(
                                        doc[index]['booking_price']
                                            .toString()),
                                    bookingdate: DateFormat(
                                        DateFormat.YEAR_MONTH_DAY)
                                        .format(
                                      doc[index]['booking_date']
                                          .toDate(),
                                      // bookingsStatus: ,
                                    ),
                                    tempYear:
                                    DateFormat(DateFormat.YEAR)
                                        .format(
                                      doc[index]['booking_date']
                                          .toDate(),
                                    ),
                                    tempDay:
                                    DateFormat(DateFormat.DAY)
                                        .format(
                                      doc[index]['booking_date']
                                          .toDate(),
                                    ),
                                    tempMonth: DateFormat(
                                        DateFormat.NUM_MONTH)
                                        .format(
                                      doc[index]['booking_date']
                                          .toDate(),
                                    ),
                                    booking_status: '${doc[index]['booking_status'].toString()}',
                                  ),
                                );
                              }
                              return Container();
                            },
                          );
                        },
                      )
                    ],
                  ),
                );
              // : const Center(
              //     child: Text(
              //       "No Bookings",
              //       style: TextStyle(
              //         color: Colors.black,
              //       ),
              //     ),
              //   );
            },
          ),
        ),
      ),
    );
  }
}
