import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddItemController extends GetxController {
  var itemNameController = TextEditingController().obs;
  var itemClassController = TextEditingController().obs;
  var itemDescriptionController = TextEditingController().obs;
  var itemCategoryController = TextEditingController().obs;
  var itemBrandController = TextEditingController().obs;
  var itemOriginController = TextEditingController().obs;

}
