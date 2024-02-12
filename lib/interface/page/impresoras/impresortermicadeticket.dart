import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class ImprTermicaTicket extends StatefulWidget {
  final String pageview;
  const ImprTermicaTicket({super.key, required this.pageview});

  @override
  State<ImprTermicaTicket> createState() => _ImprTermicaTicketState();
}

class _ImprTermicaTicketState extends State<ImprTermicaTicket> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ObtenerSectionPage(page: widget.pageview),
          ),
        ],
      ),
    );
  }
}
