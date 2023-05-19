// import 'package:flutter/material.dart';
//
// import '../utility/app_colors.dart';
// import '../utility/constant.dart';
//
// class TermsAndCondition extends StatefulWidget {
//   const TermsAndCondition({Key? key}) : super(key: key);
//
//   @override
//   State<TermsAndCondition> createState() => _TermsAndConditionState();
// }
//
// class _TermsAndConditionState extends State<TermsAndCondition> {
//   // late PdfControllerPinch _pdfControllerPinch;
//
//   String _pdfUrl =
//       'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';
//
//   bool _isLoading = true;
//   int _totalPages = 0;
//   int _currentPage = 0;
//
//   PDFViewController? _pdfViewController;
//   // @override
//   // void initState() {
//   //   _pdfControllerPinch = PdfControllerPinch(
//   //     document: PdfDocument.openData(
//   //       InternetFile.get(
//   //         "https://almondvirtex.s3.ap-south-1.amazonaws.com/loyalty_app/1654584510709.pdf",
//   //       ),
//   //     ),
//   //   );
//   //
//   //   super.initState();
//   // }
//   //
//   // @override
//   // void dispose() {
//   //   _pdfControllerPinch.dispose();
//   //
//   //   // TODO: implement dispose
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     // log.info("pdf viewer called..");
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back_ios_new_sharp)),
//         // actions: [
//         //   Column(
//         //     mainAxisSize: MainAxisSize.min,
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     crossAxisAlignment: CrossAxisAlignment.end,
//         //     children: [
//         //       Text(
//         //         "150250",
//         //         style: GoogleFonts.inter(
//         //             fontSize: 20.sp, fontWeight: FontWeight.bold),
//         //       ),
//         //       Text("Current Points",
//         //           style: GoogleFonts.inter(
//         //               fontSize: 10.sp, fontWeight: FontWeight.normal)),
//         //     ],
//         //   ),
//         //   SizedBox(
//         //     width: 10.w,
//         //   ),
//         //   SizedBox(
//         //     height: 30.h,
//         //     width: 30.w,
//         //     child: Image.asset("assets/star.png"),
//         //   ),
//         //   SizedBox(
//         //     width: 20.w,
//         //   ),
//         // ],
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               gradient: gradientTheme(),
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(13),
//                   bottomRight: Radius.circular(13))),
//         ),
//         title: Text("Terms & Conditions"),
//         backgroundColor: Colors.white,
//         shape: const ContinuousRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30))),
//       ),
//       body: Container(
//           width: SCREEN_WIDTH(context),
//           height: SCREEN_HEIGHT(context),
//           //   color: Colors.transparent,
//           child: PDFView(
//             filePath: _pdfUrl,
//             autoSpacing: true,
//             enableSwipe: true,
//             pageSnap: true,
//             swipeHorizontal: true,
//             onError: (error) {
//               print(error.toString());
//             },
//             onRender: (_pages) {
//               setState(() {
//                 _isLoading = false;
//                 _totalPages = _pages!;
//               });
//             },
//             onViewCreated: (PDFViewController pdfViewController) {
//               setState(() {
//                 _pdfViewController = pdfViewController;
//               });
//             },
//             // onPageChanged: (int page, int total) {
//             //   setState(() {
//             //     _currentPage = page;
//             //     _totalPages = total;
//             //   });
//             // },
//           ),
//         // _isLoading
//         //     ? Center(
//         //   child: CircularProgressIndicator(),
//         // )
//         //     : Offstage(),
//       ),
//     );
//   }
// }
