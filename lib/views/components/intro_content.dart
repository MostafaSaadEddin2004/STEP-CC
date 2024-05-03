import 'package:flutter/material.dart';
import 'package:step_cc/models/intro_data_model.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({
    super.key,
    required this.data,
  });

  final IntroDataModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 64),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                data.title,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(data.content),
        ],
      ),
    );
  }
}
