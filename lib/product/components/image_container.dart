import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalle_flutter_mobile_app/core/extension/context_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../../features/home/model/dalle_model.dart';
import 'glass_box.dart';

class ImageContainer extends Container {
  final BuildContext context;
  final DallEModel? model;
  final int index;

  ImageContainer({
    super.key,
    required this.context,
    required this.model,
    required this.index,
  }) : super(
          padding: context.paddingLow,
          margin: context.paddingLow,
          child: MaterialButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Resmi Kaydet'),
                    content: const Text(
                        'Bu resmi kaydetmek istediğinize emin misiniz?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Hayır'),
                      ),
                      TextButton(
                        onPressed: () {
                          // saveImage(context);
                          _saveNetworkImage(
                            response: base64Decode(
                                model?.data?[index].b64_json ?? ""),
                          );
                          Navigator.pop(context);
                          //show snackbar message

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Resim Kaydedildi'),
                            ),
                          );
                        },
                        child: const Text('Evet'),
                      ),
                    ],
                  );
                },
              );
            },
            child: ClipRRect(
              borderRadius: context.containerRadius,
              child: SizedBox(
                width: context.width * .6,
                height: context.height * .4,
                child: Image.memory(
                  base64Decode(model?.data?[index].b64_json ?? ""),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        );
}

_saveNetworkImage({
  required Uint8List response,
}) async {
  // const String apiKey = "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";

  // var response = await Dio().get(
  //   url,
  //   options: Options(
  //     responseType: ResponseType.bytes,
  //     headers: {
  //       "Authorization": "Bearer $apiKey",
  //       'Content-Type': 'application/json',
  //     },
  //   ),
  // );
  ImageGallerySaver.saveImage(
    Uint8List.fromList(response),
    quality: 100,
    name: "dalle_image - ${DateTime.now()}",
  );
  print("Image saved");
}
