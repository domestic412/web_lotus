import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:web_lotus/assets/style.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';

class WidgetCategory extends StatefulWidget {
  const WidgetCategory({super.key});

  @override
  State<WidgetCategory> createState() => _WidgetCategoryState();
}

class _WidgetCategoryState extends State<WidgetCategory> {
  TextEditingController _controller = TextEditingController();
  // CategoryQuotes? selectCategory;
  @override
  Widget build(BuildContext context) {
    // final List<DropdownMenuEntry<CategoryQuotes>> categoryEntries =
    //     <DropdownMenuEntry<CategoryQuotes>>[];
    // for (final category in quoteController.listCategory) {
    //   if (category.category == null || category.categoryId == null) {
    //   } else {
    //     categoryEntries.add(
    //       DropdownMenuEntry<CategoryQuotes>(
    //         value: category,
    //         label: category.category!,
    //       ),
    //     );
    //   }
    // }
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'Category'),
        Container(
          width: 100,
          margin: const EdgeInsets.all(5),
          child: TypeAheadField<CategoryQuotes>(
            animationDuration: const Duration(milliseconds: 0),
            autoFlipDirection: true,
            suggestionsCallback: (search) => quoteController.listCategory
                .where((element) => element.categoryCode!
                    .toLowerCase()
                    .contains(search.toLowerCase()))
                .toList(),
            builder: (context, controller, focusNode) {
              _controller = controller;
              return TextField(
                controller: _controller,
                focusNode: focusNode,
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(0.0),
                  )),
                ),
              );
            },
            itemBuilder: (context, value) => ListTile(
              dense: true,
              title: Text(
                value.categoryCode!,
                style: style12_black,
              ),
            ),
            onSelected: (value) {
              _controller.text = value.categoryCode!;
              quoteController.categoryName.value = value.categoryCode!;
              quoteController.categoryId.value = value.categoryId!;
            },
          ),
        ),
        const Icon(
          Icons.search,
          size: 12,
        ),
        // Text('Repair Code'),
        // SizedBox(
        //   height: 5,
        // ),
        // Container(
        //   width: 200,
        //   child: DropdownMenu<CategoryQuotes>(
        //     menuHeight: 500,
        //     enableFilter: true,
        //     enableSearch: true,
        //     inputDecorationTheme: InputDecorationTheme(
        //       isDense: true,
        //       constraints: BoxConstraints(maxHeight: 40, maxWidth: 200),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(5),
        //       ),
        //     ),
        //     dropdownMenuEntries: categoryEntries,
        //     onSelected: (CategoryQuotes? category) {
        //       selectCategory = category;
        //       quoteController.categoryId.value =
        //           selectCategory?.categoryId ?? '';
        //       quoteController.categoryName.value =
        //           selectCategory?.categoryCode ?? '';
        //     },
        //   ),
        // )
      ],
    );
  }
}
