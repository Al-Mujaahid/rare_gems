import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/entities/Bank.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:smart_select/smart_select.dart';

class BankListWidget extends StatefulWidget {

  BankListWidget({Key? key, required this.onSelect, required this.selected}) : super(key: key);
  Function onSelect;
  String selected;

  @override
  _BankListWidgetState createState() => _BankListWidgetState();
}

class _BankListWidgetState extends State<BankListWidget> {
  List<Bank> banks = [];

  fetchBankList() async {
    banks = await paystackService.getAllBanks();
    setState(() {
      banks = banks;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBankList();
  }
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: paystackService.getAllBanks(),
    //   builder: (context, AsyncSnapshot<List<Bank>> snapshot) {
    //     if ([ConnectionState.waiting, ConnectionState.active].contains(snapshot.connectionState)) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if ([ConnectionState.done].contains(snapshot.connectionState)) {
    //       if (snapshot.hasError) {
    //         return Text("${snapshot.error}");
    //       }
    //       List<Bank> countryCodes = snapshot.data!;
    //       return SmartSelect.single(
    //         title: "Select bank",
    //         value: widget.selected,
    //         onChange: (value) => widget.onSelect(value.valueObject),
    //         modalType: S2ModalType.fullPage,
    //         modalFilter: true,
    //         choiceItems: [
    //           ...countryCodes.map((e) =>
    //               S2Choice(
    //                   value: e.name, title: "${e.name}",
    //                   subtitle: "${e.country}", meta: {
    //                 'country': e.name, 'code': e.code
    //               }
    //               )
    //           )
    //         ],
    //         tileBuilder: (context, value) {
    //           return InkWell(
    //             onTap: () => value.showModal(),
    //             child: Container(
    //               margin: const EdgeInsets.only(top: 8),
    //               child: Row(
    //                 children: [
    //                   Expanded(
    //                     child: value.valueObject == null ?
    //                     Text("${value.title}", style: interTextStyle.copyWith(
    //                         fontSize: 17
    //                     ),)
    //                         :
    //                     Text("${value.value} ${value.valueObject.meta['country']}", style: interTextStyle.copyWith(
    //                         fontSize: 17
    //                     ),),
    //                   ),
    //                   Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black, size: 24,)
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //         choiceBuilder: (context, choice, searchText) {
    //           print("SearchText: $searchText");
    //           return _buildChoiceTile(choice);
    //         },
    //       );
    //     }
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //
    //   },
    // );
    return SmartSelect.single(
      title: "Select bank",
      value: widget.selected,
      onChange: (value) => widget.onSelect(value.valueObject),
      modalType: S2ModalType.fullPage,
      modalFilter: true,
      choiceItems: [
        ...banks.map((e) =>
            S2Choice(
                value: e.name, title: "${e.name}",
                subtitle: "${e.country}", meta: {
              'name': e.name, 'code': e.code
            }
            )
        )
      ],
      tileBuilder: (context, value) {
        return InkWell(
          onTap: () => value.showModal(),
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Expanded(
                  child: value.valueObject == null ?
                  Text("${value.title}", style: interTextStyle.copyWith(
                      fontSize: 17
                  ),)
                      :
                  Text("${value.value}", style: interTextStyle.copyWith(
                      fontSize: 17
                  ),),
                ),
                Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black, size: 24,)
              ],
            ),
          ),
        );
      },
      choiceBuilder: (context, choice, searchText) {
        print("SearchText: $searchText");
        return _buildChoiceTile(choice);
      },
    );
  }
}


Widget _buildChoiceTile(S2Choice choice) {
  return GestureDetector(
    onTap: () => choice.select(true),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 18),
      decoration: BoxDecoration(
          color: choice.selected ? primaryColor : Color(0xFFEFEFF4),
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            child: Text("${choice.title[0]+choice.title[1]}"),
          ),
          RowSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${choice.title}', style: interTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black
                ),),
                ColumnSpace(2),
                Text('${choice.subtitle}', style: interTextStyle.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 13
                ),)
              ],
            ),
          ),
        ],
      ),
    ),
  );
}