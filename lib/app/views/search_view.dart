import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app_kurs/app/constants/color/app_colors.dart';
import 'package:weather_app_kurs/app/constants/decoration/app_decoration.dart';
import 'package:weather_app_kurs/app/constants/text_style/app_text_style.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  TextEditingController _controller = TextEditingController();
  String? text;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          height: size.height * 1,
          width: size.width * 1,
          decoration: AppDecoration.screenDecoration,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    // controller: _controller,
                    onChanged: (newValue) {
                      text = newValue;
                      log('onChanged ===> $text ');
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Icon(
                          Icons.search,
                          size: 40,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.black,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: AppColors.transparent,
                  child: Ink(
                    color: AppColors.blue,
                    child: InkWell(
                      splashColor: AppColors.grey,
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pop(context, text);
                        log('control ==> $text');
                      },
                      child: Container(
                        decoration: AppDecoration.buttonDecor,
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Aba yrayin tap',
                            style: AppTextStyle.black30w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
