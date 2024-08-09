import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/model/model_input_quote_detail.dart';

class InfoContQuote extends StatefulWidget {
  const InfoContQuote({super.key});

  @override
  State<InfoContQuote> createState() => _InfoContQuoteState();
}

class _InfoContQuoteState extends State<InfoContQuote> {
  ChargeTypeQuotes? selectCharge;
  ComponentQuotes? selectComponent;
  CategoryQuotes? selectCategory;
  ErrorQuotes? selectError;
  // PayerQuotes? selectPayer;

  @override
  Widget build(BuildContext context) {
    return buildInfoContQuote();
  }

  FutureBuilder<InitEQCQuote> buildInfoContQuote() {
    return FutureBuilder<InitEQCQuote>(
        future: quoteController.initEQC,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            quoteController.listCharge.value = snapshot.data!.chargeTypeQuotes!;
            final List<DropdownMenuEntry<ChargeTypeQuotes>> chargeEntries =
                <DropdownMenuEntry<ChargeTypeQuotes>>[];
            for (final charge in quoteController.listCharge) {
              chargeEntries.add(
                DropdownMenuEntry<ChargeTypeQuotes>(
                  value: charge,
                  label: charge.chargeType!,
                ),
              );
            }

            quoteController.listComponent.value =
                snapshot.data!.componentQuotes!;
            final List<DropdownMenuEntry<ComponentQuotes>> componentEntries =
                <DropdownMenuEntry<ComponentQuotes>>[];
            for (final component in quoteController.listComponent) {
              componentEntries.add(
                DropdownMenuEntry<ComponentQuotes>(
                  value: component,
                  label: component.component!,
                ),
              );
            }

            quoteController.listError.value = snapshot.data!.errorQuotes!;
            final List<DropdownMenuEntry<ErrorQuotes>> errorEntries =
                <DropdownMenuEntry<ErrorQuotes>>[];
            for (final error in quoteController.listError) {
              errorEntries.add(
                DropdownMenuEntry<ErrorQuotes>(
                  value: error,
                  label: error.error!,
                ),
              );
            }

            quoteController.listCategory.value = snapshot.data!.categoryQuotes!;
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

            // List listPayer = snapshot.data!.payerQuotes!;
            // final List<DropdownMenuEntry<PayerQuotes>> payerEntries =
            //     <DropdownMenuEntry<PayerQuotes>>[];
            // for (final payer in listPayer) {
            //   payerEntries.add(
            //     DropdownMenuEntry<PayerQuotes>(
            //       value: payer,
            //       label: payer.payer,
            //     ),
            //   );
            // }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: DataTable(
                      columnSpacing: 15,
                      horizontalMargin: 0,
                      dividerThickness: 0.0,
                      columns: <DataColumn>[
                        DataColumn(label: Text('Charge')),
                        DataColumn(label: Text('Container')),
                        DataColumn(label: Text('Gate In Date')),
                        DataColumn(label: Text('Component')),
                        DataColumn(label: Text('Detail of Damage')),
                        DataColumn(label: Text('Damage Code')),
                        DataColumn(label: Text('Quantity')),
                      ],
                      rows: <DataRow>[
                        DataRow(cells: [
                          DataCell(
                            Container(
                              width: 200,
                              child: DropdownMenu<ChargeTypeQuotes>(
                                width: 200,
                                menuHeight: 500,
                                dropdownMenuEntries: chargeEntries,
                                onSelected: (ChargeTypeQuotes? charge) {
                                  selectCharge = charge;
                                  quoteController.chargeTypeId.value =
                                      selectCharge?.chargeTypeId ?? '';
                                  quoteController.chargeName.value =
                                      selectCharge?.chargeTypeCode ?? '';
                                },
                              ),
                            ),
                          ),
                          DataCell(Container(
                            width: 200,
                            child: TextField(
                                controller: quoteController.container.value,
                                decoration: const InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder())),
                          )),
                          DataCell(Container(
                            width: 150,
                            child: TextField(
                              controller: quoteController.gateInDate.value,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2024),
                                    lastDate: DateTime(2123));
                                if (pickeddate != null) {
                                  quoteController.gateInDate.value.text =
                                      DateFormat('dd/MM/yyyy')
                                          .format(pickeddate);
                                  quoteController.gateInDate_send.value =
                                      DateFormat('MM/dd/yyyy')
                                          .format(pickeddate);
                                  print(pickeddate);
                                }
                              },
                            ),
                          )),
                          DataCell(Container(
                            width: 200,
                            child: DropdownMenu<ComponentQuotes>(
                              width: 200,
                              menuHeight: 500,
                              enableFilter: true,
                              enableSearch: true,
                              dropdownMenuEntries: componentEntries,
                              onSelected: (ComponentQuotes? component) {
                                selectComponent = component;
                                quoteController.componentId.value =
                                    selectComponent?.componentId ?? '';
                                quoteController.componentName.value =
                                    selectComponent?.componentCode ?? '';
                              },
                            ),
                          )),
                          DataCell(Container(
                            width: 200,
                            child: TextField(
                                controller: quoteController.detailDamage.value,
                                decoration: const InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder())),
                          )),
                          DataCell(
                            Container(
                              width: 200,
                              child: DropdownMenu<ErrorQuotes>(
                                width: 200,
                                menuHeight: 500,
                                enableFilter: true,
                                enableSearch: true,
                                dropdownMenuEntries: errorEntries,
                                onSelected: (ErrorQuotes? error) {
                                  selectError = error;
                                  quoteController.errorId.value =
                                      selectError?.errorId ?? '';
                                  quoteController.errorName.value =
                                      selectError?.errorCode ?? '';
                                },
                              ),
                            ),
                          ),
                          DataCell(
                            Container(
                              width: 50,
                              child: TextField(
                                controller: quoteController.quantity.value,
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          ),
                        ]),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: DataTable(
                      columnSpacing: 15,
                      horizontalMargin: 0,
                      columns: <DataColumn>[
                        DataColumn(label: Text('Dimension')),
                        DataColumn(label: Text('Length')),
                        DataColumn(label: Text('Width')),
                        DataColumn(label: Text('Location')),
                        DataColumn(label: Text('Repair Code')),
                        DataColumn(label: Text('Labor Cost')),
                        DataColumn(label: Text('Mr. Cost')),
                        DataColumn(label: Text('Total Cost')),
                        // DataColumn(label: Text('Payer')),
                      ],
                      rows: <DataRow>[
                        DataRow(cells: [
                          DataCell(Container(
                            width: 100,
                            child: TextField(
                              controller: quoteController.dimension.value,
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          )),
                          DataCell(Container(
                            width: 100,
                            child: TextField(
                              controller: quoteController.length.value,
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          )),
                          DataCell(Container(
                            width: 100,
                            child: TextField(
                              controller: quoteController.width.value,
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          )),
                          DataCell(Container(
                            width: 100,
                            child: TextField(
                              controller: quoteController.location.value,
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          )),
                          DataCell(Container(
                            width: 200,
                            child: DropdownMenu<CategoryQuotes>(
                              width: 200,
                              menuHeight: 500,
                              enableFilter: true,
                              enableSearch: true,
                              dropdownMenuEntries: categoryEntries,
                              onSelected: (CategoryQuotes? category) {
                                selectCategory = category;
                                quoteController.categoryId.value =
                                    selectCategory?.categoryId ?? '';
                                quoteController.categoryName.value =
                                    selectCategory?.categoryCode ?? '';
                              },
                            ),
                          )),
                          DataCell(Container(
                            width: 100,
                            child: TextField(
                              controller: quoteController.laborCost.value,
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          )),
                          DataCell(Container(
                            width: 100,
                            child: TextField(
                              controller: quoteController.mrCost.value,
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          )),
                          DataCell(Container(
                            width: 100,
                            child: TextField(
                              controller: quoteController.totalCost.value,
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          )),
                          // DataCell(Container(
                          //   width: 200,
                          //   child: DropdownMenu<PayerQuotes>(
                          //     width: 200,
                          //     menuHeight: 500,
                          //     enableFilter: true,
                          //     enableSearch: true,
                          //     dropdownMenuEntries: payerEntries,
                          //     onSelected: (PayerQuotes? payer) {
                          //       selectPayer = payer;
                          //       quoteController.payerId.value =
                          //           selectPayer?.payerId ?? 0;
                          //       quoteController.payerName.value =
                          //           selectPayer?.payer ?? '';
                          //     },
                          //   ),
                          // )),
                        ]),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        InputQuoteDetail _listInputQuoteDetail =
                            InputQuoteDetail(
                                eqcQuoteId: quoteController.eqcQuoteId.value,
                                chargeTypeId:
                                    quoteController.chargeTypeId.value,
                                componentId: quoteController.componentId.value,
                                categoryId: quoteController.categoryId.value,
                                errorId: quoteController.errorId.value,
                                container: quoteController.container.value.text,
                                inGateDate:
                                    quoteController.gateInDate_send.value,
                                damageDetail:
                                    quoteController.detailDamage.value.text,
                                quantity: int.parse(
                                    quoteController.quantity.value.text),
                                dimension: quoteController.dimension.value.text,
                                length: double.parse(
                                    quoteController.length.value.text),
                                width: double.parse(
                                    quoteController.width.value.text),
                                location: quoteController.location.value.text,
                                laborCost: double.parse(
                                    quoteController.laborCost.value.text),
                                mrCost: double.parse(
                                    quoteController.mrCost.value.text),
                                totalCost: double.parse(
                                    quoteController.totalCost.value.text),
                                estimateDate:
                                    quoteController.currentDate_send.value,
                                edit: 'I');
                        quoteController.listInputQuoteDetail
                            .add(_listInputQuoteDetail);
                        quoteController.countRow.value =
                            quoteController.countRow.value + 1;

                        InputQuoteDetail _listInputQuoteDetail_show =
                            InputQuoteDetail(
                          chargeTypeId: quoteController.chargeName.value,
                          componentId: quoteController.componentName.value,
                          categoryId: quoteController.categoryName.value,
                          errorId: quoteController.errorName.value,
                          container: quoteController.container.value.text,
                          inGateDate: quoteController.gateInDate.value.text,
                          damageDetail: quoteController.detailDamage.value.text,
                          quantity:
                              int.parse(quoteController.quantity.value.text),
                          dimension: quoteController.dimension.value.text,
                          length:
                              double.parse(quoteController.length.value.text),
                          width: double.parse(quoteController.width.value.text),
                          location: quoteController.location.value.text,
                          laborCost: double.parse(
                              quoteController.laborCost.value.text),
                          mrCost:
                              double.parse(quoteController.mrCost.value.text),
                          totalCost: double.parse(
                              quoteController.totalCost.value.text),
                        );
                        quoteController.listInputQuoteDetail_show
                            .add(_listInputQuoteDetail_show);
                        // print(quoteController.listInputQuoteDetail);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.orange),
                          minimumSize:
                              MaterialStateProperty.all(Size(100, 40))),
                      child: Text('ADD ROW'),
                    ),
                  ],
                )
              ],
            );
          }
          return Text('Error');
        });
  }
}
