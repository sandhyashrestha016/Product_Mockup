import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:product_mockup/api/model/product_model.dart';
import 'package:product_mockup/constants/ui_helper.dart';

import '../../../constants/color_constants.dart';

class ProductDescriptionPage extends StatefulWidget {
  const ProductDescriptionPage({super.key, required this.data});

  final ProductData data;

  @override
  State<ProductDescriptionPage> createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    print(widget.data.description);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpaceMedium(),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Scaffold(
                      backgroundColor: Colors.white,
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              UIHelper.verticalSpaceSmall(),
                              HtmlWidget(
                                widget.data.description.toString(),
                              ),
                              UIHelper.verticalSpaceSmall(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Specifications",
                            style: const TextStyles().heading6SemiBold),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(35),
              Text("Product Description",
                  style: const TextStyles().heading6SemiBold),
              UIHelper.verticalSpaceSmall(),
              HtmlWidget(
                _isExpanded
                    ? widget.data.description.toString()
                    : _truncateHtmlContent(widget.data.description.toString()),
              ),
              if (widget.data.description!.length > 300)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(
                    _isExpanded ? 'Read Less' : 'Read More',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              UIHelper.verticalSpaceSmall(),
            ],
          ),
        ),
      ),
    );
  }

  String _truncateHtmlContent(String content) {
    int end = 300;
    if (content.length > end) {
      return '${content.substring(0, end)}...';
    } else {
      return content;
    }
  }
}
