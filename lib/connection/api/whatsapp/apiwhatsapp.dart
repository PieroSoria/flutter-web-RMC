// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

class ApiWhatsApp {
  void launchWhatsAppWeb(String telefono,String mensaje) {
    final phoneNumber = telefono;
    final message = Uri.encodeComponent(mensaje);
    final url = 'https://wa.me/$phoneNumber?text=$message';
    html.window.open(url, '_blank');
  }
}
