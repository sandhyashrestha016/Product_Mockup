import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:product_mockup/constants/ui_helper.dart';
import 'package:product_mockup/screens/product_details/components/tabbar_page.dart';

import '../../api/bloc/bloc/product_bloc.dart';
import '../../constants/color_constants.dart';
import 'components/add_to_cart_page.dart';
import 'components/image_preview_page.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? selectedColorId;
  String? selectedColorName;
  int? selectedPrice;
  int? selectedMaxOrder;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductFetchEvent());
    super.initState();
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isNotEmpty) {
      final String message = _messageController.text.trim();
      _messageController.clear();
      AndroidNotificationChannel androidNotificationChannel() =>
          const AndroidNotificationChannel(
            'product_channel',
            'product_channel',
            description: 'product_channel Notifications',
            importance: Importance.max,
          );

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      final AndroidNotificationChannel channel = androidNotificationChannel();

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.show(
        0,
        "Thank you for Contacting Us",
        "",
        platformChannelSpecifics,
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductCompletedState) {
              if (selectedColorId == null) {
                final defaultVariant = state.productData.colorVariants!.first;
                selectedColorId = defaultVariant.color!.id;
                selectedPrice = defaultVariant.price;
                selectedMaxOrder = defaultVariant.maxOrder;
                selectedColorName = defaultVariant.color!.name;
              }
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImagePreviewPage(data: state.productData),
                            Text(
                              state.productData.title.toString(),
                              style: const TextStyles().heading6SemiBold,
                            ),
                            Text(
                              "Rs. $selectedPrice",
                              style: const TextStyles().heading4Bold,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rs. ${state.productData.strikePrice.toString()}",
                                  style: const TextStyles()
                                      .baseRegular
                                      .copyWith(
                                          color: Colors.grey[400],
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                                UIHelper.horizontalSpaceSmall(),
                                Text(
                                  "${state.productData.offPercent.toString()}% off",
                                  style: const TextStyles()
                                      .baseSemiBold
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall(),
                            Text(
                              "No. of stock: $selectedMaxOrder",
                              style: const TextStyles()
                                  .baseRegular
                                  .copyWith(color: Colors.green),
                            ),
                            UIHelper.verticalSpaceMedium(),
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Color Family",
                                    style:
                                        const TextStyles().baseRegular.copyWith(
                                              color: Colors.grey.shade800,
                                            ),
                                  ),
                                  UIHelper.verticalSpaceMedium(),
                                  Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: state.productData.colorVariants!
                                        .map((variant) {
                                      final colorHex =
                                          variant.color!.colorValue![0];
                                      final colorId = variant.color!.id;
                                      final colorName = variant.color!.name;

                                      selectedColorId ??= colorId;

                                      final isSelected =
                                          colorId == selectedColorId;

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColorId = colorId;
                                            selectedPrice = variant.price;
                                            selectedMaxOrder = variant.maxOrder;
                                            selectedColorName =
                                                variant.color!.name;
                                          });
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(int.parse(
                                                    colorHex.replaceFirst(
                                                        '#', '0xff'))),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: isSelected
                                                      ? Colors.black
                                                      : Colors.transparent,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              colorName ?? '',
                                              style: const TextStyles()
                                                  .xSmallRegular,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            UIHelper.verticalSpace(20),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: TabBarPage(data: state.productData),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _showMessageDialog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Message seller',
                            style: const TextStyles()
                                .baseBold
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text('Successfully added to cart'),
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );

                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartDetailsPage(
                                    imageUrl: state.productData.images!.first,
                                    productName:
                                        state.productData.title.toString(),
                                    colorName: state.productData.colorVariants!
                                        .firstWhere((variant) =>
                                            variant.color!.name ==
                                            selectedColorName)
                                        .color!
                                        .name!,
                                    colorCode: state.productData.colorVariants!
                                        .firstWhere((variant) =>
                                            variant.color!.id ==
                                            selectedColorId)
                                        .color!
                                        .colorValue![0],
                                    price: selectedPrice!,
                                  ),
                                ),
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Add to cart',
                            style: const TextStyles()
                                .baseBold
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _showMessageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Message Seller"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: "Enter your message",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                  maxLines: 3,
                ),
                UIHelper.verticalSpaceSmall(),
                ElevatedButton(
                  onPressed: _sendMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Send Message",
                    style: const TextStyles()
                        .baseBold
                        .copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
