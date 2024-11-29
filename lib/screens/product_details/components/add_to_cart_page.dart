import 'package:flutter/material.dart';
import 'package:product_mockup/constants/color_constants.dart';
import 'package:product_mockup/constants/ui_helper.dart';

class CartDetailsPage extends StatelessWidget {
  final String colorName;
  final String colorCode;
  final String productName;
  final int price;
  final String imageUrl;

  const CartDetailsPage({
    super.key,
    required this.colorName,
    required this.colorCode,
    required this.price,
    required this.productName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Cart Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, size: 100),
                  ),
                ),
                UIHelper.horizontalSpaceMedium(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyles().heading4SemiBold,
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Row(
                        children: [
                          Text("Color: $colorName",
                              style: const TextStyles().baseRegular),
                          UIHelper.horizontalSpaceVerySmall(),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color(
                                int.parse(colorCode.replaceFirst('#', '0xff')),
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Text(
                        "Rs. $price",
                        style: const TextStyles().heading4SemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: const TextStyles().heading4SemiBold,
                  ),
                  Text(
                    "Rs. $price",
                    style: const TextStyles().heading4SemiBold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
