import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyam_vandor/constants.dart';

class AllTimeSales extends StatelessWidget {
  const AllTimeSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> users = ['John Doe','Dwight Shrutte','Jane Cooper','Esther Howard','Lisa Ann'];
    final List<String> date = ['Feb 01 - Mar 01', 'Feb 10 - May 09', 'Mar 20 - Sep 19','Feb 01','Feb 28'];
    final List<String> price = ['100','400','999', '100','100'];
    final List<String> duration = ['Gym 1- Month','Gym 3- Months','Gym 6- Months','Per day','Per day'];
    final List<String> status = ['Active','Completed','Active','Completed','Completed'];
    String salesTotal = '\$260';
    String salesStatus = '+ \$20';
    String bookingsTotal = '70';
    String bookingsStatus = '+ 3';


    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(kContainerBorderRadius),
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
                              Spacer(),
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
                            padding: const EdgeInsets.only(top: 6, bottom: 22),
                            child: Text(
                              salesTotal,
                              style: TextStyle(
                                fontFamily: kFontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(kContainerBorderRadius),
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
                              Spacer(),
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
                            padding: const EdgeInsets.only(top: 6, bottom: 22),
                            child: Text(
                              bookingsTotal,
                              style: TextStyle(
                                  fontFamily: kFontFamily,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 23,),
            Expanded(
              child: ListView.separated(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(kContainerBorderRadius),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(kDefaultPadding-1),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                child: Text(
                                  users[index],
                                  style: TextStyle(
                                    fontFamily: kFontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                                  color: kDurationColor,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$${price[index]}',
                                style: TextStyle(
                                  fontFamily: kFontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Divider(color: Colors.white, height: 31,),
                              Row(
                                children: [
                                  Container(
                                    height: 9,
                                    width: 9,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: status[index] == 'Active' ? kActiveCircleColor : kCompletedCircleColor,
                                    ),
                                  ),
                                  SizedBox(width: 4,),
                                  Text(
                                    status[index],
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
                separatorBuilder: (context, index) => Divider(height: kDividerHeight, color: kDividerColor,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
