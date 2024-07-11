import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_pkg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;

  final String? hintText;
  final TextStyle? hintStyle;

  final TextStyle? textStyle;

  final String? title;
  final TextStyle? titleStyle;

  final String? subTitle;
  final TextStyle? subTitleStyle;


  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Iterable<String>? autofillHints;

  final bool isPassword;
  final bool isAmount;
  final bool autofocus;

  final Function(String text)? onChanged;
  final String? Function(String? value)? validator;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final bool isEnabled;
  final int? maxLines;
  final int? minLines;
  final TextCapitalization capitalization;
  final List<TextInputFormatter>? inputFormatters ;
  final double borderRadius;
  final Color? borderColor;

  final String? prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;

  final String? suffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final bool showBorder;
  final Color? fillColor;
  final void Function(String)? onSubmitted;
  final bool readOnly;
  final bool filled;
  final int? maxLength;


  const CustomTextField({
    super.key,
    this.hintText = 'Write something...',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text, this.inputAction = TextInputAction.next, this.maxLines = 1,
    this.minLines, this.onChanged, this.prefixIcon, this.prefixIconSize,
    this.capitalization = TextCapitalization.none, this.isPassword = false, this.isAmount = false,
    this.borderRadius = 10, this.showBorder = true, this.fillColor = ColorConstants.white50Color,
    this.suffixIcon, this.onSubmitted,
    this.maxLength, this.title, this.onTap,
    this.readOnly = false, this.filled = true, this.prefixIconColor,
    this.validator, this.suffixIconColor, this.inputFormatters,
    this.onEditingComplete, this.borderColor, this.textStyle, this.hintStyle,
    this.autofocus = false, this.titleStyle, this.autofillHints,
    this.subTitle, this.subTitleStyle, this.suffixIconSize

  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.title != null || widget.subTitle != null )...[
          Row(
            children: [
              if(widget.title != null)
              Expanded(
                child: Text(widget.title??"",
                  style: widget.titleStyle?? Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),),
              ),

              if(widget.subTitle != null)
              Text(widget.subTitle??"",
                style: widget.subTitleStyle?? Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, color: ColorConstants.gray300Color),),

            ],
          ),
          Dimens.spaceH6
        ],

        TextFormField(
          maxLines: widget.maxLines,
          minLines: widget.minLines ,
          controller: widget.controller,
          focusNode: widget.focusNode,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: widget.onTap,
          readOnly:widget.readOnly,
          style: widget.textStyle?? Get.textTheme.titleMedium!.copyWith(color: ColorConstants.darkGrayColor,fontWeight: FontWeight.w400),
          textInputAction: widget.inputAction,

          keyboardType: (widget.isAmount || widget.inputType == TextInputType.phone)
              ? const TextInputType.numberWithOptions(signed: false, decimal: true) : widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: widget.autofocus,

          autofillHints: widget.autofillHints?? (widget.inputType == TextInputType.name
              ? [AutofillHints.name]
              : widget.inputType == TextInputType.emailAddress
              ? [AutofillHints.email]
              : widget.inputType == TextInputType.phone
              ? [AutofillHints.telephoneNumber]
              : widget.inputType == TextInputType.streetAddress
              ? [AutofillHints.fullStreetAddress]
              : widget.inputType == TextInputType.url
              ? [AutofillHints.url]
              : widget.inputType == TextInputType.visiblePassword
              ? [AutofillHints.password]
              : null),
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters:   widget.inputFormatters ?? (widget.maxLength != null ? [LengthLimitingTextInputFormatter(widget.maxLength),]: null)  ,
          onEditingComplete: widget.onEditingComplete,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                    width: widget.showBorder ? 2 : 0,
                    color: widget.borderColor ?? ColorConstants.white300Color.withOpacity(widget.showBorder ? 1 : 0)),),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(width: widget.showBorder ? 2 : 0,
                    color:  widget.borderColor ?? ColorConstants.white300Color.withOpacity(widget.showBorder ? 1 : 0)),),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(width: widget.showBorder ? 2 : 0, color: ColorConstants.roseRedColor.withOpacity(widget.showBorder ? 1 : 0)),),
              focusedErrorBorder : OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(width: widget.showBorder ? 2 : 0, color: ColorConstants.roseRedColor.withOpacity(widget.showBorder ? 1 : 0)),),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(width: widget.showBorder ? 2 : 0, color: Theme.of(context).primaryColor.withOpacity(widget.showBorder ? 1 : 0) ),),

              errorStyle: Get.textTheme.titleMedium!.copyWith(color: ColorConstants.roseRedColor),
              hintText: widget.hintText,
              fillColor: widget.fillColor,
              hintStyle: widget.hintStyle ?? Get.textTheme.titleMedium!.copyWith(color: ColorConstants.gray300Color,fontWeight: FontWeight.w400),
              filled: widget.filled,
              isDense: true,

              contentPadding: EdgeInsets.symmetric(vertical: (widget.maxLines??1) >= 1 ? 10 : 0, horizontal:Dimens.space16),
              prefixIconConstraints: const BoxConstraints(minHeight: 40,maxHeight: 40,maxWidth: 40,minWidth: 40),
              suffixIconConstraints: const BoxConstraints(minHeight: 40,maxHeight: 40,maxWidth: 40,minWidth: 40),
              prefixIcon: widget.prefixIcon != null  ?
              FittedBox(fit: BoxFit.scaleDown,
                  child: SvgPicture.asset(widget.prefixIcon!,colorFilter: AppHelper.svgIconColor(widget.prefixIconColor), height: widget.prefixIconSize??20,fit: BoxFit.scaleDown,)) : null,

              suffixIcon: (widget.suffixIcon != null ?
              SvgPicture.asset(widget.suffixIcon!,colorFilter: AppHelper.svgIconColor(widget.suffixIconColor), height: widget.suffixIconSize??20,fit: BoxFit.scaleDown,) : widget.isPassword ?

              IconButton(icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: ColorConstants.gray300Color  ),
                  onPressed: _toggle) : null)),
          onFieldSubmitted: widget.onSubmitted ?? (text) => widget.nextFocus  != null ?
              FocusScope.of(context).requestFocus(widget.nextFocus) : null,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
