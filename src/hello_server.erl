%% Author: ishii0514
%% Created: 2011/11/08
%% Description: TODO: Add description to hello_server
-module(hello_server).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([loop/0]).

%%
%% API Functions
%%
loop()->
	receive
		{hello,X} ->
			io:format("hello:~p~n",[X]),
			loop();
		{erlang,X,Y} ->
			io:format("erlang:~p :~p~n",[X,Y]),
			loop();
		Other ->
			io:format("not supported:~p~n",[Other]),
			loop()
	end.


%%
%% Local Functions
%%

