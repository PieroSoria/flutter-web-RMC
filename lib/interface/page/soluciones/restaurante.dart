import 'package:flutter/material.dart';
import 'package:rmc_bussiness/controller/Function/obtenersection.dart';

class RestauranteScreen extends StatefulWidget {
  final String pageview;
  const RestauranteScreen({super.key, required this.pageview});

  @override
  State<RestauranteScreen> createState() => _RestauranteScreenState();
}

class _RestauranteScreenState extends State<RestauranteScreen> {
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
