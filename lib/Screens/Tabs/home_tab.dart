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
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          toolbarHeight: kToolbarHeight + 80,
          backgroundColor: Colors.transparent,
          primary: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleSpacing: 0,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Image.asset(
              "Assets/Images/menu.png",
              scale: 1,
              color: Colors.black,
            ),
          ),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 30, //set desired REAL HEIGHT
              width: 60, //set desired REAL WIDTH
              child: Transform.scale(
                transformHitTests: false,
                scale: 0.8,
                child: CupertinoSwitch(
                  value: status,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          key: _drawerkey,
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
                  onPressed: () {},
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

class DrawerTitleWidget extends StatelessWidget {
  const DrawerTitleWidget({Key? key, this.callback}) : super(key: key);

  final Function? callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              callback!();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          const Center(
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
