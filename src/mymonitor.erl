%% Author: ishii0514
%% Created: 2011/11/14
%% Description: TODO: Add description to addserver
-module(mymonitor).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start_monitor/0,start_server/0]).

%%
%% API Functions
%%

start_server() ->
	spawn(fun() -> server_loop() end).

start_monitor() ->
	spawn(fun() -> monitor_loop() end).

%%
%% Local Functions
%%

server_loop() ->
	receive
		{add,X,Y} ->
			io:format("add: ~p~n",[X+Y]),
			server_loop()
	end.

monitor_loop() ->
	receive
		{monitor,Pid} ->
			erlang:monitor(process,Pid),
			monitor_loop();
		{exit,Why} ->
			erlang:exit(Why);
		Other ->
			io:format("In monitor : ~p~n",[Other]),
			monitor_loop()
	end.
