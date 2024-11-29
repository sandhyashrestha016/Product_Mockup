import 'package:flutter/material.dart';
import 'package:product_mockup/api/model/product_model.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.data});

  final ProductData data;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: widget.data.ratings == 0
            ? const Text("There are no reviews/ratings")
            : const SizedBox(),
      ),
    );
  }
}
