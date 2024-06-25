import '../../localization/l10n.dart';
import '../base_validator.dart';

class HasSpecialCharsValidator extends BaseValidator<String> {
  HasSpecialCharsValidator({
    this.atLeast = 1,
    RegExp? regex,

    /// {@macro base_validator_error_text}
    super.errorText,

    /// {@macro base_validator_null_check}
    super.checkNullOrEmpty,
  }) : regex = regex ?? _specialChar;

  final int atLeast;

  RegExp? regex;

  /// {@template special_char_template}
  /// This regex matches any character that is not a letter (A-Z, a-z) or a digit (0-9).
  ///
  /// - It includes special characters and symbols.
  /// - It can be used to find non-alphanumeric characters.
  ///
  /// Examples: @, #, %
  /// {@endtemplate}
  static final RegExp _specialChar = RegExp('[A-Za-z0-9]');

  @override
  String? validateValue(String? valueCandidate) {
    return specialCharLength(valueCandidate!) >= atLeast
        ? null
        : errorText ??
            FormBuilderLocalizations.current
                .containsSpecialCharErrorText(atLeast);
  }

  int specialCharLength(String value) {
    return value.replaceAll(_specialChar, '').length;
  }
}