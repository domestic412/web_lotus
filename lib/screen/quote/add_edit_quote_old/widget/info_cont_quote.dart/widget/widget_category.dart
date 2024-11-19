import 'package:flutter/material.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';

class WidgetCategory extends StatefulWidget {
  const WidgetCategory({super.key});

  @override
  State<WidgetCategory> createState() => _WidgetCategoryState();
}

class _WidgetCategoryState extends State<WidgetCategory> {
  CategoryQuotes? selectCategory;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<CategoryQuotes>> categoryEntries =
        <DropdownMenuEntry<CategoryQuotes>>[];
    for (final category in quoteController.listCategory) {
      if (category.category == null || category.categoryId == null) {
      } else {
        categoryEntries.add(
          DropdownMenuEntry<CategoryQuotes>(
            value: category,
            label: category.category!,
          ),
        );
      }
    }
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Repair Code'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              child: DropdownMenu<CategoryQuotes>(
                menuHeight: 500,
                enableFilter: true,
                enableSearch: true,
                inputDecorationTheme: InputDecorationTheme(
                  isDense: true,
                  constraints: BoxConstraints(maxHeight: 40, maxWidth: 200),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                dropdownMenuEntries: categoryEntries,
                onSelected: (CategoryQuotes? category) {
                  selectCategory = category;
                  quoteController.categoryId.value =
                      selectCategory?.categoryId ?? '';
                  quoteController.categoryName.value =
                      selectCategory?.categoryCode ?? '';
                },
              ),
            )
          ],
        ));
  }
}
