import 'package:flutter/material.dart';

class ChoiceTile extends StatelessWidget {
  const ChoiceTile({
    Key? key,
    required this.url,
    required this.text,
  }) : super(key: key);
  final String url;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 3,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  url,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
