import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/constant.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: 42.h,
          //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),border: Border.all(
          //           color: Colors.grey,
          //           width: 1,
          //         )),
          //         child: Center(
          //           child: Text("Score: 3/5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         height: 42.h,
          //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),border: Border.all(
          //           color: Colors.grey,
          //           width: 1,
          //         )),
          //         child: Center(
          //           child: Text("Time: 30 Sec", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 15,),
          // Container(
          //   height: 42.h,
          //   width: 346.w,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(6),
          //       color: Color(0xffDC1C29)),
          //   child: Center(
          //     child: Text(
          //       "Get Your Rewards",
          //       style: TextStyle(
          //           fontWeight: FontWeight.w600,
          //           fontSize: 16,
          //           color: Colors.white),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 15.h,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/paytm.png"),
                fit: BoxFit.fill,
                height: 21.h,
                width: 69.w,
              ),
              Image(
                image: AssetImage("assets/images/amazon.png"),
                fit: BoxFit.fill,
                height: 25.h,
                width: 82.w,
              ),
              Image(
                image: AssetImage("assets/images/upi.png"),
                fit: BoxFit.fill,
                height: 37.h,
                width: 75.w,
              )
            ],
          ),
        ],
      ),
    );
    
    
    
    
    
  }
}
