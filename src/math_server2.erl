%% Author: ishii0514
%% Created: 2011/11/09
%% Description: TODO: Add description to math_server2
-module(math_server2).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/0,call/2]).

%%
%% API Functions
%%

start() ->
	spawn( fun() -> loop() end).

call(Pid,Message) ->
	Pid ! {self(),Message},
	receive 
		Return ->
			Return
	end.

%%
%% Local Functions
%%

loop()->
	receive
		{From,{add,X,Y}} ->
			Z = X + Y,
			From ! Z,
			loop();
		{From,{multi,X,Y}} ->
			Z = X * Y,
			From ! Z,
			loop();
		{From,stop} ->
			io:format("stop server ~n",[]),
			From ! {ok,stop_server};
		{From,Other} ->
			io:format("~p is not supported.stop server.~n",[Other]),
			From ! {get_unknown_type,server_killed}
	end.



		



