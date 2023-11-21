import 'package:axolon_loading_sheet/Controller/loading_sheet_item_list_controller.dart';
import 'package:axolon_loading_sheet/Resources/Colors.dart';
import 'package:axolon_loading_sheet/View/loading_sheet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Controller/add_item_controller.dart';
import '../Models/partname_dropdowm_models.dart';
import 'Components/filterdialog.dart';

class CreateLoadingSheetScreen extends StatelessWidget {
  CreateLoadingSheetScreen({super.key});
  final MyController listController = Get.put(MyController());
  final addItemController = Get.put(AddItemController());
  // final List<String> items = List.generate(5, (index) => 'Item ${index + 1}');
  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    String text = 'Apple, Banana, Orange';
    List<String> fruitsList = text.split('+'); // Splitting by comma and space

    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadingSheetItemListScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          ' Create Loading Sheet',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff01579b),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: AppColors.white,
              child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: IgnorePointer(
                      ignoring: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Sheet No: 2765',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primary),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 140),
                                      child: Text(
                                        "09 Nov 2023",
                                        // textAlign:
                                        // TextAlign.end,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _buildTileTextTime(
                                      text: "", title: 'StartTime'),
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: TextButton(
                                        child:  Obx(
                                              () => Text(
                                            '${controller.selectedStartTime.value.format(context)}',
                                            style: TextStyle(fontSize: 13.8,color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: (){
                                          controller.selectStartTime(context);
                                        },
                                      ),
                                    )),
                                Expanded(
                                  child: _buildTileTextTime(
                                      text: "", title: 'EndTime'),
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: TextButton(
                                        child:  Obx(
                                              () => Text(
                                            '${controller.selectedEndTime.value.format(context)}',
                                            style: TextStyle(fontSize: 13.8,color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: (){
                                          controller.selectEndTime(context);
                                        },
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                               mainAxisAlignment:
                               MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildTileText(
                                      text: "", title: 'Party Name'),
                                ),
                            //   SizedBox(width: 1,),
                               // Text("hi"),
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 70),
                                      child: DropdownButtonFormField<DropdownOption>(

                                      decoration: const InputDecoration(
                                      hintText: '',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      ),
                                      value:
                                        controller.selectedOption.value.isEmpty
                                            ? null
                                            : controller.dropdownOptions
                                                .firstWhere((option) =>
                                                    option.value ==
                                                    controller
                                                        .selectedOption.value),
                                      items: controller.dropdownOptions
                                        .map<DropdownMenuItem<DropdownOption>>(
                                          (DropdownOption option) =>
                                              DropdownMenuItem(
                                            value: option,
                                            child: Text(option.displayText),
                                          ),
                                        )
                                        .toList(),
                                      //hint: Text('Select an option'),
                                      onChanged: (DropdownOption? newValue) {
                                      controller.selectedOption.value =
                                          newValue!.value;
                                      },
                                  ),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _buildTileText(
                                      text: "Fruits", title: 'Item Category'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: _buildTileText(
                                      text: "", title: 'Document Type'),
                                ),
                                Expanded(
                                    child:
                                        Padding(
                                          padding: const EdgeInsets.only(right: 70),
                                          child: DropdownButtonFormField<DropdownOption>(
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                            BorderSide(color: Colors.transparent),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                            BorderSide(color: Colors.transparent),
                                    ),
//
                                  ),
                                  value: controller.selectedOption.value.isEmpty
                                      ? null
                                      : controller.dropdownOptions.firstWhere(
                                            (option) =>
                                                option.value ==
                                                controller.selectedOption.value),
                                  items: controller.dropdownOptions
                                      .map<DropdownMenuItem<DropdownOption>>(
                                          (DropdownOption option) =>
                                              DropdownMenuItem(
                                            value: option,
                                            child: Text(option.displayText),
                                          ),
                                      )
                                      .toList(),
                                  // hint: Text('Select an option'),
                                  onChanged: (DropdownOption? newValue) {
                                    controller.selectedOption.value =
                                          newValue!.value;
                                  },
                                ),
                                        ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _buildTileTextTime(
                                      text: "10", title: 'Total Quantity'),
                                ),
                                Expanded(
                                  child: _buildTileTextTime(
                                      text: "", title: 'DocId'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            _showDialog(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff01579b)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Color(0xff01579b),
                                    )),
                                Expanded(
                                  child: Text(
                                    "Add Items",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff01579b)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listController.createList.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.white,
                                ),
                                child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: IgnorePointer(
                                        ignoring: false,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 8, 0, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: _buildTileText(
                                                        text: "Apple",
                                                        title: 'Item'),
                                                  ),
                                                  Expanded(
                                                    child: _buildTileText(
                                                        text: "-",
                                                        title: 'Brand Origin'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: _buildTileText(
                                                        text: "Apple",
                                                        title: 'Description'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                // mainAxisAlignment:
                                                // MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: _buildTileTextTime(
                                                        text: "90",
                                                        title: 'Quantity'),
                                                  ),
                                                  Expanded(
                                                      child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 150),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 30,
                                                      color: Color(0xff01579b),
                                                    ),
                                                  )),
                                                  Expanded(
                                                    child: Container(
                                                      height: 50,
                                                      child:
                                                          SingleChildScrollView(
                                                        // scrollDirection: Axis.horizontal,
                                                        child: Obx(() => Text(
                                                              controller
                                                                  .text.value,
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                            )),
                                                      ),
                                                      // child: GetX<MyController>(
                                                      //   builder: (controller) {
                                                      //     if (controller.items.isEmpty) {
                                                      //       return CircularProgressIndicator(); // Show loader while fetching data
                                                      //     } else {
                                                      //       return ListView.builder(
                                                      //        // physics: NeverScrollableScrollPhysics(),
                                                      //         scrollDirection: Axis.horizontal,
                                                      //         itemCount: controller.items.length,
                                                      //         itemBuilder: (BuildContext context, int index) {
                                                      //           final item = controller.items[index];
                                                      //           return Card(
                                                      //             child:  Container(
                                                      //               decoration: BoxDecoration(
                                                      //                 color: Color(0xffeeeeee),
                                                      //                 borderRadius: BorderRadius.circular(8),
                                                      //               ),
                                                      //               width: 34,
                                                      //
                                                      //               child: Center(child: Text(item.id,
                                                      //                 style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                                                      //             ),
                                                      //
                                                      //             // child: Text(item.id),
                                                      //           );
                                                      //         },
                                                      //       );
                                                      //     }
                                                      //   },
                                                      // ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ))),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildTileText({required String title, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title : ",
            // textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(fontSize: 15, color: AppColors.mutedColor)),
        Expanded(
          child: Text(text,
              //textAlign: TextAlign.start,
              // maxLines: 2,
              style: TextStyle(fontSize: 15, color: AppColors.mutedColor)),
        ),
      ],
    );
  }

  Row _buildTileTextAlert({
    required String title1,
    required String title2,
    required String title3,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        Text("$title1",
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(fontSize: 15, color: Colors.black)),
        SizedBox(
          width: 90,
        ),
        Expanded(
          child: Text(title2,
              textAlign: TextAlign.start,
              // maxLines: 2,
              style: TextStyle(fontSize: 15, color: Colors.black)),
        ),
        Expanded(
          child: Text(title3,
              textAlign: TextAlign.start,
              // maxLines: 2,
              style: TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ],
    );
  }

  Row _buildTileTextTime({required String title, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title : ",
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(fontSize: 15, color: AppColors.mutedColor)),
        Expanded(
          child: Text(text,
              textAlign: TextAlign.start,

              // maxLines: 2,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Row popupTitle({
    required Function() onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
        ),
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.mutedColor,
            child: Icon(
              Icons.close,
              color: AppColors.white,
              size: 15,
            ),
          ),
        )
      ],
    );
  }

  Widget buildTextFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  ClipRRect buildExpansionTextFields(
      {required TextEditingController controller,
      required Function() onTap,
      String? hint,
      bool? isReadOnly,
      bool? isSearch,
      bool? isClosing,
      bool? disableSuffix,
      FocusNode? focus,
      bool? isDropdown,
      bool? isTime,
      Function(String)? onChanged,
      Function()? onEditingComplete}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 12, color: AppColors.black12),
        maxLines: 1,
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        readOnly: isReadOnly ?? true,
        decoration: InputDecoration(
          label: Text("Select"),
          hintText: hint ?? '',
          // enabled: false,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black12),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black12,
          )),
          // fillColor: AppColors.lightGrey.withOpacity(0.6),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child:
                InkWell(onTap: () {}, child: Icon(Icons.keyboard_arrow_down)),
          ),
          suffixIconConstraints: BoxConstraints.tightFor(
            height: 20,
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildFilterDialog(
    BuildContext context, {
    required String filterId,
    //   required List<dynamic> filterList
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            // insetPadding: EdgeInsets.symmetric(horizontal: 10),
            title: popupTitleview(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'Item $filterId'),
            content: FilterDiailog(
              filterId: filterId,
              //filterList: filterList
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog on cancel
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  Row popupTitleview({required Function() onTap, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.mutedColor,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.mutedColor,
            child: Icon(
              Icons.close,
              color: AppColors.white,
              size: 15,
            ),
          ),
        )
      ],
    );
  }

  Padding buildTextField(
      {String? label,
      String? Function(String?)? onChanged,
      final TextEditingController? controller,
      List<TextInputFormatter>? inputFormatter,
      final String? Function(String?)? validator,
      final TextInputType? keyboardType,
      final int? maxLines,
      Widget? prefix,
      final int? maxLength}) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: SizedBox(
        child: TextFormField(
          // style: ,
          inputFormatters: inputFormatter,
          keyboardType: keyboardType,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 2,
          maxLength: maxLength,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.black12), //<-- SEE HERE
            ),
            label: Text("Enter description"),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.black12), //<-- SEE HERE
            ),
          ),
          onChanged: onChanged,
          controller: controller,
          validator: validator,
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: popupTitle(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.symmetric(horizontal: 10),
              content: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextFieldLabel('Item Name'),
                      Obx(
                        () => buildExpansionTextFields(
                          controller:
                              addItemController.itemNameController.value,
                          onTap: () {
                            _buildFilterDialog(context,
                                filterId: controller.nameFilterId
                              //filterList: itemListController.categoryFilter
                            );
                          },
                          isDropdown: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextFieldLabel('Item Brand'),
                      Obx(
                        () => buildExpansionTextFields(
                          controller:
                              addItemController.itemBrandController.value,
                          onTap: () {
                            _buildFilterDialog(context,
                                filterId: controller.brandFilterId
                                //filterList: itemListController.categoryFilter
                                );
                          },
                          isDropdown: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextFieldLabel('Item Origin'),
                      Obx(
                        () => buildExpansionTextFields(
                          controller:
                              addItemController.itemOriginController.value,
                          onTap: () {
                            _buildFilterDialog(context,
                                filterId: controller.originFilterId
                                //filterList: itemListController.categoryFilter
                                );
                          },
                          isDropdown: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextFieldLabel('Item Class'),
                      Obx(
                        () => buildExpansionTextFields(
                          controller:
                              addItemController.itemClassController.value,
                          onTap: () {
                            _buildFilterDialog(context,
                                filterId: controller.classFilterId
                                //filterList: itemListController.categoryFilter
                                );
                          },
                          isDropdown: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextFieldLabel('Item Category'),
                      Obx(
                        () => buildExpansionTextFields(
                          controller:
                              addItemController.itemCategoryController.value,
                          onTap: () {
                            _buildFilterDialog(context,
                                filterId: controller.categoryFilterId
                                //filterList: itemListController.categoryFilter
                                );
                          },
                          isDropdown: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextFieldLabel('Item Description'),
                      Obx(
                        () => buildTextField(
                          controller:
                              addItemController.itemDescriptionController.value,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              //  borderRadius: BorderRadius.circular(4)
                            ),
                            child: Row(
                              children: [
                                Text("Quantity  ",
                                    style: TextStyle(fontSize: 20)),
                                Text("(90)",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff01579b),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 16,
                              width: MediaQuery.of(context).size.width / 10,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                //borderRadius: BorderRadius.circular(4)
                              ),
                              child: Icon(Icons.remove)),
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 16,
                            width: MediaQuery.of(context).size.width / 9,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              // borderRadius: BorderRadius.circular(4)
                            ),
                            child: Text("1",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                )),
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 16,
                              width: MediaQuery.of(context).size.width / 10,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                // borderRadius: BorderRadius.circular(4)
                              ),
                              child: Icon(Icons.add)),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            // height: MediaQuery.of(context).size.height / 16,
                            // width: MediaQuery.of(context).size.width/1.5,
                            decoration: BoxDecoration(
                                color: Color(0xff01579b),
                                border: Border.all(color: Color(0xff01579b)),
                                borderRadius: BorderRadius.circular(4)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xffeeeeee),
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("S.No.",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Text("Quantity",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text("Description",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Divider(
                                //  height: 100,
                                color: AppColors.black12,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width,
                                child:
                                    GetX<MyController>(builder: (controller) {
                                  return ListView.builder(
                                      // scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.desitems.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final item = controller.desitems[index];
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: _buildTileTextAlert(
                                                      title1: item.id,
                                                      title2: item.qnty,
                                                      title3: item.desc),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              //  height: 100,
                                              color: AppColors.black12,
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                            ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //   MainAxisAlignment.spaceBetween,
                                            //   children: [
                                            //     Expanded(
                                            //       child: _buildTileTextAlert(
                                            //           title1: "2.",
                                            //           title2: '20',
                                            //           title3: "Remark2"
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            // Divider(
                                            //   //  height: 100,
                                            //   color: AppColors.black12,
                                            //   thickness: 1,
                                            //   indent: 10,
                                            //   endIndent: 10,
                                            // ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //   MainAxisAlignment.spaceBetween,
                                            //   children: [
                                            //     Expanded(
                                            //       child: _buildTileTextAlert(
                                            //           title1: "3.",
                                            //           title2: '25',
                                            //           title3: "Remark3"
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            // Divider(
                                            //   //  height: 100,
                                            //   color: AppColors.black12,
                                            //   thickness: 1,
                                            //   indent: 10,
                                            //   endIndent: 10,
                                            // ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //   MainAxisAlignment.spaceBetween,
                                            //   children: [
                                            //     Expanded(
                                            //       child: _buildTileTextAlert(
                                            //           title1: "4.",
                                            //           title2: '30',
                                            //           title3: "Remark4"
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        );
                                      });
                                }),
                              ),
                            ],
                          )),

                      // Expanded(
                      //   child: Container(
                      //     height: 50,
                      //     // Wrap the ListView inside a Container with defined constraints
                      //     constraints: BoxConstraints.expand(),
                      //     child: ListView.separated(
                      //       shrinkWrap: true,
                      //       itemCount: items.length,
                      //       separatorBuilder: (BuildContext context, int index) => Divider(),
                      //       itemBuilder: (BuildContext context, int index) {
                      //         return ListTile(
                      //           title: Text(items[index]),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: 15,
                      ),

                      Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              backgroundColor: AppColors.primary,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
