import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

import '../controllers/item_controller.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Get.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                    ),
                    fit: BoxFit.cover),
              ),
              // color: ColorsCafe.primaryRed,
            ),
          ),
          Positioned(
            top: Get.height * 0.53,
            left: 0,
            right: 0,
            child: Container(
              height: Get.height * 0.55,
              decoration: BoxDecoration(
                color: ColorsCafe.popUpBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sushi Uzumaki',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: ColorsCafe.mainBackground,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            ColorsCafe.formStroke),
                                  ),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Center(child: Text('1')),
                              ),
                              Container(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            ColorsCafe.primaryRed),
                                  ),
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Rp. 20.000',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.73,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    ColorsCafe.primaryRed),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            onPressed: () {
                              // controller.kliklogin(
                              //     controller.emailController.text,
                              //     controller.passwordController.text);
                              Get.toNamed(Routes.BOTTOM_NAVBAR);
                              FocusScope.of(context).unfocus();
                              // controller.checkLogin();
                            },
                            child: const Text(
                              "+ Keranjang",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: const MaterialStatePropertyAll(
                                    ColorsCafe.mainBackground),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            onPressed: () {
                              // controller.kliklogin(
                              //     controller.emailController.text,
                              //     controller.passwordController.text);
                              // Get.toNamed(Routes.BOTTOM_NAVBAR);
                              Get.bottomSheet(
                                isScrollControlled: true,
                                Container(
                                    margin:
                                        EdgeInsets.only(top: Get.height * 0.15),
                                    height: Get.height * 0.85,
                                    decoration: BoxDecoration(
                                      color: ColorsCafe.popUpBackground,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              width: 20,
                                              height: 5,
                                              color: ColorsCafe.formStroke,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text('Tambahkan Catatan',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: Get.height * 0.28,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 1.0,
                                                    color:
                                                        ColorsCafe.formStroke),
                                                bottom: BorderSide(
                                                    width: 1.0,
                                                    color:
                                                        ColorsCafe.formStroke),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: TextFormField(
                                              maxLines: 10,
                                              maxLength: 200,
                                              autofocus: false,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: ColorsCafe.greyText,
                                              ),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 5, 0, 5),
                                                hintText: '',
                                                filled: true,
                                                fillColor:
                                                    ColorsCafe.popUpBackground,
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.red),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: ColorsCafe
                                                          .popUpBackground),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: ColorsCafe
                                                          .popUpBackground),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.25,
                                            height: 35,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      const MaterialStatePropertyAll(
                                                          ColorsCafe
                                                              .primaryRed),
                                                  shape: MaterialStatePropertyAll<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)))),
                                              onPressed: () {
                                                // controller.kliklogin(
                                                //     controller.emailController.text,
                                                //     controller.passwordController.text);
                                                Get.back();
                                                FocusScope.of(context)
                                                    .unfocus();
                                                // controller.checkLogin();
                                              },
                                              child: const Text(
                                                "Simpan",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                              FocusScope.of(context).unfocus();
                              // controller.checkLogin();
                            },
                            child: ImageIcon(
                              AssetImage('assets/icons/catatan.png'),
                              color: ColorsCafe.primaryRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: -325,
            right: 0,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
    );
  }
}