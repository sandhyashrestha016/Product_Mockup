import 'package:flutter/material.dart';
import 'package:product_mockup/api/model/product_model.dart';
import 'package:product_mockup/constants/ui_helper.dart';

class ImagePreviewPage extends StatefulWidget {
  const ImagePreviewPage({super.key, required this.data});
  final ProductData data;

  @override
  State<ImagePreviewPage> createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.data.images!.map((imageUrl) {
            int index = widget.data.images!.indexOf(imageUrl);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedImageIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedImageIndex == index
                        ? Colors.blue
                        : Colors.transparent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        UIHelper.horizontalSpaceSmall(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.all(2.0),
            height: MediaQuery.sizeOf(context).height * 0.435,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(widget.data.images![selectedImageIndex]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
