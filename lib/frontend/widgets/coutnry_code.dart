import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/entities/CountryCode.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:smart_select/smart_select.dart';

class CountryCodeWidget extends StatelessWidget {

  CountryCodeWidget({Key? key, required this.onSelect, required this.selected}) : super(key: key);
  Function onSelect;
  String selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select Country", style: formLabelTextStyle),
          FutureBuilder(
            future: countryCodeService.getAllCountry(),
            builder: (context, AsyncSnapshot<List<CountryCode>> snapshot) {
              if ([ConnectionState.waiting, ConnectionState.active].contains(snapshot.connectionState)) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if ([ConnectionState.done].contains(snapshot.connectionState)) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                List<CountryCode> countryCodes = snapshot.data!;
                return SmartSelect.single(
                  title: "Select country",
                  value: selected,
                  onChange: (value) => onSelect(value.valueObject),
                  modalType: S2ModalType.fullPage,
                  modalFilter: true,
                  choiceItems: [
                    ...countryCodes.map((e) =>
                        S2Choice(
                          value: e.dialCode, title: "${e.name}",
                          subtitle: "${e.dialCode}", meta: {
                            'country': e.name, 'code': e.dialCode
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
                              Text("${value.value} ${value.valueObject.meta['country']}", style: interTextStyle.copyWith(
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
              return Center(
                child: CircularProgressIndicator(),
              );

            },
          ),
        ],
      ),
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
