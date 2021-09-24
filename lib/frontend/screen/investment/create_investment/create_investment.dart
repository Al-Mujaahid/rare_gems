import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/investment/create_investment_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/entities/InvestmentPackage.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/input.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:smart_select/smart_select.dart';

class CreateInvestmentScreen extends StatelessWidget {
  const CreateInvestmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColumnSpace(55),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context) ,
                  child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24,),
                ),
                Expanded(
                  child: Center(
                    child: Text('New Investment', style: subtitleStyle.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black
                    ),),
                  ),
                )
              ],
            ),
            ColumnSpace(33),
            Text("Create Investment", style: subtitleStyle.copyWith(
              fontWeight: FontWeight.w600 , color: Colors.black
            ),),
            Expanded(
              child: Consumer<CreateInvestmentProvider>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ColumnSpace(30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select Package", style: formLabelTextStyle),
                            value.package == null ? Container(child: Text('Loading packages...'),) : SmartSelect.single(
                              title: "Select package",
                              value: '${value.package!.id ?? 0}',
                              onChange: (choice) {
                                value.setPackage = choice.value;
                              },
                              modalType: S2ModalType.fullPage,
                              choiceItems: [
                                ...value.packages.map((e) => S2Choice(
                                    value: '${e.id}', title: '${e.name}',
                                    subtitle: '${e.roi}% | 3 Month', meta: e.toJson()
                                ))
                              ],
                              tileBuilder: (context, value) {
                                return InkWell(
                                  onTap: () => value.showModal(),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage('${value.valueObject.meta['image']}'),
                                        ),
                                        RowSpace(16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Text("${value.valueDisplay}", style: interTextStyle.copyWith(
                                                fontSize: 17, fontWeight: FontWeight.w700
                                              ),),
                                              Text("${value.valueObject.subtitle}", style: interTextStyle.copyWith(
                                                  fontSize: 17, fontWeight: FontWeight.w700
                                              ),),
                                            ],
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black, size: 24,)
                                      ],
                                    ),
                                  ),
                                );
                              },
                              choiceBuilder: (context, choice, searchText) {
                                InvestmentPackage inv = InvestmentPackage.fromJson(choice.meta);
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
                                          backgroundImage: NetworkImage('${inv.image}'),
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
                                        RowSpace(16),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('$CURRENCY_SYMBOL ${moneyFormat.format(inv.pricePerSlot)}', style: interTextStyle.copyWith(
                                                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black
                                            ),),
                                            ColumnSpace(2),
                                            Text('Per Slot', style: interTextStyle.copyWith(
                                                fontWeight: FontWeight.w400, fontSize: 13
                                            ),)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        ColumnSpace(24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Number of Slot", style: formLabelTextStyle),
                            ColumnSpace(4),
                            TextFormField(
                              decoration: underlineInputDecoration(filled: false, hintText: "Enter number of slot"),
                              onChanged: (text) => value.setSlots = text,
                              keyboardType: TextInputType.number,
                            )
                          ],
                        ),
                        ColumnSpace(127),
                        Text("Investment Overview", style: subtitleStyle.copyWith(
                          fontWeight: FontWeight.w700,
                        ),),
                        ColumnSpace(11),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xFFEFEFF4)
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Amount To Invest", style: subtitleStyle.copyWith(
                                fontSize: 14,
                              ),),
                              ColumnSpace(2),
                              Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.investmentAmount)}", style: subtitleStyle.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 18
                              ),),
                              ColumnSpace(9),

                              Text("Duration", style: subtitleStyle.copyWith(
                                fontSize: 14,
                              ),),
                              ColumnSpace(2),
                              Text("6 Months", style: subtitleStyle.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 18
                              ),),
                              ColumnSpace(9),

                              Text("Expected Return", style: subtitleStyle.copyWith(
                                fontSize: 14,
                              ),),
                              ColumnSpace(2),
                              Text("$CURRENCY_SYMBOL ${moneyFormat.format((value.expectedAmount))}", style: subtitleStyle.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 18
                              ),),
                              ColumnSpace(9),

                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            RareGemPrimaryButton(
              child: Text("Proceed to checkout", style: subtitleStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.w600
              ),),
              onClick: () => Navigator.of(context).pushNamed(CHECKOUT_INVESTMENT_ROUTE),
            ),
            ColumnSpace(41),
          ],
        ),
      ),
    );
  }
}
