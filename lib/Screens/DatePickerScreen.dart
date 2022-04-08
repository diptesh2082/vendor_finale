import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(const DatePickerScreen());
} // Main Added For Running Purpose

class DatePickerScreen extends StatelessWidget {
  const DatePickerScreen({Key? key}) : super(key: key);

  final TextStyle regularStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'PoppinsRegular',
      fontSize: 12,
      fontWeight: FontWeight.w400);

  final TextStyle boldStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w700);
  final TextStyle buttonTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 51),
                child: Text(
                  'Select a Date',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PoppinsSemiBold',
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 26, 16, 10),
                child: SizedBox(
                  height: 327,
                  width: 400,
                  child: Card(
                    child: SfDateRangePicker(
                      //Daddy Widget aka Calender Widget
                      monthCellStyle: const DateRangePickerMonthCellStyle(
                        // TextStyle of each date
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PoppinsRegular',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      view: DateRangePickerView.month,
                      monthViewSettings: const DateRangePickerMonthViewSettings(
                          // Week Names header widget
                          viewHeaderStyle: DateRangePickerViewHeaderStyle(
                            textStyle: TextStyle(color: Colors.grey),
                          ),
                          firstDayOfWeek: 1,
                          dayFormat: 'EEE'),
                      selectionMode: DateRangePickerSelectionMode
                          .range, // Selection Pattern property
                      //header Style
                      headerStyle: const DateRangePickerHeaderStyle(
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      //Color Properties
                      rangeSelectionColor: const Color(0x66FFCA00),
                      startRangeSelectionColor: const Color(0xffFFCA00),
                      endRangeSelectionColor: const Color(0xffFFCA00),
                      todayHighlightColor: const Color(0xffFFCA00),
                      onSelectionChanged: _onSelectionChanged,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              //Card _ 2
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: SizedBox(
                  height: 159,
                  width: 400,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Gym 3 - Months',
                          style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('STARTS', style: regularStyle),
                                Text('JAN 14th', style: boldStyle),
                                Text('Monday', style: regularStyle),
                              ],
                            ),
                            Icon(
                              Icons.arrow_circle_right_sharp,
                              size: 40,
                              color: HexColor('#FFCA00'),
                            ),
                            Column(
                              children: [
                                Text('ENDS', style: regularStyle),
                                Text('April 13th', style: boldStyle),
                                Text('Wednesday', style: regularStyle),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 142),
                child: GestureDetector(
                  child: SizedBox(
                    height: 54,
                    width: 358,
                    child: Card(
                      child: Center(
                        child: Text('Proceed', style: buttonTextStyle),
                      ),
                      color: HexColor('#292F3D'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    DateTime startDate = args.value.startDate;
    DateTime endDate = args.value.endDate;
    print(startDate);
    print(endDate);
  }
}
