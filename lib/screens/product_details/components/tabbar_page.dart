import 'package:flutter/material.dart';
import 'package:product_mockup/constants/color_constants.dart';
import 'package:product_mockup/screens/product_details/components/product_description_page.dart';
import 'package:product_mockup/screens/product_details/components/review_page.dart';

import '../../../api/model/product_model.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key, required this.data});
  final ProductData data;

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelColor: Colors.blue,
              labelStyle: const TextStyles().heading6Bold,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: 'Product Details'),
                Tab(text: 'Reviews'),
              ],
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  ProductDescriptionPage(
                    data: widget.data,
                  ),
                  ReviewPage(data: widget.data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
