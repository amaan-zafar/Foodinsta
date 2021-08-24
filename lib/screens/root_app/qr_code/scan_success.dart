import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/theme.dart';

class ScanSuccessScreen extends StatelessWidget {
  const ScanSuccessScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Joy.png'),
                Container(
                  padding: EdgeInsets.only(top: 50, bottom: 15),
                  child: Column(
                    children: [
                      Text("Congratulations!",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Color.fromARGB(255, 0, 102, 255),
                              fontSize: 36)),
                      Text(
                        'You just won some FoodInsta coins',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Color.fromARGB(255, 225, 97, 34),
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 7),
                        child: Image.asset('assets/fi_coin.png'),
                      ),
                      Text(
                        '50', // TODO hardcoded coin amount
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Color.fromARGB(255, 225, 97, 34),
                            fontWeight: FontWeight.w900,
                            fontSize: 37),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  width: 311,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Styles.iconColor),
                              borderRadius: BorderRadius.circular(16)),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Redeem coins now!!!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          color: Styles.iconColor,
                                          fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomTextButton(
                        textOnButton: "Redeem them later",
                        onPressed: () {},
                        highlightColor: Color.fromARGB(255, 252, 188, 35),
                        color: Color.fromARGB(255, 252, 188, 35),
                      )
                    ],
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
