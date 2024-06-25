import '../../localization/l10n.dart';
import '../base_validator.dart';

class HasNumericCharsValidator extends BaseValidator<String> {
  HasNumericCharsValidator({
    this.atLeast = 1,
    RegExp? regex,

    /// {@macro base_validator_error_text}
    super.errorText,

    /// {@macro base_validator_null_check}
    super.checkNullOrEmpty,
  }) : regex = regex ?? _number;

  final int atLeast;

  RegExp? regex;

  /// {@template number_template}
  /// This regex matches any character that is not a digit (0-9).
  ///
  /// - It includes special characters, letters, and other non-numeric characters.
  /// - It can be used to find non-digit characters.
  ///
  /// Examples: a, A, @
  /// {@endtemplate}
  static final RegExp _number = RegExp('[^0-9]');

  @override
  String? validateValue(String? valueCandidate) {
    return numberCharLength(valueCandidate!) >= atLeast
        ? null
        : errorText ??
            FormBuilderLocalizations.current.containsNumberErrorText(atLeast);
  }

  int numberCharLength(String value) {
    return value.replaceAll(_number, '').length;
  }
}