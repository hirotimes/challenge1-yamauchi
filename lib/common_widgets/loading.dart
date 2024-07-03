import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChargeSpotLoading extends StatelessWidget {
  const ChargeSpotLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.green,
          size: 50.0,
        ),
      ),
    );
  }
}
