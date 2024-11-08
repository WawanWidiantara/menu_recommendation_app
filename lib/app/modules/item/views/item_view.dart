import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/colors.dart';
import '../controllers/item_controller.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemController());

    return SafeArea(
      child: Scaffold(
          body: Obx(() => controller.itemDetail['id'] == null
              ? const SizedBox(
                  height: 10,
                  width: 10,
                )
              : Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Obx(() => Container(
                            height: Get.height * 0.6,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(controller
                                              .itemDetail['gambar'] !=
                                          null
                                      ? controller.itemDetail['gambar']
                                          .toString()
                                      : 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                                  fit: BoxFit.cover),
                            ),
                          )),
                    ),
                    Positioned(
                      top: Get.height * 0.53,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: Get.height * 0.55,
                        decoration: const BoxDecoration(
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
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(() => Text(
                                    controller.itemDetail['nama_item']
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                controller.itemDetail['deskripsi'].toString(),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SetStock(controller: controller),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonKeranjang(controller: controller),
                                  ButtonCatetan(controller: controller),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const BackArrowIcon(),
                  ],
                ))),
    );
  }
}

class BackArrowIcon extends StatelessWidget {
  const BackArrowIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: Get.width * (-0.8),
      right: 0,
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ButtonCatetan extends StatelessWidget {
  const ButtonCatetan({
    super.key,
    required this.controller,
  });

  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                const MaterialStatePropertyAll(ColorsCafe.mainBackground),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        onPressed: () {
          Get.bottomSheet(
            isScrollControlled: true,
            BottomSheet(controller: controller),
          );
          FocusScope.of(context).unfocus();
        },
        child: const ImageIcon(
          AssetImage('assets/icons/catatan.png'),
          color: ColorsCafe.primaryRed,
        ),
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    super.key,
    required this.controller,
  });

  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Get.height * 0.15),
        height: Get.height * 0.85,
        decoration: const BoxDecoration(
          color: ColorsCafe.popUpBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 20,
                  height: 5,
                  color: ColorsCafe.formStroke,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Tambahkan Catatan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: Get.height * 0.28,
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: ColorsCafe.formStroke),
                    bottom:
                        BorderSide(width: 1.0, color: ColorsCafe.formStroke),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormField(
                    controller: controller.catatanController,
                    maxLines: 9,
                    maxLength: 200,
                    autofocus: false,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ColorsCafe.greyText,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                      hintText: '',
                      filled: true,
                      fillColor: ColorsCafe.popUpBackground,
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorsCafe.popUpBackground),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorsCafe.popUpBackground),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonSimpanCatetan(controller: controller),
            ],
          ),
        ));
  }
}

class ButtonSimpanCatetan extends StatelessWidget {
  const ButtonSimpanCatetan({
    super.key,
    required this.controller,
  });

  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.25,
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(ColorsCafe.primaryRed),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
        onPressed: () {
          controller.insertCatatan(controller.catatanController.text);
          Get.back();
          FocusScope.of(context).unfocus();
        },
        child: const Text(
          "Simpan",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class ButtonKeranjang extends StatelessWidget {
  const ButtonKeranjang({
    super.key,
    required this.controller,
  });

  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.73,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(ColorsCafe.primaryRed),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
        onPressed: () {
          controller.postOrder();

          FocusScope.of(context).unfocus();
        },
        child: const Text(
          "+ Keranjang",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class SetStock extends StatelessWidget {
  const SetStock({
    super.key,
    required this.controller,
  });

  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 105,
          height: 35,
          decoration: BoxDecoration(
            color: ColorsCafe.mainBackground,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 35,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    controller.decrement();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor:
                        const MaterialStatePropertyAll(ColorsCafe.formStroke),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
              Obx(() => SizedBox(
                    width: 35,
                    child:
                        Center(child: Text(controller.count.value.toString())),
                  )),
              SizedBox(
                width: 35,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    controller.increment();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor:
                        const MaterialStatePropertyAll(ColorsCafe.primaryRed),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Obx(() => Text(
              controller.itemDetail["harga"] != null
                  ? 'Rp. ${controller.itemDetail["harga"] * controller.count.value}'
                  : 'Rp. 0',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            )),
      ],
    );
  }
}
