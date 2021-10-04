import 'package:flutter/material.dart';
import 'package:seven_food_client/screens/qr_page_screen/qr_page_screen.dart';

import 'color_constants.dart';

AppBar appBar(BuildContext context, String text, Icon icon , bool withBack) {
  return AppBar(
      toolbarHeight: 90,
      backgroundColor: AppColors.kbackground,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(13.0),
          bottomRight: Radius.circular(13.0),
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
      leading: withBack?  IconButton(
        icon: icon,
        onPressed: () {
          Navigator.pop(context);
        },
      ): SizedBox());
}


FloatingActionButton floatinActionButton(context) {
  return FloatingActionButton(
    backgroundColor: AppColors.kbackground,
    child: const Icon(Icons.qr_code),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const QrPageScreen()));
    },
  );
}

 Widget networkImage  ( context,String imageNetwork ) {
    return Image.network(
      imageNetwork,
     
      fit: BoxFit.fitWidth,
      width:
          MediaQuery.of(context).size.width *
              0.320,
      height:
          MediaQuery.of(context).size.height *
              0.2,
    );
  }