import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/widgets/laundry_action_button.dart';
import 'package:laundry_app/widgets/receipt_view_toast.dart';
import 'package:rive/rive.dart';

class ServiceStep4 extends StatefulWidget {
  const ServiceStep4({Key? key}) : super(key: key);

  @override
  State<ServiceStep4> createState() => _ServiceStep4State();
}

class _ServiceStep4State extends State<ServiceStep4> with SingleTickerProviderStateMixin {

  Artboard? _riveArtboard;
  StateMachineController? controller;
  bool riveLoaded = false;

  void _onRiveInit(Artboard board) {
    var smController = StateMachineController.fromArtboard(
      board,
      "checkmark_sm",
      onStateChange: (p0, p1) {
      }
    ) as StateMachineController;
    
      board.addController(smController);
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        riveLoaded = true;
      });
    });

    // Future.delayed(const Duration(seconds: 2), () {
    //   rootBundle.load('./assets/anims/checkmark_complete.riv').then(
    //     (data) async {
    //       final file = RiveFile.import(data);

    //       final artboard = file.mainArtboard;
    //       controller =
    //           StateMachineController.fromArtboard(artboard, 'checkmark_sm');
    //       if (controller != null) {
    //         _riveArtboard!.addController(controller!);
    //       }
    //       setState(() {
    //         _riveArtboard = artboard;
    //       });
    //     },
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         !riveLoaded ? const SizedBox(width: 150, height: 150) :
          SizedBox(
            width: 150,
            height: 150,
            child: RiveAnimation.asset(
              './assets/anims/checkmark_complete.riv',
              fit: BoxFit.contain,
              onInit: _onRiveInit
            ),
          ),
          // _riveArtboard != null ? SizedBox(
          //   width: 150,
          //   height: 150,
          //   child: Rive(
          //       artboard: _riveArtboard!.instance(),
          //       fit: BoxFit.contain
          //     )
          //   ) : const SizedBox(width: 150, height: 150),
          Text('Order', style: LaundryStyles.mediumNormalBlueTextStyle),
          Text('#BX2344', style: LaundryStyles.xLargeBoldBlueTextStyle),
          Text('is complete!', style: LaundryStyles.normalBlueTextStyle),
          const SizedBox(height: 20),
          LaundryActionButton(
            label: 'View Receipt',
            color: LaundryAppColors.mainBlue,
            icon: Icons.receipt,
            onPressed: () {

              showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return ReceiptViewToast();
                });
            },
          )

        ],
      ),
    );
  }
}