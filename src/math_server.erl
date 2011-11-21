%% Author: ishii0514
%% Created: 2011/11/09
%% Description: TODO: Add description to math_server
-module(math_server).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/0]).

%%
%% API Functions
%%

start() ->
	spawn(fun() -> loop() end).

%%
%% Local Functions
%%

loop() ->
	receive
		{add,From,X,Y} ->
			Z = X+Y,
			From ! Z,
			loop();
		{multi,From,X,Y} ->
			Z = X*Y,
			From ! Z,
			loop();
		{stop,From} ->
			io:format("stop server ~n",[]),
			From ! {ok,stop_server};
		Other ->
			io:format("~p is not supported.stop server.~n",[Other]),
			killed
	end.



		  
		  
		  