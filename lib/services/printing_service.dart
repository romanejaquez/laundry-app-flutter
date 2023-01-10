import "dart:ui" as ui;
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import './../brotherlib/label_info.dart';
import './../brotherlib/printer_info.dart' as pi;

class PrintingService {

  Future<pi.PrinterStatus> printImageBluetooth() async {

    var printer = new pi.Printer();
    var printInfo = pi.PrinterInfo();
    printInfo.printerModel = pi.Model.PT_P910BT;
    printInfo.printMode = pi.PrintMode.FIT_TO_PAGE;
    printInfo.isAutoCut = true;
    printInfo.port = pi.Port.BLUETOOTH;
    printInfo.numberOfCopies = 1;
    printInfo.labelNameIndex = PT.ordinalFromID(PT.W36.getId());   
    
    List<pi.BluetoothPrinter> netPrinters =
        await printer.getBluetoothPrinters([pi.Model.PT_P910BT.getName()]);
    print("Bt Printers Found: $netPrinters");
    printInfo.macAddress = netPrinters.single.macAddress;

    await printer.setPrinterInfo(printInfo);

    TextStyle style = TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold
    );

    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          fontSize:   style.fontSize,
          fontFamily: style.fontFamily,
          fontStyle:  style.fontStyle,
          fontWeight: style.fontWeight,
          textAlign: TextAlign.center,
          maxLines: 10,
        )
    )
      ..pushStyle(style.getTextStyle())
      ..addText("Hello from Flutter!");

    ui.Paragraph paragraph = paragraphBuilder.build()..layout(ui.ParagraphConstraints(width: 300));

    pi.PrinterStatus status = await printer.printText(paragraph);

    print("Got Status: $status and Error: ${status.errorCode.getName()}");
    return status;
  }
}