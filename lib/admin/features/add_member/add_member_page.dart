import 'package:flutter/material.dart';
import 'package:poker/admin/features/add_member/model/game_model.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({Key? key}) : super(key: key);

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  int _groupValue = -1;
  GameModel? selectedGame;
  List<GameModel> gameNameList = [];
  int? selectedRadioTile;
  int? selectedRadio;

  void onDrownDownValueSelected(GameModel value) {
    setState(() {
      selectedGame = value;
    });
  }
  setSelectedRadioTile(int? val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
  @override
  void initState() {
    selectedRadio = 0;
    selectedRadioTile = 0;
    gameNameList.add(GameModel('Valorant', 1));
    gameNameList.add(GameModel('Cs Go', 2));
    gameNameList.add(GameModel('PubG', 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBgPage(
      backImagePath: icDashboardBg,
      margin: AppConstants.zero,
      alignment: Alignment.topCenter,
      imagePath: icDashboardimg,
      widget: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
          appBar: AppUtils.commonAppBar(
              context: context,
              fontSize: AppConstants.sixteen,
              title: StringUtils.newMemberDetails,
              isShowEdit: false,
              actionTitle: StringUtils.edit),
          body: Container(

            decoration: AppUtils.containerDecoration(

                color: AppColor.colorDarkBlue.withOpacity(0.5), radius: 0),
            child: addMemberForm(),
          ),
        ),
      ),
    );
  }

  Widget addMemberForm() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: AppConstants.twentyFour,
              right: AppConstants.twentyFour,
              top: AppConstants.fortyFive,
              bottom: AppConstants.zero),
          decoration:
              AppUtils.containerDecoration(color: Colors.white.withOpacity(0.21)),
          child: Container(
            margin: EdgeInsets.only(
                top: AppConstants.twenty,
                left: AppConstants.ten,
                right: AppConstants.ten,
                bottom: AppConstants.twenty),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonFormTitleAndField(
                    title: StringUtils.firstName,
                    hint: StringUtils.your + StringUtils.firstName,
                    controller: AppUtils.tetFirstNameAdmin),
                commonFormTitleAndField(
                    title: StringUtils.emailAddress,
                    hint: StringUtils.emailHintAdmin,
                    controller: AppUtils.tetEmailAdmin),
                commonFormTitleAndField(
                    title: StringUtils.telephoneNumber,
                    hint: StringUtils.telephoneNumberHint,
                    controller: AppUtils.tetTeleNoAdmin,
                    isNumber: true),
                selectGameDropDown(),
                CommonTextWidget(
                  margintop: AppConstants.fifteen,
                  text: StringUtils.accType,
                  fontSize: AppConstants.fourteen,
                  fontWeight: FontWeight.w500,
                ),
                accTypeRadioBtn(),
              ],
            ),
          ),
        ),
        CommonButtonWidget(
            left: AppConstants.twentyFour,
            right: AppConstants.twentyFour,
            text: 'Submit',
            onPressed: () {},
            marginTop: AppConstants.twentyFour),
      ],
    );
  }

  Widget accTypeRadioBtn() {
    return Column(
      children: [
        AppUtils.commonSizedBox(height: AppConstants.fifteen),

        RadioListTile(
          value: 1,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          contentPadding: const EdgeInsets.all(0),
          groupValue: selectedRadioTile,
          title:CommonTextWidget(
              text: StringUtils.player,
              textColor: AppColor.colorWhite,
              fontSize: AppConstants.fourteen,
              fontWeight: FontWeight.w400),
          onChanged: (val) {
            print("Radio Tile pressed $val");
            setSelectedRadioTile(val);
          },
          activeColor: AppColor.colorEdit,

          selected: false,
        ),
        RadioListTile(
          value: 2,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          contentPadding: const EdgeInsets.all(0),
          groupValue: selectedRadioTile,
          title:CommonTextWidget(
              text: StringUtils.manager,
              textColor: AppColor.colorWhite,
              fontSize: AppConstants.fourteen,
              fontWeight: FontWeight.w400),
          onChanged: (val) {
            print("Radio Tile pressed $val");
            setSelectedRadioTile(val);
          },
          activeColor: AppColor.colorEdit,

          selected: true,
        ),

       // RadioListTile(value: value, groupValue: groupValue, onChanged: onChanged)
        /*RadioListTile(
          dense: true,
          selectedTileColor: AppColor.colorBlue,
          contentPadding: const EdgeInsets.all(0),
          value: 1,
          groupValue: _groupValue,
          title: CommonTextWidget(
              text: StringUtils.manager,
              textColor: AppColor.colorWhite,
              fontSize: AppConstants.fourteen,
              fontWeight: FontWeight.w400),
          onChanged: (newValue) => setState(() => _groupValue = newValue ?? -1),
          activeColor: AppColor.colorEdit,
          selected: true,
        ),*/
      ],
    );
  }

  Widget commonFormTitleAndField(
      {String? title,
      String? hint,
      TextEditingController? controller,
      bool? isNumber}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: title,
          fontSize: AppConstants.fourteen,
          fontWeight: FontWeight.w500,
        ),
        CommonTextField(
            isDense: true,
            controller: controller,
            inputTypes:
                isNumber ?? false ? TextInputType.number : TextInputType.name,
            marginTop: AppConstants.eight,
            hint: hint,
            fontSize: AppConstants.fourteen,
            fontWeight: FontWeight.w400,
            radius: AppConstants.eight),
        SizedBox(
          height: AppConstants.fifteen,
        )
      ],
    );
  }

  Widget selectGameDropDown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonTextWidget(
              text: StringUtils.selectGame,
            ),
          ],
        ),
        SizedBox(height: AppConstants.eight),
        Container(
          padding: EdgeInsets.only(
              left: AppConstants.ten,
              right: AppConstants.ten,
              top: AppConstants.ten,
              bottom: AppConstants.ten),
          // height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.colorGrayLight1,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(AppConstants.eight),
            color: AppColor.colorGrayLight1,
            shape: BoxShape.rectangle,
          ),
          child: DropdownButton<GameModel>(
            borderRadius: BorderRadius.circular(13),
            dropdownColor: AppColor.colorBottom,
            isDense: true,
            hint: CommonTextWidget(
                text: StringUtils.selectGame,
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.fourteen,
                textColor: AppColor.colorWhite),
            isExpanded: true,
            value: selectedGame,
            icon: const Icon(Icons.keyboard_arrow_down,
                color: AppColor.colorWhite),
            iconSize: 24,
            elevation: 16,
            style: AppUtils.textStyle(
                textColor: AppColor.colorWhite,
                fontSize: AppConstants.fourteen,
                fontWeight: FontWeight.w400),
            underline: const SizedBox(),
            onChanged: (GameModel? newValue) {
              onDrownDownValueSelected(newValue!);
            },
            items: gameNameList.map((GameModel gameModel) {
              return DropdownMenuItem<GameModel>(
                value: gameModel,
                child: Text(
                  gameModel.gameName.toString(),
                  style: AppUtils.textStyle(
                      textColor: AppColor.colorWhite,
                      fontSize: AppConstants.fourteen,
                      fontWeight: FontWeight.w400),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
