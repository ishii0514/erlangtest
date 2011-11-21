%% Author: ishii0514
%% Created: 2011/11/21
%% Description: TODO: Add description to behavia
-module(behavia).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([call/2,start/1,loop/1]).

%%
%% API Functions
%%
start(Module) ->
	spawn(behavia,loop,[Module]).

loop(Module) ->
	receive
		{call,From,Req} ->
			Res = Module:handle_call(Req),
			From ! {self(),Res},
			loop(Module)
	end.

call(Pid,Req) ->
	Pid ! {call,self(),Req},
	receive
		{Pid,Response} ->
			Response
	end.


%%
%% Local Functions
%%

