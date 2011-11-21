%% Author: ishii0514
%% Created: 2011/11/08
%% Description: TODO: Add description to spawn_test
-module(spawn_test).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([say_something/2,sec_start/0,con_start/0]).

%%
%% API Functions
%%
say_something(_What,0) ->
	done;
say_something(What,Times) ->
	io:format("~p~n",[What]),
	say_something(What,Times - 1).

sec_start() ->
	say_something(hello,3),
	say_something(goodby,3).

con_start() ->
	spawn(spawn_test,say_something,[hello,3]),
	spawn(spawn_test,say_something,[goodby,3]).

%%
%% Local Functions
%%

