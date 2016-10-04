-module(accumulate).
-export([accumulate/2]).

accumulate(_, []) ->
  [];

accumulate(Fn, Ls) ->
  [H|T] = Ls,
  [Fn(H)] ++ accumulate(Fn, T).
