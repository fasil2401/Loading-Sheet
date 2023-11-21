import 'package:axolon_loading_sheet/Resources/Colors.dart';
import 'package:axolon_loading_sheet/View/create_loading_sheet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';



import '../Controller/loading_sheet_item_list_controller.dart';

class LoadingSheetItemListScreen extends StatelessWidget {
  LoadingSheetItemListScreen({super.key});
  final MyController listController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'Loading Sheet List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff01579b),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateLoadingSheetScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 16,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text("Create New", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listController.itemList.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4,),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white,),
                        child: Theme(
                            data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent),
                            child: IgnorePointer(
                              ignoring: false,
                              child:Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16, 8, 0, 0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Sheet No: 2765',
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: AppColors
                                                  .primary),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 130),
                                            child: Text(
                                              "09 Nov 2023",
                                              // textAlign:
                                              // TextAlign.end,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: Colors.black54),
                                            ),
                                          ),
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
                                          child: _buildTileTextTime(
                                              text:
                                              "9:00 am",
                                              title: 'StartTime:'
                                          ),
                                        ),
                                        Expanded(
                                          child: _buildTileTextTime(
                                              text:
                                              "6:00 pm",
                                              title: 'EndTime:'
                                          ),
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
                                              text:
                                              "ABC Suppliers",
                                              title: 'Party Name'),
                                        ),

                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Expanded(
                                            child: _buildTileText(
                                                text:
                                                "Fruits",
                                                title: 'Item Category'),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],

                                ),
                              )


                            )),

                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(fontSize: 14, color: AppColors.mutedColor)),
        Expanded(
          child: Text(text,
              textAlign: TextAlign.start,
              // maxLines: 2,
              style: TextStyle(fontSize: 14, color: AppColors.mutedColor)),
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
            style: TextStyle(fontSize: 14, color:  AppColors.mutedColor)),
        Expanded(
          child: Text(text,
              textAlign: TextAlign.start,

              // maxLines: 2,
              style: TextStyle(fontSize: 14, color:Colors.black,
                fontWeight: FontWeight.bold
              )),
        ),
      ],
    );
  }

  Widget popShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 35,
            child: Card(),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 5,
        ),
      ),
    );
  }
}
