import 'package:axolon_loading_sheet/Models/description_model.dart';
import 'package:axolon_loading_sheet/Models/list_item_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/category_models.dart';
import '../Models/item_model.dart';
import '../Models/partname_dropdowm_models.dart';



class MyController extends GetxController {


  var customerFilterList = [].obs;
 // var customer = ListItem(id: '').obs;
  var isLoading = false.obs;

  // List of items
  final itemList1 = List.generate(5, (index) => 'Item $index').obs;///Loading sheet screen list display


   var itemList=[CreateListModelLoading(category: 'Fruits',partyname: 'ABC Suppliers',sheetno: '4567',date: '09 Nov 2023',endtime: '6.00:pm',starttime: '9.00:am'),
     CreateListModelLoading(category: 'Fruits',partyname: 'EFG Suppliers',sheetno: '9867',date: '10 Nov 2023',endtime: '6.00:pm',starttime: '9.00:am'),
     CreateListModelLoading(category: 'Fruits',partyname: 'HIJ Suppliers',sheetno: '5667',date: '11 Nov 2023',endtime: '6.00:pm',starttime: '9.00:am'),
     CreateListModelLoading(category: 'Fruits',partyname: 'KLM Suppliers',sheetno: '3567',date: '12 Nov 2023',endtime: '6.00:pm',starttime: '9.00:am'),
     CreateListModelLoading(category: 'Fruits',partyname: 'NOP Suppliers',sheetno: '2367',date: '13 Nov 2023',endtime: '6.00:pm',starttime: '9.00:am')
   ];
  var createList = [CreateListModel(description: 'Aplle Gala',itemCode: 'AP00023',origin: 'India',),
    CreateListModel(description: 'Orang Gala',itemCode: 'AP00023',origin: 'India',),
    CreateListModel(description: 'Grape Gala',itemCode: 'AP00023',origin: 'India',),
    CreateListModel(description: 'Cabage Gala',itemCode: 'AP00023',origin: 'India',),
    CreateListModel(description: 'PineApple Gala',itemCode: 'AP00023',origin: 'India',),];///create   loading sheet listcreateion

   var filterList=
   [FilterListItem(brand: "Rivers",origin: "India",clas: "Air Shipment",category: "Fruits",name: "Apple",code: "GH005"),
    FilterListItem(brand: "AAJ",origin: "Brazil",clas: "Dry Food",category: "Vegetables",name: "Coffee",code: "HF347"),
    FilterListItem(brand: "Actel",origin: "America",clas: "Fresh Meat",category: "Coffee",name: "Orange",code: "ER80"),
    FilterListItem(brand: "Bono",origin: "Canada",clas: "Fresh Eggs",category: "Chips",name: "Nuts",code: "YG456"),
    FilterListItem(brand: "Brixi",origin: "Egypt",clas: "Dry Fruits",category: "Flour",name: "Rice Flour",code: "YD456"),];

  Rx<FilterListItem> selectedFilter = Rx<FilterListItem>(FilterListItem());

  // selectFilterValue({required String filterId, required String value}) {
  //   if (filterId == categoryFilterId) {
  //     itemCategoryController.value.text = value;
  //     update();
  //   } else if (filterId == originFilterId) {
  //     itemOriginController.value.text = value;
  //     update();
  //   }
  //
  // }

  void updateSelectedFilter(FilterListItem newValue) {
    selectedFilter.value = newValue;
    update(); // To update the UI after changing the value
  }


  RxList<Data> dataList = <Data>[].obs;
  void addData(
      String title,
      String description,
      String cls,
      String category,
      String name,
      String itemCode,
      String brand,
     // double? quantity,
     int intValue,
      String origin)
  {
  List<double> doubleList = [counter.toDouble()];
    dataList.add(Data(
      title: title,
      description: description,
      cls: cls,
      category: category,
      name: name,
      itemCode: itemCode,
      brand: brand,
      qtyList: doubleList,
      //quantity:quantity,
      origin: origin,






     ));
  }


  var filterSearchList = [].obs;

  addQuantity({required int index, required double qty}){
    dataList[index].qtyList!.add(qty);
    update();
  }

  var counter = 1.obs; /// increment decrement variable
  void increment() {
    counter++;
  }                                /// increment decrement function
  void decrement() {
    if (counter.value > 1) {
      counter--;
    }
  }




/// start time and end time selection--------------------///

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
///------------------------------------------------------////



