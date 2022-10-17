import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

//ignore: must_be_immutable
class CustomProfileWidget extends StatefulWidget {
  String? imagePath;
  final bool isEdit;
  final VoidCallback onClicked;
  double? widht;
  double? height;


  CustomProfileWidget({
    Key? key,
    this.imagePath,
    this.isEdit = false,
    this.height,
    this.widht,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomProfileWidgetState();
  }
}

class CustomProfileWidgetState extends State<CustomProfileWidget> {
  CroppedFile? imageFile;
  String? name = "";
  String? urlImage;

  onImageSelected(CroppedFile file) {
    setState(() {
      imageFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    const color = AppColor.colorWhite;
    return Center(
      child: Stack(
        children: [
          ClipOval(child: buildImage()),
          Visibility(
            visible:widget.isEdit,
            child: Positioned(
              top: AppConstants.zero,
              right: AppConstants.zero,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      openImageDialog(context, onImageSelected);
                    });
                  },
                  child: buildEditIcon(color)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    if (imageFile != null) {
      return commonContainerBox(ClipOval(
        child: Image.file(
          File(imageFile!.path),
          width: widget.widht,
          height: widget.height,
          fit: BoxFit.cover,
        ),
      ));
    }

    if (urlImage != null) {
      return commonContainerBox(Image.network(
        urlImage.toString(),
        width: widget.widht,
        height: widget.height,
        fit: BoxFit.cover,
      ));
    } else {
      //when i am used  AppUtils.containerDecoration UI was not rendring perfact then i am used this normal box BoxDecoration
      return commonContainerBox(Image.asset(
        icUsers,
        fit: BoxFit.fill,
      ));
    }
  }

  Widget commonContainerBox(Widget widgetView) {
    return Container(
      height: widget.height,
      width: widget.widht,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.colorWhite,
          width: AppConstants.two,
        ),
      ),
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          /*radius: AppConstants.radius10,*/

          child: widgetView),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.black,
        all: 0,
        child: buildCircle(
          color: color,
          all: AppConstants.ten,
          child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.black,
            size: AppConstants.twenty,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(

          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  openImageDialog(BuildContext context1, Function onImageSelected) {
    return showDialog(
        context: context1,
        builder: (BuildContext context) {
          return SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConstants.fourteen))),
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              title: Center(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(AppConstants.twelve),
                        child: CommonTextWidget(
                          text: StringUtils.selectAction,
                          textColor: AppColor.colorBlue,
                          fontSize: AppConstants.sixteen,
                        )),
                    Divider(
                      color: AppColor.colorToolBar,
                      height: AppConstants.two,
                    )
                  ],
                ),
              ),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () async {
                    Navigator.pop(context);
                    cropImage(2, onImageSelected, context1);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.photo,
                          size: 24, color: AppColor.colorBlue),

                      CommonTextWidget(
                        text: StringUtils.gallery.toCapitalize(),

                        textColor: AppColor.colorBlue,
                        fontSize: AppConstants.sixteen,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: AppColor.colorToolBar,
                  height: AppConstants.two,
                ),
                SimpleDialogOption(
                  onPressed: () async {
                    Navigator.pop(context);
                    cropImage(1, onImageSelected, context1);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.camera_alt_sharp,
                          size: 24, color: AppColor.colorBlue),
                     // AppUtils.commonSizedBox(boxWidth: AppConstants.width10),

                      CommonTextWidget(
                        text: StringUtils.camera,

                        textColor: AppColor.colorBlue,
                        fontSize: AppConstants.sixteen,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: AppColor.colorGreenLight,
                  height: AppConstants.two,
                ),
                SimpleDialogOption(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Center(
                      child:
                      CommonTextWidget(
                        text: StringUtils.cancel,

                        textColor: AppColor.colorBlue,
                        fontSize: AppConstants.sixteen,
                      )),
                ),
              ]);
        });
  }

  cropImage(int type, Function onImageSelected, BuildContext context) async {
    var image = await ImagePicker().pickImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery);

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image!.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColor.colorGreenLight,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    setState(() {
      imageFile = croppedFile;
    });
  }
}
