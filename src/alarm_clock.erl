%% Author: ishii0514
%% Created: 2011/11/08
%% Description: TODO: Add description to alarm_clock
-module(alarm_clock).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/1]).

%%
%% API Functions
%%
start(Time) ->
	clock(Time,0).


%%
%% Local Functions
%%

clock(Time,X) ->
	receive
		stop ->
			io:format("stop clock~n",[]),
			X;
		{change,NewTime} ->
			io:format("change span ~p to ~p~n",[Time,NewTime]),
			clock(NewTime,X);
		Other ->
			io:format("not supportd:~p~n",[Other]),
			clock(Time,X)
	after
		Time->
			io:format("~p mseconds~n",[X+Time]),
			clock(Time,X +Time)
	end.
		