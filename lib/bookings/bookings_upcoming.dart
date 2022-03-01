import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyam_vandor/constants.dart';

class UpcomingBookings extends StatelessWidget {
  const UpcomingBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> users = ['John Doe','Dwight Shrutte','Jane Cooper'];
    final List<String> date = ['Feb 01 - Mar 01', 'Feb 10 - May 09', 'Mar 20 - Sep 19'];
    final List<String> price = ['100','400','999'];
    final List<String> duration = ['Gym 1- Month','Gym 3- Months','Gym 6- Months'];

    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: ListView.separated(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Container(
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(kContainerBorderRadius),
              ),
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding-1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Row(
                        children: [
                          Text(
                            users[index],
                            style: TextStyle(
                              fontFamily: kFontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$${price[index]}',
                            style: TextStyle(
                              fontFamily: kFontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      date[index],
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      duration[index],
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: kDurationColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(height: kDividerHeight, color: kDividerColor,),
      ),
    );
  }
}
