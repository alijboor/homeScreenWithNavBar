import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/enums/e_languages.dart';
import 'package:home_screen/component/gap.dart';

class LanguageListView extends StatefulWidget {
  const LanguageListView({super.key});

  @override
  State<LanguageListView> createState() => _LanguageListViewState();
}

class _LanguageListViewState extends State<LanguageListView> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            ELanguage.values.length,
            (index) => InkWell(
                  onTap: () {
                    selected = index;
                    setState(() {});
                  },
                  child: Card(
                      shadowColor: Colors.grey.withOpacity(0.45),
                      elevation: 2.5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2.0,
                            color: selected == index
                                ? Colors.indigoAccent
                                : Colors.transparent,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 35,
                              height: 20,
                              child: Image.network(
                                  ELanguage.values[index].link,
                                  fit: BoxFit.fill),
                            ),
                            const Gap.h(20.0),
                            CustomText(text: ELanguage.values[index].name)
                          ],
                        ),
                      )),
                )).toList(),
      ),
    );
  }
}