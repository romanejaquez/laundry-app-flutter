import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({Key? key}) : super(key: key);

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool resultFound = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.5),
        centerTitle: true,
        title: const Icon(LaundryIcons.logo, color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            GoRouter.of(context).go('/landing');
          },
        ),
      ),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: OverlayWithQRScanPainter(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.qr_code, color: Colors.white, size: 80),
                  SizedBox(height: 20),
                  Text('Scan QRCode from receipt by\nplacing it in the square guide above',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    controller!.resumeCamera();
    controller!.scannedDataStream.listen((scanData) {
      
      if (!resultFound) {
        resultFound = true;

        if (scanData.code != null && scanData.code!.isNotEmpty) {

          Map<String, dynamic> decodedValue = json.decode(scanData.code!);

          if (decodedValue.keys.contains('orderId')) {

            // debugPrint('Scan Data: ' + scanData.code.toString());
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (ctx) {
                return Container(
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.qr_code, color: LaundryAppColors.darkBlue, size: 80),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Order Id', style: LaundryStyles.normalBlueTextStyle),
                              Text('#${decodedValue['orderId']}', style: LaundryStyles.mediumBoldBlueTextStyle),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LaundryAppColors.mainBlue,
                          shape: const StadiumBorder(),
                          elevation: 0,
                          shadowColor: Colors.transparent
                        ),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.send, size: 30),
                              SizedBox(width: 40),
                              Text('Send to POS',
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 20)
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  )
                );
              },
              
            ).whenComplete(() {
              resultFound = false;
            });
          }
          
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class OverlayWithQRScanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54;

    var rectSide = (size.width / 2);
    Rect rect = Offset(rectSide - (rectSide / 2), (size.height / 2) - (rectSide / 2)) & Size(rectSide, rectSide);
    Radius rectRadius = const Radius.circular(10);

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(
          Rect.fromLTWH(0, 0, size.width, size.height)
        ),
        Path()
          ..addRRect(RRect.fromRectAndCorners(rect,
            topLeft: rectRadius,
            topRight: rectRadius,
            bottomLeft: rectRadius,
            bottomRight: rectRadius,
          ))
          ..close(),
      ),
      paint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}