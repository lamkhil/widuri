// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

downloadCatatanTransaksi(var excel, var label) {
  // for WEB
  // prepare
  final bytes = excel.encode();
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = 'widuri ($label).xlsx';
  html.document.body!.children.add(anchor);

// download
  anchor.click();

// cleanup
  html.document.body!.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}
