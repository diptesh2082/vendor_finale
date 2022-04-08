import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyam_vandor/Screens/home__screen.dart';
import 'package:vyam_vandor/Screens/login_screen.dart';
import 'package:vyam_vandor/Screens/order_details_screen.dart';
import 'package:vyam_vandor/Services/firebase_firestore_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vyam_vandor/app_colors.dart';
import 'package:get/get.dart';
import '../../widgets/active_booking.dart';
import '../../widgets/booking_card.dart';
import '../../widgets/drawer_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../widgets/past_booking.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var status = true;
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  bool showBranches = false;
  final _auth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future getDevicetoken() async {
    try {
      setState(() async {
        device_token = await _firebaseMessaging.getToken();
      });

      print("this is the token $device_token");
      return device_token;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    print("device token ${device_token}");
    getDevicetoken();
    print("device token ${device_token}");
    super.initState();
  }

  bool isHeightTobeIncreased = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("product_details")
              // .where(field)

              // .where(field)
              .doc(_auth.currentUser!.email.toString())
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(
              children: [
                Scaffold(
                  key: _drawerkey,
                  backgroundColor: AppColors.backgroundColor,
                  // floatingActionButton: FloatingActionButton(
                  //   onPressed: () {
                  //     // // FirebaseFirestoreAPi().updateTokenToFirebase();
                  //     // FirebaseFirestoreAPi().checkTokenChange();
                  //   },
                  // ),
                  appBar: buildAppBar(
                    context,
                    isGymOpened: snapshot.data!.get("gym_status"),
                    gymLocation: snapshot.data!.get("landmark"),
                    gymname: snapshot.data!.get("name"),
                    leadingCallback: () {
                      if (showBranches == false) {
                        _drawerkey.currentState!.openDrawer();
                      }
                    },
                  ),
                  drawer: buildDrawer(context),
                  body: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView(
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            //Upcoming Bookings Cards
                            ExpansionTile(
                              title: const Text('Upcoming Bookings'),
                              children: [
                                StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collectionGroup('user_booking')
                                      // .where("vendorId",isEqualTo: gymId)
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
                                      return const Text("No Upcoming Bookings");
                                    }

                                    var doc = snap.data.docs;
                                    // doc = doc.where((element) {
                                    //   return element
                                    //       .get('vendorId')
                                    //       .toString()
                                    //       .toLowerCase()
                                    //       .contains(_auth.currentUser!.email.toString().toLowerCase());
                                    // }).toList();
                                    print(doc);
                                    return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: doc.length,
                                      itemBuilder: (context, index) {
                                        // print("device token ${device_token}");
                                        print(
                                            "gfhfhgjfdkdyuuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuy ${gymId}");
                                        print(
                                            "gfhfhgjfdkdyuuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuy ${gymId}");
                                        print(
                                            "gfhfhgjfdkdyuuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuyuy ${gymId}");
                                        if (doc[index]['booking_status'] ==
                                                'upcoming'
                                            // && doc[index]["vendorId"]==gymId
                                            )
                                        // if(doc[index][])
                                        {
                                          return BookingCard(
                                            userID: doc[index]['userId'] ?? "",
                                            userName:
                                                doc[index]['user_name'] ?? "",
                                            bookingID:
                                                doc[index]['booking_id'] ?? "",
                                            bookingPlan: doc[index]
                                                    ['booking_plan'] ??
                                                "",
                                            bookingPrice: doc[index]
                                                    ['booking_price'] ??
                                                "",
                                            // docs: doc[index],
                                            bookingdate: DateFormat(
                                                    DateFormat.YEAR_MONTH_DAY)
                                                .format(doc[index]
                                                        ['booking_date']
                                                    .toDate()),
                                            otp: int.parse(
                                                doc[index]['otp_pass']),
                                          );
                                        }
                                        return Container();
                                      },
                                    );
                                  },
                                )
                              ],
                            ),

                            ///Active Booking Cards
                            ExpansionTile(
                              title: const Text('Active Bookings'),
                              children: [
                                StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collectionGroup('user_booking')
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
                                    return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: doc.length,
                                      itemBuilder: (context, index) {
                                        if (doc[index]['booking_status'] ==
                                                'active' &&
                                            doc[index]['booking_accepted'] ==
                                                true &&
                                            doc[index]["vendorId"] ==
                                                _auth.currentUser!.email) {
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
                                            child: ActiveBookingCard(
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
                            ////
                            ///
                            ///
                            ///Past Bookings Cards
                            ExpansionTile(
                              title: const Text('Past Bookings'),
                              children: [
                                StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collectionGroup('user_booking')
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
                                      return const Text("No Past Bookings");
                                    }

                                    var doc = snap.data.docs;

                                    return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: doc.length,
                                      itemBuilder: (context, index) {
                                        if (doc[index]['booking_status'] ==
                                                'completed' &&
                                            doc[index]['booking_accepted'] ==
                                                true) {
                                          return PastBookingCard(
                                            userID: doc[index]['userId'] ?? "",
                                            userName:
                                                doc[index]['user_name'] ?? "",
                                            bookingID:
                                                doc[index]['booking_id'] ?? "",
                                            bookingPlan: doc[index]
                                                    ['booking_plan'] ??
                                                "",
                                            bookingPrice: doc[index]
                                                    ['booking_price'] ??
                                                "",
                                            bookingdate: doc[index]
                                                    ['booking_date'] ??
                                                "",
                                          );
                                        }
                                        return Container();
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                showBranches == false
                    ? Container()
                    : Positioned(
                        top: 80,
                        left: 51,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          width: 280,
                          height: isHeightTobeIncreased ? 400 : 250,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('product_details')
                                  // .where("gym_id",
                                  //     isEqualTo: FirebaseAuth
                                  //         .instance.currentUser!.email)
                                  .where(
                                    'token',
                                    arrayContains: device_token,
                                  )
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                print(device_token);
                                if (snapshot.data == null) {
                                  return Container();
                                }
                                if (snapshot.data.docs.length + 2 > 3) {
                                  isHeightTobeIncreased = true;
                                }
                                if (snapshot.data.docs.length + 2 <= 3) {
                                  isHeightTobeIncreased = false;
                                }
                                if (snapshot.data == ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                print(FirebaseAuth.instance.currentUser!.email);
                                List temp = snapshot.data.docs.toList();
                                if (temp.isEmpty) {
                                  return const Center(
                                    child: Text("No branches to show"),
                                  );
                                } else {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: ((context, index) {
                                      if (index == snapshot.data.docs.length) {
                                        print(device_token);
                                        return ListTile(
                                          trailing: const Icon(
                                            Icons.add,
                                            color: Colors.black54,
                                          ),
                                          title: const Text(
                                            'Add another Account',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onTap: () {
                                            print("Add another Login Session");
                                            Get.to(
                                              const LoginScreen(),
                                            );
                                          },
                                        );
                                      }
                                      return ListTile(
                                        onTap: () async {
                                          print(snapshot.data.docs[index]
                                              ["gym_id"]);
                                          // setState(()async {
                                          gymId = await snapshot
                                              .data.docs[index]["gym_id"];

                                          // });

                                          Navigator.pushReplacement(
                                              (context),
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen(
                                                          email: gymId)));
                                          // Navigator.pop(context);
                                        },
                                        title: Text(
                                          snapshot.data.docs[index]['name'],
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        subtitle: Text(
                                          snapshot.data.docs[index]['landmark'],
                                          style: const TextStyle(
                                            color: Color(0xffBDBDBD),
                                          ),
                                        ),
                                      );
                                    }),
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      color: Color(0xffD6D6D6),
                                    ),
                                    itemCount: snapshot.data.docs.length + 1,
                                  );
                                }
                              }),
                        ),
                      )
              ],
            );
          }),
    );
  }

  AppBar buildAppBar(BuildContext context,
      {required String? gymname,
      required bool? isGymOpened,
      required String? gymLocation,
      Function? leadingCallback}) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 80,
      backgroundColor: Colors.transparent,
      primary: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleSpacing: 0,
      elevation: 0,
      // leading: IconButton(
      //     onPressed: () {
      //       leadingCallback!();
      //     },
      //     icon: const Icon(
      //       Icons.menu,
      //       color: Colors.black,
      //     )),
      title: Text(
        gymname!,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 1,
        ),
      ),
      bottom: PreferredSize(
        child: GestureDetector(
          onTap: () {
            print("Open that Alert dialogue Box");
            setState(() {
              showBranches = !showBranches;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 57.0),
                    child: Text(
                      gymLocation!,
                      style: const TextStyle(
                        color: Color(0xffBDBDBD),
                      ),
                    ),
                  ),
                  Icon(
                    !showBranches
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: const Color(0xff130F26),
                    size: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Search(context)
            ],
          ),
        ),
        preferredSize: const Size.fromHeight(0),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          height: 30, //set desired REAL HEIGHT
          width: 60, //set desired REAL WIDTH
          child: Transform.scale(
            transformHitTests: false,
            scale: 0.8,
            child: CupertinoSwitch(
              value: isGymOpened!,
              onChanged: (value) {
                FirebaseFirestoreAPi()
                    .updateGymStatusToFirestore(isGymOpened: value);
                print(value);
                setState(() {
                  status = value;
                });
                FirebaseFirestoreAPi()
                    .updateGymStatusToFirestore(isGymOpened: value);
              },
              activeColor: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Drawer buildDrawer(
    BuildContext context,
  ) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Stack(
        // shrinkWrap: true,
        children: [
          Column(
            children: [
              DrawerTitleWidget(
                callback: () {
                  Navigator.pop(context);
                },
              ),
              buildDrawerListItem(
                title: 'Change Password',
                iconData: 'lock',
              ),
              buildDrawerListItem(
                title: 'Notifications',
              ),
              buildDrawerListItem(
                title: 'Rate us',
                iconData: 'star',
              ),
              buildDrawerListItem(
                title: 'Support',
                iconData: 'message-question',
              ),
            ],
          ),
          Positioned(
            bottom: 150,
            left: 120,
            child: ElevatedButton(
              onPressed: () {
                _auth.signOut();
              },
              child: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xff292F3D),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 10,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding Search(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 3),
      child: Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: 51,
            width: MediaQuery.of(context).size.width * .9,
            child: TextFormField(
              onFieldSubmitted: (value) async {
                FocusScope.of(context).unfocus();
                // showCard=true;
              },
              onTap: () {
                // Navigator.pop(context);
              },
              // controller:searchController,
              // onTap: (){
              //
              // },
              //
              // onChanged: (value) {
              //   // print(value.toString());
              //   setState(() {
              //
              //     searchGymName = value.toString();
              //     // value2=value.toString();
              //   });
              //   //
              //   // print(searchGymName);
              // },
              // onEditingComplete: (){
              //   setState(() {
              //     // var value;
              //     searchGymName=value2.toString();
              //   });
              // },
              // onSubmitted: (value) {
              //   // ignore: avoid_print
              //   print('Submitted text: $value');
              // },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildDrawerListItem(
      {required String? title, String? iconData = 'lock'}) {
    return ListTile(
      minLeadingWidth: 0,
      leading: Image.asset("Assets/Images/$iconData.png"),
      title: Text(
        title!,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}
