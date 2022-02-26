import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyam_vandor/app_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var status = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          toolbarHeight: kToolbarHeight + 65,
          backgroundColor: Colors.transparent,
          primary: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleSpacing: 0,
          elevation: 0,
          title: const Text(
            'Transformers Gym',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
          bottom: PreferredSize(
            child: Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 57.0),
                      child: Text(
                        'Branch Barakar',
                        style: TextStyle(
                          color: Color(0xffBDBDBD),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset("Assets/Images/Search.png"),
                      hintText: 'Search',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: const Size.fromHeight(0),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 18,
              ),
              child: Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: status,
                  onChanged: (value) {
                    setState(
                      () {
                        status = value;
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: const [
              DrawerTitleWidget(),
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.lock_outline,
                  color: Color(0xffB6B6B6),
                ),
                title: Text('Change Password'),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.notifications_active,
                  color: Color(0xffB6B6B6),
                ),
                title: Text('Notifications'),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.star_border_outlined,
                  color: Color(0xffB6B6B6),
                ),
                title: Text('Rate us'),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.support_rounded,
                  color: Color(0xffB6B6B6),
                ),
                title: Text('Support'),
              )
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset("Assets/Images/no_bookings.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTitleWidget extends StatelessWidget {
  const DrawerTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.close,
            color: Colors.black,
          ),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
