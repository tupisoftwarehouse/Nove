import "package:nove/domain/text_information_parser/text_information_value_object.dart";

final WORDS_WITH_NO_SYMBOL_OR_NUMBER = RegExp(
  r"#[\p{L}\p{M}\p{Nd}_]+|[\p{L}\p{M}]+(?:["
  "’-][p{L}p{M}]+)*|[p{Emoji_Presentation}p{Emoji}\uFE0F]",
  unicode: true,
);

final ZEROED_TEXT_INFORMATION = TextInformationValueObject(0, 0);

const SMALL_TEXT_AMOUNT_OF_WORDS = 20;

const SMALL_TEXT_LENGTH = 133;

const SMALL_TEXT_TO_BE_PARSED =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc molestie metus eu nibh pellentesque cursus. In quis ligula vitae metus.";

final TEXT_INFORMATION_FROM_SMALL_TEXT = TextInformationValueObject(
  SMALL_TEXT_AMOUNT_OF_WORDS,
  SMALL_TEXT_LENGTH,
);

const MARSHALLED_TEXT_INFORMATION_FROM_SMALL_TEXT =
    "{\"amountOfWords\":$SMALL_TEXT_AMOUNT_OF_WORDS,\"length\":$SMALL_TEXT_LENGTH}";
