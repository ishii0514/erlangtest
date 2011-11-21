%% Author: ishii0514
%% Created: 2011/11/10
%% Description: TODO: Add description to server
-module(server).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start1/0,start2/0]).

%%
%% API Functions
%%

start1()->
	spawn(fun() -> loop() end).

start2() ->
	spawn(fun() -> reg() end).


%%
%% Local Functions
%%

reg() ->
	register(serv2,self()),
	loop().


loop() ->
	receive
		{add,X,Y} ->
			io:format("~p + ~p = ~p~n",[X,Y,X+Y]),
			loop();
		{mul,X,Y} ->
			io:format("~p * ~p = ~p~n",[X,Y,X*Y]),
			loop()
	end.
		  
			
		  



