import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyam_vandor/constants.dart';

class AllTimeSales extends StatelessWidget {
  const AllTimeSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String salesTotal = '\$260';
    String salesStatus = '+ \$20';
    String bookingsTotal = '70';
    String bookingsStatus = '+ 3';
    // sales() async{
    final stream =  FirebaseFirestore.instance.collectionGroup('user_booking').snapshots();

          // .where("vendorId", isEqualTo: "dipteshmandal555@gmail.com").where("booking_accepted", isEqualTo: true)

      // return stream;
    // }
    int sum = 0;
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: StreamBuilder(
        stream: stream,
        //     .where((event){
        //
        // }),
        // FirebaseFirestore.instance
        //     .collectionGroup('user_booking')
        // // .orderBy("order_time",descending: true)
        //     // .where("vendorId", isEqualTo: "T@gmail.com")
        //     // .where("booking_accepted", isEqualTo: true)
        //     .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var document = snapshot.data!.docs;
             document=document
              .where((element) {
            return element
                .get("vendorId")
                .toString()
                .contains("T@gmail.com")
            ;
          }).toList();

          
          return document.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: kContainerColor,
                                borderRadius: BorderRadius.circular(
                                    kContainerBorderRadius),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(kDefaultPadding),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Sales',
                                          style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          salesStatus,
                                          style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: kStatuscolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 22),
                                      child: Text(
                                        salesTotal,
                                        style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: kContainerColor,
                                borderRadius: BorderRadius.circular(
                                    kContainerBorderRadius),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(kDefaultPadding),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Bookings',
                                          style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          bookingsStatus,
                                          style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: kStatuscolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 22),
                                      child: Text(
                                        bookingsTotal,
                                        style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: document.length,
                          itemBuilder: (context, index) {

                            DateTime booking_date = DateTime.parse(
                                document[index]['booking_date']
                                    .toDate()
                                    .toString());
                            print(booking_date);
                            DateTime startingDate = DateTime(
                                booking_date.year, booking_date.month, booking_date.day);
                            DateTime planEndDuration = DateTime.parse(
                                document[index]['plan_end_duration']
                                    .toDate()
                                    .toString());
                            DateTime endingDate = DateTime(planEndDuration.year,
                                planEndDuration.month, planEndDuration.day);
                            //sum+=int.parse(document[index]['booking_price']);
                            return Container(
                              decoration: BoxDecoration(
                                color: kContainerColor,
                                borderRadius: BorderRadius.circular(
                                    kContainerBorderRadius),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(kDefaultPadding - 1),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Text(
                                            document[index]['user_name'],
                                            style: TextStyle(
                                              fontFamily: kFontFamily,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '${months[startingDate.month - 1]} ${startingDate.day} - ${months[endingDate.month - 1]} ${endingDate.day}',
                                          style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          document!=null?document[index]['booking_plan']:"",
                                          style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: kDurationColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          document[index]['booking_price'].toString(),
                                          style: TextStyle(
                                            fontFamily: kFontFamily,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                          height: 31,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 9,
                                              width: 9,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: document[index]['booking_status'] == 'a'
                                                    ? kActiveCircleColor
                                                    : kCompletedCircleColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              document[index]['booking_status'] == 'active' ? 'Active' : 'Completed',
                                              style: TextStyle(
                                                fontFamily: kFontFamily,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: kDurationColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            height: kDividerHeight,
                            color: kDividerColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text(
                    "No Bookings",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
