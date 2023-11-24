
import 'package:flutter/material.dart';

import '../../Controller/loading_sheet_item_list_controller.dart';
import '../../Resources/Colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class QuantitySheet extends StatelessWidget {

  QuantitySheet({
    required this.onTapPercent,
    required this.onTapAmount,
    required this.onChangePercent,
    required this.onChangeAmount,
    // required this.amountFocus,
    // required this.percentFocus,
    // required this.amountController,
    required this.quantityController,
    Key? key,
  }) : super(key: key);
  final MyController controller = Get.put(MyController());

  Function() onTapPercent;
  Function() onTapAmount;
  Function(String value) onChangePercent;
  Function(String value) onChangeAmount;
  TextEditingController quantityController;
  //TextEditingController amountController;
  // FocusNode percentFocus;
  // FocusNode amountFocus;

  final _formKey = new GlobalKey<FormState>();
  final fieldText = TextEditingController();
  void clearText() {
    quantityController.clear();

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: Text(
                  'Quantity',
                  style: TextStyle(
                    color: AppColors.mutedColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  clearText();
                },
                icon: Center(
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: AppColors.mutedColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: _buildDiscountFields(
                    context: context,
                    label: 'Total Quantity',
                    controller: quantityController,
                 //   focusNode: percentFocus,
                    onChanged: (value) {
                      controller.updateInputValue(value);
                    //  Navigator.pop(context);// Update the controller value
                    },
                    onTap: (){},
                  ),
                ),
                // IconButton(
                //     onPressed: (){
                //       onTapPercent;
                //       Navigator.pop(context);
                //
                //     },
                //
                //     icon: Icon(Icons.add)),
                const SizedBox(
                  width: 5,
                ),


              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 280,bottom: 20),
            child: Container(
              height: MediaQuery.of(context).size.height / 25,
              width: MediaQuery.of(context).size.width/5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed:(){

                    onTapPercent();
                    clearText();
                    Navigator.pop(context);


                  },
                  //onTapPercent,

                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )),
            ),

          )
        ],
      ),
    );
  }

  TextField _buildDiscountFields({
    required BuildContext context,
    required String label,
    required TextEditingController controller,
    required Function(String) onChanged,
    required Function() onTap,

  //  required FocusNode focusNode,
  }) {
    // _discountAmountController.text =
    //     salesController.discount.value.toStringAsFixed(2);
    // _discountPercentageController.text =
    //     salesController.discountPercentage.value.toStringAsFixed(2);

    return TextField(

      maxLines: 1,
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        Navigator.pop(context);
      },
      controller: controller,



      // textInputAction: TextInputAction.continueAction,
     // focusNode: focusNode,
      autofocus: true,
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 12, color: AppColors.primary),
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.mutedColor, width: 0.1),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
      ),
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
