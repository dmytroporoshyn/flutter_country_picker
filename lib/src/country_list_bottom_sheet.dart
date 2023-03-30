import 'package:flutter/material.dart';

import 'country.dart';
import 'country_list_theme_data.dart';
import 'country_list_view.dart';

Future showCountryListBottomSheet({
  required BuildContext context,
  List<String>? favorite,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode = false,
  CountryListThemeData? countryListTheme,
  bool searchAutofocus = false,
  bool showWorldWide = false,
  bool showSearch = true,
  bool useSafeArea = false,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: useSafeArea,
    builder: (context) => _builder(
      context,
      favorite,
      exclude,
      countryFilter,
      showPhoneCode,
      countryListTheme,
      searchAutofocus,
      showWorldWide,
      showSearch,
    ),
  );
}

Widget _builder(
  BuildContext context,
  List<String>? favorite,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode,
  CountryListThemeData? countryListTheme,
  bool searchAutofocus,
  bool showWorldWide,
  bool showSearch,
) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = countryListTheme?.bottomSheetHeight ??
      device - (statusBarHeight + (kToolbarHeight / 1.5));

  Color? _backgroundColor = countryListTheme?.backgroundColor ??
      Theme.of(context).bottomSheetTheme.backgroundColor;
  if (_backgroundColor == null) {
    if (Theme.of(context).brightness == Brightness.light) {
      _backgroundColor = Colors.white;
    } else {
      _backgroundColor = Colors.black;
    }
  }

  final BorderRadius _borderRadius = countryListTheme?.borderRadius ??
      const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      );

  return Container(
    height: height,
    padding: countryListTheme?.padding,
    margin: countryListTheme?.margin,
    decoration: BoxDecoration(
      color: _backgroundColor,
      borderRadius: _borderRadius,
    ),
    child: CountryListView(
      exclude: exclude,
      favorite: favorite,
      countryFilter: countryFilter,
      showPhoneCode: showPhoneCode,
      countryListTheme: countryListTheme,
      searchAutofocus: searchAutofocus,
      showWorldWide: showWorldWide,
      showSearch: showSearch,
    ),
  );
}
