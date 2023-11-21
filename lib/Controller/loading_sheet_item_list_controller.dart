import 'package:axolon_loading_sheet/Models/description_model.dart';
import 'package:axolon_loading_sheet/Models/list_item_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/category_models.dart';
import '../Models/partname_dropdowm_models.dart';



class MyController extends GetxController {
  // List of items
  final itemList = List.generate(5, (index) => 'Item $index').obs;
  final createList = List.generate(5, (index) => 'Item $index').obs;
  var selectedValue = ''.obs;
  var filterSearchList = [].obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }


  Rx<TimeOfDay> selectedStartTime = TimeOfDay.now().obs;

  Future<void> selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime.value,
    );
    if (picked != null && picked != selectedStartTime.value) {
      selectedStartTime.value = picked;
    }
  }


  Rx<TimeOfDay> selectedEndTime = TimeOfDay.now().obs;

  Future<void> selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime.value,
    );
    if (picked != null && picked != selectedEndTime.value) {
      selectedEndTime.value = picked;
    }
  }



  var itemNameController = TextEditingController().obs;
  var itemClassController = TextEditingController().obs;
  var itemDescriptionController = TextEditingController().obs;
  var itemCategoryController = TextEditingController().obs;
  var itemBrandController = TextEditingController().obs;
  var itemOriginController = TextEditingController().obs;



  searchFilter({required String filterId, required String value}) {
    if (filterId == categoryFilterId) {
      filterSearchList.value = categoryFilter
          .where((element) =>
      (element.code
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase())) ||
          (element.name.toLowerCase().contains(value.toLowerCase())))
          .toList();
      update();
    } else if (filterId == originFilterId) {
      filterSearchList.value = originFilter
          .where((element) =>
      (element.code
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase())) ||
          (element.name.toLowerCase().contains(value.toLowerCase())))
          .toList();
      update();
    } else if (filterId == brandFilterId) {
      filterSearchList.value = brandFilter
          .where((element) =>
      (element.code
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase())) ||
          (element.name.toLowerCase().contains(value.toLowerCase())))
          .toList();
      update();
    }  else if (filterId == classFilterId) {
      filterSearchList.value = classFilter
          .where((element) =>
      (element.code
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase())) ||
          (element.name.toLowerCase().contains(value.toLowerCase())))
          .toList();
      update();
    }
  }

 // var filterSearchList = [].obs;

  String categoryFilterId = 'Category';
  String originFilterId = 'Origin';
  String brandFilterId = 'Brand';
  String nameFilterId = 'Name';
  String classFilterId = 'Class';
  String descriptionFilterId = 'description';

  var categoryFilter = [].obs;
  var originFilter = [].obs;
  var brandFilter = [].obs;
  var nameFilter = [].obs;
  var classFilter = [].obs;
  var descriptionFilter = [].obs;




  var items = <ListItem>[].obs;
  var desitems = <DescItem>[].obs;
  var selectedOption = ''.obs;

  var text = '15+ 20+ 30+ 35+ 40+ 15+ 20+ 30+ 35+ 15+ 20+ 30+ 35+'.obs;



  List<DropdownOption> dropdownOptions = [
    DropdownOption('option1', 'Option 1'),
    DropdownOption('option2', 'Option 2'),
    DropdownOption('option3', 'Option 3'),
  ];



  @override
  void onInit() {
    super.onInit();
    fetchItems();
    fetchDesItems();

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