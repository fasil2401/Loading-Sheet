import 'package:axolon_loading_sheet/Controller/loading_sheet_item_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Resources/Colors.dart';

class FilterDiailog extends StatelessWidget {
  FilterDiailog({
    //required this.filterList,
    required this.filterId,
    super.key,
  });
  //List<dynamic> filterList;
  final controller = Get.put(MyController());

  String filterId;
  final MyController homecontroller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // itemListController.selectedValue.value = filterList;
      controller.update();
    });
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          filterId == controller.nameFilterId
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Color(0xffc5cae9)
                      // border: Border.all(color: AppColors.primary),
                      // borderRadius: BorderRadius.circular(8)
                      ),
                  child: Row(
                    children: [
                      Text("Code",
                          style: TextStyle(fontSize: 15)),
                      SizedBox(width: 80,),
                      Text("Name",
                          style: TextStyle(fontSize: 15)),
                    ],
                  )

                )
              : SizedBox(),
          // Container(
          //   alignment: Alignment.center,
          //   height: MediaQuery.of(context).size.height / 16,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //       border: Border.all(color: Colors.black54),
          //       borderRadius: BorderRadius.circular(8)),
          //   child: Text("Code           Name", style: TextStyle(fontSize: 20)),
          // ),
          SizedBox(
            height: 10,
          ),
          // filterId==controller.nameFilterId
          buildExpansionTextFields(
              controller: TextEditingController(),
              onTap: () {},
              hint: 'Search',
              isReadOnly: false,
              onChanged: (value) {
                controller.searchFilter(
                  filterId: filterId,
                  value: value,
                );
              },
              // onEditingComplete: () async {
              //   await itemListController.changeFocus(context);
              // },
              isSearch: true),

          //:SizedBox(),
          Flexible(
            child: GetBuilder<MyController>(
              builder: (controller) {
                return ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.filterList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = controller.filterList[index];
                      return InkWell(
                        onTap: () {
                         // print(controller.selectedFilter.value.name);
                          homecontroller.updateSelectedFilter(item);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    filterId == controller.nameFilterId
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Text(item.code ?? ""),
                                                    SizedBox(
                                                      width: 80,
                                                    ),
                                                    Expanded(
                                                        child: Text(item.name ??""))
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        : ListTile(
                                            leading: Text(
                                              filterId ==
                                                      controller.brandFilterId
                                                  ? item.brand ?? ''
                                                  : filterId ==
                                                          controller
                                                              .originFilterId
                                                      ? item.origin ?? ""
                                                      : filterId ==
                                                              controller
                                                                  .classFilterId
                                                          ? item.clas ?? ""
                                                          : filterId ==
                                                                  controller
                                                                      .categoryFilterId
                                                              ? item.category ?? ""
                                                              : "",
                                              style: TextStyle(fontSize: 15),
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
                                )),
                              ],
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
                        ),
                      );
                    });
              },
            ),
          )
        ],
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
}
