import '../../localization/l10n.dart';
import '../base_validator.dart';

class HasUppercaseCharsValidator extends BaseValidator<String> {
  HasUppercaseCharsValidator({
    this.atLeast = 1,
    RegExp? regex,

    /// {@macro base_validator_error_text}
    super.errorText,

    /// {@macro base_validator_null_check}
    super.checkNullOrEmpty,
  }) : regex = regex ?? _upperCase;

  final int atLeast;

  RegExp? regex;

  /// {@template upper_case_template}
  /// This regex matches any character that is not an uppercase letter (A-Z) or Ñ.
  ///
  /// - It includes special characters, digits, and lowercase letters.
  /// - It can be used to find non-uppercase characters.
  ///
  /// Examples: a, 1, @
  /// {@endtemplate}
  static final RegExp _upperCase = RegExp('[^A-ZÑ]');

  @override
  String? validateValue(String? valueCandidate) {
    return uppercaseCharLength(valueCandidate!) >= 1
        ? null
        : errorText ??
            FormBuilderLocalizations.current
                .containsUppercaseCharErrorText(atLeast);
  }

  int uppercaseCharLength(String value) {
    return value.replaceAll(_upperCase, '').length;
  }
}