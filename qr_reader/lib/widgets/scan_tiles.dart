import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';

import 'package:url_launcher/url_launcher.dart';

import '../providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarScanById(scans[index].id!);
              },
              child: ListTile(
                leading: Icon(
                    (tipo == 'http') ? Icons.home_outlined : Icons.map_outlined,
                    color: Theme.of(context).primaryColor),
                title: Text(scans[index].valor),
                subtitle: Text('ID: ${scans[index].id}'),
                trailing:
                    const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                onTap: () => launchInWebViewOrVC(context, scans[index]),
              ),
            ));
  }
}
