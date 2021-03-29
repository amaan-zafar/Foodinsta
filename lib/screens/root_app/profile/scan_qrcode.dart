import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;

class QRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          SafeArea(
              child: Column(
            children: [
              // AppBar
              SizedBox(
                height: 74,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Text(
                        Constants.APP_LABEL,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      SizedBox(width: 10),
                      CustomIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Styles.iconColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Body
            ],
          ))
        ],
      ),
    );
  }
}

// import 'package:barcode_scan_fix/barcode_scan.dart';
// import 'package:flutter/material.dart';

// class ScanQR extends StatefulWidget {
//   @override
//   _ScanQRState createState() => _ScanQRState();
// }

// class _ScanQRState extends State<ScanQR> {
//   String qrCodeResult = "Not Yet Scanned";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Scan QR Code"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             //Message displayed over here
//             Text(
//               "Result",
//               style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             Text(
//               qrCodeResult,
//               style: TextStyle(
//                 fontSize: 20.0,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 20.0,
//             ),

//             //Button to scan QR code
//             FlatButton(
//               padding: EdgeInsets.all(15),
//               onPressed: () async {
//                 String codeSanner =
//                     await BarcodeScanner.scan(); //barcode scnner
//                 setState(() {
//                   qrCodeResult = codeSanner;
//                 });
//               },
//               child: Text(
//                 "Open Scanner",
//                 style: TextStyle(color: Colors.indigo[900]),
//               ),
//               //Button having rounded rectangle border
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(color: Colors.indigo[900]),
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