  Rx<DateTime> selectedDate = DateTime.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }


  RxString selectedValue = ''.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }
  RxString selectedValuedtype = ''.obs;

  void updateSelectedValuedtype(String value) {
    selectedValuedtype.value = value;
  }

  RxString selectedbrand = ''.obs;

  void updateSelectedBrand(String value) {
    selectedbrand.value = value;
  }

  RxString inputValue = ''.obs;

  void updateInputValue(String value) {
    inputValue.value = value;
  }



  RxInt result = 0.obs;

  void calculateSum(int num1, int num2) {

    result.value = num1 + num2;
  }
  @override
  void onClose() {
    itemOriginController.value.dispose();
    itemBrandController.value.dispose();
    itemClassController.value.dispose();
    itemCategoryController.value.dispose();
    itemNameController.value.dispose();
    itemDescriptionController.value.dispose();

    // Dispose of the controller when the page is removed
    super.onClose();
  }

  void clearInputValue() {
    inputValue.value = '';
    selectedValuedtype = ''.obs;
    selectedValue = ''.obs;
    result = 0.obs;
    counter=1.obs;// Reset the input value to an empty string
  }

  ///add item popup page textformfeild controllers-----///


  var itemNameController = TextEditingController().obs;
  var itemClassController = TextEditingController().obs;
  var itemDescriptionController = TextEditingController().obs;
  var itemCategoryController = TextEditingController().obs;
  var itemBrandController = TextEditingController().obs;
  var itemOriginController = TextEditingController().obs;
  var quantityController = TextEditingController(text: "1").obs;



  ///---------------------------------------------///
quantityChange(){
  counter.value =int.parse(quantityController.value.text);
  update();
}


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
  var customerId = ''.obs;
  var isCustomerLoading = false.obs;
  var customer = PartyName(type: "type1").obs;



  var items = <ListItem>[].obs; ///listing numbers 15,20,25...
  var desitems = <DescItem>[].obs; /// display the table in additem pop up page
  var selectedOption = ''.obs; /// dropdown value selection variable

  var text = '15 + 20 + 30 + 35 + 40 + 15 + 20 + 30 + 35 + 15+ 20+ 30+ 35+'.obs;
  var qtyList = [10.5,20,34.8,46,23,1,6,87].obs;





/// dropdown values
  List<DropdownOption> dropdownOptions = [
    DropdownOption('option1', 'Option 1'),
    DropdownOption('option2', 'Option 2'),
    DropdownOption('option3', 'Option 3'),
  ];


/// fetching the function on here
  @override
  void onInit() {
    super.onInit();
    fetchItems();
    fetchDesItems();

  }





  ///listing numbers 15,20,25... store here
  void fetchItems() {
    List<ListItem> dummyData = [
      ListItem(id: "Party1",),
      ListItem(id: "Party2"),
      ListItem(id: "Party3"),
      ListItem(id: "Party4"),
      ListItem(id: "Party5"),
    ];
    items.assignAll(dummyData);
  }


/// setvalues here for table
  void fetchDesItems() {
    List<DescItem> dummyData = [
      DescItem(id: "1.",qnty:"15",desc:"Remark1", brand: 'brand1',
        category: 'category1', cls: 'class1', name: 'name1', origin: 'origin1',code: "ABCD"),
      DescItem(id: "2.",qnty:"20",desc:"Remark2",brand: 'brand2',
        category: 'category2', cls: 'class2', name: 'name2', origin: 'origin2',code: "KGGK"),
      DescItem(id: "3.",qnty:"25",desc:"Remark3",brand: 'brand3',code: "KRES",
        category: 'category3', cls: 'class3', name: 'name3', origin: 'origin3',),
      DescItem(id: "4.",qnty:"30",desc:"Remark4",brand: 'brand4',code: "EDGG",
        category: 'category4', cls: 'class4', name: 'name4', origin: 'origin4',),

    ];
    desitems.assignAll(dummyData);
  }
  var isEditingQuantity=false.obs;
  var quantity=1.obs;
  editQuantity() {
    isEditingQuantity.value = !isEditingQuantity.value;
  }

  incrementQuantity() {
    isEditingQuantity.value = false;
    quantity.value++;
    update();
  }

  decrementQuantity() {
    isEditingQuantity.value = false;
    if (quantity > 1) {
      quantity.value--;
      update();
    }
  }

  setQuantity(String value) {
    quantity.value = int.parse(value);
  }

  resetQuantity() {
    quantity.value = 1;
    isEditingQuantity.value = false;
    update();
  }



}

class CreateListModel{
String? itemCode;
String? description;
String? origin;
//List<double>? qtyList = [];

CreateListModel({this.itemCode,this.description,this.origin,
  //this.qtyList
});
}

class CreateListModelLoading{

  String? sheetno;
  String? starttime;
  String? date;
  String? endtime;
  String? partyname;
  String? category;


  CreateListModelLoading({this.category,this.partyname,this.date,this.endtime,this.sheetno,this.starttime});
}

class FilterListItem{

  String? brand;
  String? origin;
  String? clas;
  String? category;
  String? name;
  String? code;


  FilterListItem({this.category,this.origin,this.name,this.code,this.brand,this.clas});
}