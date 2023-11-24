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
              controller: controller,
              style: const TextStyle(fontSize: 14, color: AppColors.mutedColor),
              maxLines: 1,
              onTap: onTap,
              readOnly: true,
              decoration: InputDecoration(
                  isCollapsed: true,
                  isDense: true,
                  filled: true,
                  // enabled: false,
                  fillColor: AppColors.lightGrey.withOpacity(0.6),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  suffix: Icon(Icons.arrow_drop_down_circle_outlined,color: Color(0xff01579b),
                    size: 20,)
              ),
            ),
          ),
        ),
        // Expanded(
        //   child: InkWell(child: Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.blue,size: 18,),
        //       onTap: onTap),
        // )
      ],
    );
  }
}
