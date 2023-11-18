import 'package:axolon_loading_sheet/Models/description_model.dart';
import 'package:axolon_loading_sheet/Models/list_item_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class ListController extends GetxController {
  // List of items
  final itemList = List.generate(5, (index) => 'Item $index').obs;
  final createList = List.generate(5, (index) => 'Item $index').obs;
  final descriptionlist = List.generate(5, (index) => 'Item $index').obs;

  var items = <ListItem>[].obs;
  var desitems = <DescItem>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchItems();
    fetchDesItems();// Fetch items when the controller is initialized
  }

  void fetchItems() {
    List<ListItem> dummyData = [
      ListItem(id: "15",),
      ListItem(id: "20"),
      ListItem(id: "25"),
      ListItem(id: "30"),
      ListItem(id: "35"),
    ];
    items.assignAll(dummyData);
  }
  void fetchDesItems() {
    List<DescItem> dummyData = [
      DescItem(id: "1.",qnty:"15",desc:"Remark1"),
      DescItem(id: "2.",qnty:"20",desc:"Remark2"),
      DescItem(id: "3.",qnty:"25",desc:"Remark3"),
      DescItem(id: "4.",qnty:"30",desc:"Remark4"),

    ];
    desitems.assignAll(dummyData);
  }

}