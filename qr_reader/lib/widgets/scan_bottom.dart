import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import '../utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
//        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', true, ScanMode.QR);
        // final barcodeScanRes = 'https://fernando-herrera.com';

        final barcodeScanRes = 'geo:45.280089,-75.922405';
        // Si el usuario canceló no hacemos nada.
        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        launchInWebViewOrVC(context, nuevoScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
