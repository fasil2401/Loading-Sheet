import 'package:axolon_loading_sheet/Controller/loading_sheet_item_list_controller.dart';
import 'package:axolon_loading_sheet/Resources/Colors.dart';
import 'package:axolon_loading_sheet/View/loading_sheet_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../Controller/add_item_controller.dart';
import '../Models/partname_dropdowm_models.dart';
import 'Components/filterdialog.dart';
import 'Components/party_name_row.dart';
import 'Components/popup_shimmer.dart';
import 'Components/quantity_adding_sheet.dart';
import 'package:get/get.dart';

class CreateLoadingSheetScreen extends StatelessWidget {
  CreateLoadingSheetScreen({super.key});

  //final MyController listController = Get.put(MyController());
  //final addItemController = Get.put(AddItemController());
  final MyController controller = Get.put(MyController());
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController textControllerdtype = TextEditingController();
  final List<String> partyname = ['Party1', 'Party2', 'Party3', 'Party4'];
  final List<String> documentype = ['Dtype1', 'Dtype2', 'Dtype3', 'Dtype4'];
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _discountAmountController = TextEditingController();

  FocusNode _discountAmountFocusNode = FocusNode();
  FocusNode _discountPercentageFocusNode = FocusNode();
  FocusNode _remarksFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controller.clearInputValue();
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
                        padding: const EdgeInsets.fromLTRB(9, 8, 6, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Sheet No: 2765',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Expanded(
                                    child: Column(
                                      children: [
                                        GetX<MyController>(
                                          builder: (controller) => _buildExpansionTextFields(
                                              controller: TextEditingController(
                                                text: '${controller.selectedDate.value.toLocal()}'.split(' ')[0],
                                              ),
                                              onTap: () async {
                                                controller.selectDate(context);
                                              }),
                                        ),
                                      ],
                                    )

                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(

                                    child:Column(
                                      children: [
                                        GetX<MyController>(
                                          builder: (controller) => _buildExpansionTextFields(
                                              controller: TextEditingController(
                                                text:  "StartTime:${controller.selectedStartTime.value.format(context)}  ",
                                              ),
                                              onTap: () async {
                                                controller.selectStartTime(context);
                                              }),
                                        ),
                                      ],
                                    )
                                  // _buildExpansionTextFields(
                                  //     controller: TextEditingController(
                                  //       text:
                                  //           "StartTime:${controller.selectedStartTime.value.format(context)}",
                                  //     ),
                                  //     onTap: () async {
                                  //       controller.selectStartTime(context);
                                  //     }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(

                                    child:Column(
                                      children: [
                                        GetX<MyController>(
                                          builder: (controller) => _buildExpansionTextFields(
                                              controller: TextEditingController(
                                                text:  "EndTime:${controller.selectedEndTime.value.format(context)}",
                                              ),
                                              onTap: () async {
                                                controller.selectEndTime(context);
                                              }),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            GetX<MyController>(
                              builder: (controller) => _buildExpansionTextFieldspname(
                                controller: TextEditingController(
                                  text:  "Party Name : ${controller.selectedValue.value}",
                                ),
                                onTap: () async {
                                  await selectDocumentType(
                                      context: context,
                                      pname: true,
                                      dtype: false);
                                },
                              ),
                            ),

                            // Obx(
                            //   () => ParrtyNameRow(
                            //       pname: true,
                            //       dtype: false,
                            //       onTap: () async {
                            //         await selectDocumentType(
                            //             context: context,
                            //             pname: true,
                            //             dtype: false);
                            //       },
                            //       controller: TextEditingController(
                            //         text: controller.selectedValue.value,
                            //         // ?"Select"
                            //         //  :controller.selectedValue.value
                            //       ),
                            //       isLoading:
                            //           controller.isCustomerLoading.value),
                            // ),
                            SizedBox(
                              height: 5,
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                            GetX<MyController>(
                              builder: (controller) => _buildExpansionTextFieldspname(
                                controller: TextEditingController(
                                  text:  "Document Type : ${ controller.selectedValuedtype.value}",
                                ),
                                onTap: () async {
                                  await selectDocumentType(
                                      context: context,
                                      pname: false,
                                      dtype: true);
                                },
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: _buildTileText(
                                        text: "Fruits", title: 'Item Category'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              backgroundColor: Colors.white,
                                              isScrollControlled: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.vertical(
                                                  top: Radius.circular(30),
                                                ),
                                              ),
                                              context: context,
                                              builder: (context) => QuantitySheet(
                                                  onTapPercent: () {},
                                                  onTapAmount: () {},
                                                  onChangePercent: (value) {},
                                                  onChangeAmount: (value) {},
                                                  quantityController:
                                                  _quantityController));
                                        },
                                        child: Row(
                                          children: [
                                            Text("Total Quantity:  ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors.mutedColor)),
                                            Expanded(
                                                child: TextField(
                                                  controller: _textEditingController,
                                                  keyboardType: TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                  decoration:
                                                  new InputDecoration.collapsed(
                                                      hintText: ''),
                                                  // decoration: InputDecoration(
                                                  //   enabledBorder: OutlineInputBorder(
                                                  //     borderSide:
                                                  //     BorderSide(color: Colors.black12),
                                                  //   ),
                                                  // ),
                                                )),
                                            // GetX<MyController>(
                                            //   builder: (controller) => Text(
                                            //     '${controller.inputValue.value}',
                                            //     style: TextStyle(fontSize: 18),
                                            //   ),
                                            // ),
                                          ],
                                        )),
                                  ),
                                  Expanded(
                                    child: _buildTileTextTime(
                                        text: "", title: 'DocId'),
                                  ),
                                ],
                              ),
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
                            width: MediaQuery.of(context).size.width / 2.7,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff01579b)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _showDialog(context);
                                    },
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
                      child: GetBuilder<MyController>(builder: (controller) {
                        return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.createList.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                          itemBuilder: (context, index) {
                            CreateListModel item = controller.createList[index];
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
                                                        text:
                                                        item.itemCode ?? '',
                                                        title: 'Item'),
                                                  ),
                                                  SizedBox(width: 25,),
                                                  Expanded(
                                                    child: _buildTileText(
                                                        text:
                                                        "- ${item.origin ?? ''}",
                                                        title: 'Brand Origin'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: _buildTileText(
                                                        text:
                                                        item.description ??
                                                            '',
                                                        title: 'Description'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  // mainAxisAlignment:
                                                  // MainAxisAlignment.spaceBetween,
                                                  // crossAxisAlignment:
                                                  //    CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: _buildTileText(
                                                          text: item.qtyList!
                                                              .fold(
                                                              0.0,
                                                                  (previousValue,
                                                                  element) =>
                                                              previousValue +
                                                                  element)
                                                              .toString(),
                                                          title: 'Quantity'),
                                                    ),

                                                    // Expanded(
                                                    //     child:
                                                    //   Text(
                                                    //       item.qtyList!.fold(0.0, (previousValue, element)
                                                    //       => previousValue + element).toString(),
                                                    //      // '${controller.inputValue.value}',
                                                    //       style: TextStyle(fontSize: 17),
                                                    //     ),
                                                    //
                                                    // ),
                                                    //  SizedBox(width: 5,),
                                                    Expanded(
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(right: 60),
                                                          child: InkWell(
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                    backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                    isScrollControlled:
                                                                    true,
                                                                    shape:
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .vertical(
                                                                        top: Radius
                                                                            .circular(
                                                                            30),
                                                                      ),
                                                                    ),
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (context) =>
                                                                        SingleChildScrollView(
                                                                          padding:
                                                                          EdgeInsets.only(
                                                                            bottom:
                                                                            MediaQuery.of(context).viewInsets.bottom,
                                                                          ),
                                                                          child: QuantitySheet(
                                                                              onTapPercent: () {
                                                                                controller.addQuantity(index: index, qty: _quantityController.text.isEmpty ? 0.0 : double.parse(_quantityController.text));
                                                                              },
                                                                              onTapAmount: () {},
                                                                              onChangePercent: (value) {},
                                                                              onChangeAmount: (value) {},
                                                                              quantityController: _quantityController),
                                                                        ));
                                                              },
                                                              child: Container(
                                                                height: 30,
                                                                child: CircleAvatar(
                                                                    backgroundColor:
                                                                    Color(
                                                                        0xff01579b),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                              )),
                                                        )),
                                                    Expanded(
                                                      child: SingleChildScrollView(
                                                        // scrollDirection: Axis.horizontal,
                                                          child: Text(
                                                            item.qtyList!.join('+'),
                                                            // '${controller.result.value}',
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                            softWrap: true,
                                                            overflow:
                                                            TextOverflow.clip,
                                                          )),
                                                    ),
                                                    //  SizedBox(height: 30,)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))),
                              ),
                            );
                          },
                        );
                      }),
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
            style: TextStyle(fontSize: 16, color: AppColors.mutedColor)),
        Expanded(
          child: Text(text,
              //textAlign: TextAlign.start,
              // maxLines: 2,
              style: TextStyle(fontSize: 16, color: AppColors.mutedColor)),
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

  Row popupTitle({required Function() onTap, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 120),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
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

  Widget buildTextFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: AppColors.mutedColor,
          fontSize: 15,
        ),
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
        style: TextStyle(
            fontSize: 12,
            color:
            isClosing != null ? AppColors.primary : AppColors.mutedColor),
        maxLines: 1,
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        readOnly: isReadOnly ?? true,
        autofocus: false,
        decoration: InputDecoration(
          isCollapsed: true,
          isDense: true,
          filled: true,
          hintText: hint ?? '',
          // enabled: false,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)),
          fillColor: AppColors.lightGrey.withOpacity(0.6),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: disableSuffix != null
                ? Container()
                : Icon(
              isTime != null
                  ? Icons.schedule
                  : isDropdown != null
                  ? Icons.keyboard_arrow_down
                  : isClosing != null
                  ? Icons.cancel_rounded
                  : isSearch != null
                  ? Icons.search
                  : Icons.calendar_month_outlined,
              color: isClosing != null
                  ? AppColors.primary
                  : AppColors.mutedColor,
              size: 20,
            ),
          ),
          suffixIconConstraints: BoxConstraints.tightFor(height: 20, width: 30),
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
          return SingleChildScrollView(
            child: Column(
              children: [
                AlertDialog(
                  insetPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
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
                      title: '$filterId'),
                  content: FilterDiailog(
                    filterId: filterId,
                    //filterList: filterList
                  ),
                  // actions: [
                  //   TextButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pop(); // Close the dialog on cancel
                  //     },
                  //     child: Text('Cancel'),
                  //   ),
                  // ],
                ),
              ],
            ),
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
            label: Text(""),
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
            text: '',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.white,
          //Color(0xffffffff),
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
                  buildTextFieldLabel('Brand'),
                  Obx(
                        () => buildExpansionTextFields(
                      controller: controller.itemBrandController.value,
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
                  buildTextFieldLabel('Origin'),
                  Obx(
                        () => buildExpansionTextFields(
                      controller: controller.itemOriginController.value,
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
                  buildTextFieldLabel('Class'),
                  Obx(
                        () => buildExpansionTextFields(
                      controller: controller.itemClassController.value,
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
                  buildTextFieldLabel('Category'),
                  Obx(
                        () => buildExpansionTextFields(
                      controller: controller.itemCategoryController.value,
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
                  buildTextFieldLabel('Name'),
                  Obx(
                        () => buildExpansionTextFields(
                      controller: controller.itemNameController.value,
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
                  buildTextFieldLabel('Description'),
                  Obx(
                        () => buildTextField(
                      controller:
                      controller.itemDescriptionController.value,
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
                            GetX<MyController>(
                              init: MyController(),
                              builder: (controller) {
                                return Text(
                                  '(${controller.counter.value})',
                                  style: TextStyle(fontSize: 25),
                                );
                              },
                            ),
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
                          child: InkWell(
                              onTap: () {
                                Get.find<MyController>().decrement();
                              },
                              child: Icon(Icons.remove))),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 9,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          // borderRadius: BorderRadius.circular(4)
                        ),
                        child: GetX<MyController>(
                          builder: (controller) {
                            _textEditingController.text =
                                controller.counter.value.toString();
                            return TextField(
                              controller: _textEditingController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black12),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 16,
                          width: MediaQuery.of(context).size.width / 10,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            // borderRadius: BorderRadius.circular(4)
                          ),
                          child: InkWell(
                              onTap: () {
                                Get.find<MyController>().increment();
                              },
                              child: Icon(Icons.add))),
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

  selectDocumentType({
    required BuildContext context,
    var customerList,
    required bool pname,
    required bool dtype,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          title: popupTitle(
              onTap: () {
                Navigator.pop(context);
              },
              text: dtype == true ? 'Document Type' : "Party Name"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildExpansionTextFields(
                  controller: TextEditingController(),
                  onTap: () {},
                  hint: 'Search',
                  isReadOnly: false,
                  onChanged: (value) {
                    // controller.searchFilter(
                    //   filterId: filterId,
                    //   value: value,
                    // );
                  },
                  // onEditingComplete: () async {
                  //   await itemListController.changeFocus(context);
                  // },
                  isSearch: true),
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: dtype == true
                  // controller.isLoading.value
                  //     ? SalesShimmer.locationPopShimmer()
                      ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: documentype.length,
                    itemBuilder: (context, index) {
                      var customer = partyname[index];
                      return InkWell(
                          onTap: () {
                            controller.updateSelectedValuedtype(
                                documentype[index]);
                            textController.text = documentype[index];
                            final data = controller.items[index].id;
                            // this.controller.itemList.val = customer;
                            // Navigator.pop(context);
                            Navigator.pop(context);
                            // controller.customerFilterList.value = this.customerList;
                            //   return this.customer.value;
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: AutoSizeText(
                                  documentype[index],
                                  // "${customer.code} - ${customer.name}",
                                  minFontSize: 12,
                                  maxFontSize: 16,
                                  style: TextStyle(
                                    color: AppColors.mutedColor,
                                  ),
                                ),
                              ),
                              Divider(
                                //  height: 100,
                                color: AppColors.black12,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ],
                          ));
                    },
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    itemCount: partyname.length,
                    itemBuilder: (context, index) {
                      var customer = partyname[index];
                      return InkWell(
                          onTap: () {
                            controller
                                .updateSelectedValue(partyname[index]);
                            textController.text = partyname[index];
                            final data = controller.items[index].id;
                            // this.controller.itemList.val = customer;
                            // Navigator.pop(context);
                            Navigator.pop(context);
                            // controller.customerFilterList.value = this.customerList;
                            //   return this.customer.value;
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: AutoSizeText(
                                  partyname[index],
                                  // "${customer.code} - ${customer.name}",
                                  minFontSize: 12,
                                  maxFontSize: 16,
                                  style: TextStyle(
                                    color: AppColors.mutedColor,
                                  ),
                                ),
                              ),
                              Divider(
                                //  height: 100,
                                color: AppColors.black12,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ],
                          )
                        // Card(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: AutoSizeText(
                        //       partyname[index],
                        //       // "${customer.code} - ${customer.name}",
                        //       minFontSize: 12,
                        //       maxFontSize: 16,
                        //       style: TextStyle(
                        //         color: AppColors.mutedColor,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    //  return customer.value;
  }

  ClipRRect _buildExpansionTextFields(
      {required TextEditingController controller, required Function() onTap}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 15, color: AppColors.mutedColor),
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
            suffix: Icon(
              Icons.edit,
              color: AppColors.mutedColor,
              size: 17,
            )),
      ),
    );
  }

  ClipRRect _buildExpansionTextFieldspname(
      {required TextEditingController controller, required Function() onTap}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 15, color: AppColors.mutedColor),
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
            suffix:Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.grey,
              size: 23,)),
      ),
    );
  }
}
