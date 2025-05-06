import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'receipts_widget.dart' show ReceiptsWidget;
import 'package:flutter/material.dart';

class ReceiptsModel extends FlutterFlowModel<ReceiptsWidget> {
  ///  Local state fields for this page.

  List<ReceiptItemDataTypeStruct> filteredItems = [];
  void addToFilteredItems(ReceiptItemDataTypeStruct item) =>
      filteredItems.add(item);
  void removeFromFilteredItems(ReceiptItemDataTypeStruct item) =>
      filteredItems.remove(item);
  void removeAtIndexFromFilteredItems(int index) =>
      filteredItems.removeAt(index);
  void insertAtIndexInFilteredItems(
          int index, ReceiptItemDataTypeStruct item) =>
      filteredItems.insert(index, item);
  void updateFilteredItemsAtIndex(
          int index, Function(ReceiptItemDataTypeStruct) updateFn) =>
      filteredItems[index] = updateFn(filteredItems[index]);

  double? glutenFreeTotalAmount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
