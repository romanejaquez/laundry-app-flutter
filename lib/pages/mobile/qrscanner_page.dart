import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/qrscan_data_service.dart';
import 'package:provider/provider.dart';
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

          QRScanDataService qrScanDataService = context.read<QRScanDataService>();
          qrScanDataService.decodeScannedValue(decodedValue, () {
            resultFound = false;
          });
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