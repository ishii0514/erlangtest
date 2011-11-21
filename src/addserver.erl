%% Author: ishii0514
%% Created: 2011/11/14
%% Description: TODO: Add description to addserver
-module(addserver).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start_server/0,start_handler/1]).

%%
%% API Functions
%%

start_server() ->
	spawn(fun() -> server_loop() end).

start_handler(Pid) ->
	spawn(fun() -> handler(Pid) end).

%%
%% Local Functions
%%

server_loop() ->
	receive
		{add,X,Y} ->
			io:format("~p~n",[X+Y]),
			server_loop()
	end.

handler(Pid) ->
	link(Pid),
	handler_loop(Pid).

handler_loop(Pid) ->
	receive
		Message ->
			Pid ! Message,
			handler_loop(Pid)
	end.
