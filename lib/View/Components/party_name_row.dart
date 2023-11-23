import 'package:flutter/material.dart';

import '../../Resources/Colors.dart';

class ParrtyNameRow extends StatelessWidget {
  ParrtyNameRow(
      {Key? key,
      required this.onTap,
      required this.controller,
      required this.isLoading,
      required this.dtype,
      required this.pname})
      : super(key: key);

  Function() onTap;
  TextEditingController controller;
  bool isLoading;
  bool pname;
  bool dtype;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 10,
          ),
          child: Text(pname == true ? 'PartyName :' : 'DocumentType :',
              style: TextStyle(fontSize: 15, color: AppColors.mutedColor)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.mutedColor,
                ),
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(
                  isCollapsed: true,
                  isDense: true,
                  border: InputBorder.none,
                  // suffix: Transform.translate(
                  //   offset: Offset(0, 8),
                  //   child: SizedBox(
                  //     width: 20,
                  //     height: 20,
                  //     child:
                  //     // isLoading
                  //     //     ? CircularProgressIndicator(
                  //     //   strokeWidth: 2,
                  //     //   color: AppColors.mutedColor,
                  //     // )
                  //     //     :
                  //         Icon(Icons.arrow_drop_down),
                  //   ),
                  // ),
                ),
                onTap: onTap),
          ),
        ),
        Expanded(
          child: InkWell(child: Icon(Icons.arrow_drop_down), onTap: onTap),
        )
      ],
    );
  }
}
