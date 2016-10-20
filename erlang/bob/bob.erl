-module(bob).
-export([response_for/1]).

response_for(Question) ->
  case is_silence(Question) of
    true -> "Fine. Be that way!";
    false ->
      case is_uppercase(Question) of
        true -> "Whoa, chill out!";
        false ->
          case is_question(Question) of
            true -> "Sure.";
            false -> "Whatever."
          end
      end
  end.

is_uppercase(Question) ->
  NonLetters = fun(Char) -> string:to_lower(Char) == string:to_upper(Char) end,
  DontHaveLetters = lists:all(NonLetters, Question),
  is_uppercase(Question, DontHaveLetters).

is_uppercase(_, true) ->
  false;

is_uppercase(Question, false) ->
  Question == string:to_upper(Question).

is_question(Question) ->
  string:right(Question, 1) == "?".

is_silence(Question) ->
  (string:chars($ , string:len(Question)) == Question) or (Question == "").
